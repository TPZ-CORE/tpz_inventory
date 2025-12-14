
local TPZ = exports.tpz_core:getCoreAPI()

Containers = {}
-----------------------------------------------------------
--[[ Functions ]]--
-----------------------------------------------------------

function GetContainerIdByName(containerName)

    for index, container in pairs (Containers) do

        if containerName == container.name then
            return tonumber(container.id) -- getting first result with the input container name. 
        end

    end

    -- in case the container does not exist or not found, we return nil. 
    return nil

end

function LoadContainerInventories()
    
    exports["ghmattimysql"]:execute("SELECT * FROM containers", {}, function(result)

        if result == nil or result[1] == nil then
			return
		end

        local loadCount                 = 0

        for _, res in pairs (result) do

            local container             = {}

            container.id                = tonumber(res.id)
            container.name              = res.name
            container.maxWeight         = tonumber(res.weight)
            container.data              = json.decode(res.data)

            if Config.UseDatabaseItems then
                
                container.inventory  = {}

                local decodedInventoryContents  = json.decode(res.items)
   
                for index, content in pairs (decodedInventoryContents) do
    
                    if content.type ~= "weapon" then

                        if SharedItems[content.item] then -- We are re-modifying important data on existing items if there were changes from items table.
                            content.weight         = SharedItems[content.item].weight
                            content.label          = SharedItems[content.item].label
                            content.remove         = SharedItems[content.item].remove
                            content.stackable      = SharedItems[content.item].stackable
                            content.droppable      = SharedItems[content.item].droppable
                            content.closeInventory = SharedItems[content.item].closeInventory
                        end

                    end
    
                    table.insert(container.inventory, content)

                end

            else
                container.inventory = json.decode(res.items)
            end

            Containers[tonumber(res.id)] = container

            loadCount = loadCount + 1

        end

        if Config.Debug then
            print("Successfully loaded {" .. loadCount .. "} containers.")
        end

    end)


end

-----------------------------------------------------------
--[[ Base Events ]]--
-----------------------------------------------------------

AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    Containers = nil
end)

-- The following function is registering (adding) a new container.
-- In order to load the a new container, it must also be called where the new container has been created.
RegisterServerEvent("tpz_inventory:registerContainerInventory")
AddEventHandler("tpz_inventory:registerContainerInventory", function(name, weight, create, contents, data)
    local _name   = name
    local _weight = weight
    local alreadyExist = false

    if create then
    
        alreadyExist = GetContainerIdByName(name)

        if not alreadyExist then
            local insert_data = '[]'

            if data ~= nil then 
                insert_data = json.encode(data)
            end

            local Parameters = { ['name'] = name, ['weight'] = weight, ['data'] = insert_data }
            exports.ghmattimysql:execute("INSERT INTO `containers` ( `name`, `weight`, `data`) VALUES ( @name, @weight, @data)", Parameters)

            Wait(1500)
        end
    end

    -- Based on the name and the weight, we are searching the ID directly from the containers database table to register it on the Containers List.
    exports["ghmattimysql"]:execute("SELECT * FROM `containers` WHERE `name` = @name AND `weight` = @weight", { ['name'] = _name, ['weight'] = _weight}, function(result)

        if alreadyExist then
            print('(!) Container with the name: ' .. name .. ' has already been registered.')
            return
        end

        local res = nil

        if result == nil or result[1] == nil then
            res           = {}
            res.id        = name
		else
            res = result[1]
        end

        if Containers[tonumber(res.id)] then
            print('(!) Container with the ID: ' .. res.id .. ' has already been registered.')
            return
        end

        local container      = {}

        container.id         = tonumber(res.id)

        container.name       = _name
        container.maxWeight  = tonumber(_weight)

        container.inventory  = contents or {}

        container.busy       = false
        container.data       = data == nil and {} or data
				
        Containers[tonumber(res.id)] = container

        if Config.Debug then
            print("Registered new container with the following id {" .. container.id .. "}.")
        end

    end)


end)

RegisterServerEvent("tpz_inventory:unregisterCustomContainer")
AddEventHandler("tpz_inventory:unregisterCustomContainer", function(containerId)

    containerId = tonumber(containerId)

    -- Don't do any action if for any reason the containerId returns nil.
    if Containers[containerId] == nil then
        print(string.format("Attempt to un-register a container with the id: %s. The container does not exist or not registered.", containerId))
        return
    end

    Containers[containerId] = nil

    exports.ghmattimysql:execute("DELETE FROM `containers` WHERE `id` = @id", {["id"] = containerId })

    if Config.Debug then
        print('The container with the id: ' .. containerId .. ' has been removed.')
    end
    
end)

RegisterServerEvent("tpz_inventory:registerCustomContainerInventoryContents")
AddEventHandler("tpz_inventory:registerCustomContainerInventoryContents", function(containerId, contents)

    containerId = tonumber(containerId)

    -- Don't do any action if for any reason the containerId returns nil.
    if Containers[containerId] == nil then
        return
    end

    Containers[containerId].inventory = nil -- we reset to make sure.
    Containers[containerId].inventory = contents

end)

RegisterServerEvent("tpz_inventory:upgradeContainerInventoryWeight")
AddEventHandler("tpz_inventory:upgradeContainerInventoryWeight", function(containerId, weight)
    local _source = source

    containerId = tonumber(containerId)

    -- Don't do any action if for any reason the containerId returns nil.
    if Containers[containerId] == nil then
        return
    end

    local container = Containers[containerId]

    if Containers[containerId].maxWeight ~= -1 then

        Containers[containerId].maxWeight = Containers[containerId].maxWeight + weight

        local Parameters = { 
            ['id']      = tonumber(containerId),
            ['weight']  = container.maxWeight + weight, 
        }
    
        Citizen.CreateThread(function()
            exports.ghmattimysql:execute("UPDATE `containers` SET `weight` = @weight WHERE `id` = @id", Parameters)
        end)
        
        TriggerClientEvent("tpz_inventory:refreshContainerInventory", _source)
    
    else
        print('attempted to upgrade a container (' .. containerId .. ') max weight. This container has already unlimited weight.')
    end

end)



RegisterServerEvent('tpz_inventory:onContainerInventoryClose')
AddEventHandler("tpz_inventory:onContainerInventoryClose", function(containerId)

    containerId = tonumber(containerId)

    -- Don't do any action if for any reason the containerId returns nil.
    if Containers[containerId] == nil then
        return
    end

    local container = Containers[containerId]

    local Parameters = { 
        ['id']     = tonumber(containerId),
        ['items']  = json.encode(container.inventory), 
    }

    Containers[containerId].busy = false

    Citizen.CreateThread(function()
        exports.ghmattimysql:execute("UPDATE `containers` SET `items` = @items WHERE `id` = @id", Parameters)
    end)

end)


RegisterServerEvent('tpz_inventory:saveContainerInventoryContents')
AddEventHandler("tpz_inventory:saveContainerInventoryContents", function(containerId)

    containerId = tonumber(containerId)

    -- Don't do any action if for any reason the containerId returns nil.
    if Containers[containerId] == nil then
        return
    end

    local container = Containers[containerId]

    local Parameters = { 
        ['id']     = tonumber(containerId),
        ['items']  = json.encode(container.inventory), 
    }

    Citizen.CreateThread(function()
        exports.ghmattimysql:execute("UPDATE `containers` SET `items` = @items WHERE `id` = @id", Parameters)
    end)
    

end)

RegisterServerEvent('tpz_inventory:setBusyState')
AddEventHandler("tpz_inventory:setBusyState", function(containerId, state)

    containerId = tonumber(containerId)

    -- Don't do any action if for any reason the containerId returns nil.
    if Containers[containerId] == nil then
        return
    end

    Containers[containerId].busy = state
    
end)

RegisterServerEvent("tpz_inventory:transferPlayerInventoryItem")
AddEventHandler("tpz_inventory:transferPlayerInventoryItem", function(targetPlayerId, inventory, item, quantity, event)
    local _source  = source
    local xPlayer  = TPZ.GetPlayer(_source)
    local _tsource = tonumber(targetPlayerId)
    local _item    = item
		
    if xPlayer.hasLostConnection() then 
        print(string.format('A player with the steam name as: %s and online id: %s, attempted to transfer an item on another player while his connection is lost.', GetPlayerName(_source), _source))
        return 
    end
		
    if inventory == 'main' then
        item.quantity = getItemQuantity(_source, item.item)

    elseif inventory == 'container' then 
        item.quantity = getItemQuantity(_tsource, item.item)
    end

    if item.quantity == 0 then
        item.quantity = 1
    end

    if (quantity > item.quantity) and (tostring(item.type) ~= '0' and tostring(item.type) ~= '1' and tostring(item.type) ~= '2') then
        TriggerClientEvent('tpz_core:sendRightTipNotification', _source, Locales['NOT_PERMITTED_TO_WITHDRAW_QUANTITY'], 3000)
        return
    end

    if inventory == "main" then

        if item.type == "item" then

            local canCarry = canCarryItem(_tsource, item.item, tonumber(quantity))

            if canCarry then

                removeItem(_source, item.item, tonumber(quantity), item.itemId)
                addItem(_tsource, item.item, tonumber(quantity), item.metadata, item.itemId)

                item.transfer_quantity = tonumber(quantity)
                TriggerClientEvent('tpz_inventory:onTransferItemUpdate', _source, inventory, item, event)

            else
                TriggerClientEvent('tpz_core:sendRightTipNotification', _source, Locales['CANNOT_CARRY_ITEM_CONTAINER'], 3000)
            end

        elseif item.type == "weapon" then

            local canCarry = canCarryWeapon(_tsource, item.item)
            
            if canCarry then

                removeWeapon(_source, item.item, item.itemId)

                addWeapon(_tsource, item.item, item.itemId, item.metadata)
                
                item.transfer_quantity = 1
                TriggerClientEvent('tpz_inventory:onTransferItemUpdate', _source, inventory, item, event)

            else
                TriggerClientEvent('tpz_core:sendRightTipNotification', _source, Locales['CANNOT_CARRY_WEAPON_CONTAINER'], 3000)
            end

        end

    else 

        if item.type == "item" then

            local canCarry = canCarryItem(_source, item.item, tonumber(quantity))

            if canCarry then

                removeItem(_tsource, item.item, tonumber(quantity), item.itemId)
                addItem(_source, item.item, tonumber(quantity), item.metadata, item.itemId)

                item.transfer_quantity = tonumber(quantity)
                TriggerClientEvent('tpz_inventory:onTransferItemUpdate', _source, inventory, item, event)

            else
                TriggerClientEvent('tpz_core:sendRightTipNotification', _source, Locales['CANNOT_CARRY_ITEM_CONTAINER'], 3000)
            end

        elseif item.type == "weapon" then

            local canCarry = canCarryWeapon(_source, item.item)
            
            if canCarry then

                removeWeapon(_tsource, item.item, item.itemId)

                addWeapon(_source, item.item, item.itemId, item.metadata)
                
                item.transfer_quantity = 1
                TriggerClientEvent('tpz_inventory:onTransferItemUpdate', _source, inventory, item, event)

            else
                TriggerClientEvent('tpz_core:sendRightTipNotification', _source, Locales['CANNOT_CARRY_WEAPON_CONTAINER'], 3000)
            end

        else

            local xPlayer = TPZ.GetPlayer(tonumber(_source))
            local tPlayer = TPZ.GetPlayer(tonumber(_tsource))

            local money = tPlayer.getAccount(tonumber(item.type))

            if quantity > money then 
                TriggerClientEvent('tpz_core:sendRightTipNotification', _source, Locales['NOT_PERMITTED_TO_WITHDRAW_MONEY'], 3000)
                return 
            end

            tPlayer.removeAccount(tonumber(item.type), quantity)
            xPlayer.addAccount(tonumber(item.type), quantity)

            item.transfer_quantity = quantity
            TriggerClientEvent('tpz_inventory:onTransferItemUpdate', _source, inventory, item, event)
        end

    end


end)

RegisterServerEvent("tpz_inventory:transferContainerItem")
AddEventHandler("tpz_inventory:transferContainerItem", function(containerId, inventory, item, quantity, cb)
    local _source = source
    local xPlayer = TPZ.GetPlayer(_source)
    local _item   = item

    containerId   = tonumber(containerId)

    math.randomseed( os.time() )
    Citizen.Wait( math.random(150, 250) )

    -- Don't do any action if for any reason the containerId returns nil.
    if Containers[containerId] == nil then
        return
    end
		
    if xPlayer.hasLostConnection() then 
        print(string.format('A player with the steam name as: %s and online id: %s, attempted to transfer an item on storages while his connection is lost.', GetPlayerName(_source), _source))
        return 
    end

    if inventory == 'main' then
        item.quantity = getItemQuantity(_source, item.item)

    elseif inventory == 'container' then 
        item.quantity = getContainerItemQuantity(containerId, item.item)
    end

    if item.quantity == 0 then
        item.quantity = 1
    end

    if quantity > item.quantity then
        TriggerClientEvent('tpz_core:sendRightTipNotification', _source, Locales['NOT_PERMITTED_TO_WITHDRAW_QUANTITY'], 3000)
        return
    end

    local container = Containers[containerId]

    if inventory == "main" then

        if item.type == "item" then

            local canCarry = canCarryContainerItem(containerId, item.item, tonumber(quantity))

            if canCarry then

                if not cb then
                    removeItem(_source, item.item, tonumber(quantity), item.itemId)
                end

                addContainerItem(containerId, item.item, item.itemId, tonumber(quantity), item.metadata)

                item.transfer_quantity = quantity
                TriggerClientEvent('tpz_inventory:onTransferItemUpdate', _source, inventory, item)
               -- TriggerClientEvent("tpz_inventory:refreshContainerInventory", _source)

            else
                TriggerClientEvent('tpz_core:sendRightTipNotification', _source, Locales['CANNOT_CARRY_ITEM_CONTAINER'], 3000)
            end

        elseif item.type == "weapon" then

            local canCarry = canCarryContainerWeapon(containerId, item.item)

            if canCarry then

                if not cb then
                    removeWeapon(_source, item.item, item.itemId)
                end
                
                addContainerWeapon(containerId, item.item, item.itemId, item.metadata)

                item.transfer_quantity = quantity
                TriggerClientEvent('tpz_inventory:onTransferItemUpdate', _source, inventory, item)
              --  TriggerClientEvent("tpz_inventory:refreshContainerInventory", _source)

            else
                TriggerClientEvent('tpz_core:sendRightTipNotification', _source, Locales['CANNOT_CARRY_WEAPON_CONTAINER'], 3000)
            end

        end

    elseif inventory == "container" then -- If inventory type is container, we transfer from the container into the main inventory.

        if item.type == "item" then

            local canCarry = canCarryItem(_source, item.item, tonumber(quantity))

            if canCarry then

                removeContainerItem(containerId, item.item, quantity, item.itemId)
                addItem(_source, item.item, tonumber(quantity), item.metadata, item.itemId)

                item.transfer_quantity = quantity
                TriggerClientEvent('tpz_inventory:onTransferItemUpdate', _source, inventory, item)
              --  TriggerClientEvent("tpz_inventory:refreshContainerInventory", _source)

            else
                TriggerClientEvent('tpz_core:sendRightTipNotification', _source, Locales['CANNOT_CARRY_ITEM'], 3000)
            end

        elseif item.type == "weapon" then

            local canCarry = canCarryWeapon(_source, item.item)

            if canCarry then

                removeContainerWeapon(containerId, item.item, item.itemId)
                addWeapon(_source, item.item, item.itemId, item.metadata)
                
                item.transfer_quantity = quantity
                TriggerClientEvent('tpz_inventory:onTransferItemUpdate', _source, inventory, item)
               -- TriggerClientEvent("tpz_inventory:refreshContainerInventory", _source)

            else
                TriggerClientEvent('tpz_core:sendRightTipNotification', _source, Locales['CANNOT_CARRY_WEAPON'], 3000)
            end
        end

    end

end)

-----------------------------------------------------------
--[[ Threads  ]]--
-----------------------------------------------------------

if Config.Eatables.Enabled and Config.Eatables.RemoveDurabilityOnContainers then 

    -- This system saves the items with durability on containers that are not allowlisted.
    Citizen.CreateThread(function()
        while true do

            Wait(60000 * Config.Eatables.SaveContainerUpdatesEvery)

            for _, container in pairs (Containers) do

                local inventoryData   = container.inventory
                local inventoryLength = GetTableLength(inventoryData)

                if not container.busy and not Config.Eatables.AllowlistedContainers[container.id] and not container.data.allowlisted and inventoryLength > 0 then

                    local contains = false

                    -- to update a container we check if this container contains items with durability and if an item
                    -- is an expirable item. 
                    for index, content in pairs (inventoryData) do

                        local ItemData = Config.Eatables.Items[content.item]

                        if ItemData and tonumber(content.stackable) == 0 then
                            contains = true
                        end
                    end

                    if contains then
                         
                        local Parameters = { 
                            ['id']     = tonumber(container.id),
                            ['items']  = json.encode(container.inventory), 
                        }

                        exports.ghmattimysql:execute("UPDATE `containers` SET `items` = @items WHERE `id` = @id", Parameters)
                    end

                end

            end

        end

    end)

    Citizen.CreateThread(function()
        while true do
            Wait(60000)
    
            for _, container in pairs (Containers) do 

                local inventoryData   = container.inventory
                local inventoryLength = GetTableLength(inventoryData)

                if not Config.Eatables.AllowlistedContainers[container.id] and not container.data.allowlisted and inventoryLength > 0 then

                    for index, content in pairs (inventoryData) do

                        local ItemData = Config.Eatables.Items[content.item]

                        if ItemData and tonumber(content.stackable) == 0 then

                            -- init duration if missing
                            content.duration = content.duration or 0

                            -- increase by 1 minute
                            content.duration = content.duration + 1

                            -- check if duration reached timer threshold
                            if content.duration >= ItemData.removeTime then

                                -- RESET duration counter
                                content.duration = 0

                                if content.metadata.durability > 0 then

                                    local removeValue = tonumber(ItemData.removeValue[1])
    
                                    if ItemData.removeValue[2] then
                                        local randomRemoveValue = math.random(ItemData.removeValue[1], ItemData.removeValue[2])
                                        removeValue = tonumber(randomRemoveValue)
                                    end
        
                                    content.metadata.durability = tonumber(content.metadata.durability) - removeValue
        
                                end
    
                                if content.metadata.durability <= 0 then
    
                                    content.metadata.durability = 0 
    
                                    removeContainerItem(container.id, content.item, 1, content.itemId)
    
                                    if ItemData.newItem then
    
                                        local canCarry = canCarryContainerItem(container.id, ItemData.newItem, 1)
    
                                        if canCarry then
                                            addContainerItem(container.id, ItemData.newItem, nil, 1)
                                        end
                                    end
        
                                end

                            end

                        end
    
                    end

                end

            end

        end

    end)

end

-----------------------------------------------------------
--[[ Callbacks  ]]--
-----------------------------------------------------------


-- @param id
exports.tpz_core:getCoreAPI().addNewCallBack("tpz_inventory:getContainerDataById", function(source, cb, data)
    local containerId = tonumber(data.id)

    if Containers[containerId] then 

        local container = Containers[containerId]

        return cb( { name = container.name, inventory = container.inventory,  maxWeight = tonumber(container.maxWeight), busy = container.busy } ) 
    end

    return cb(nil)

end)

exports.tpz_core:getCoreAPI().addNewCallBack("tpz_inventory:getContainerDataByName", function(source, cb, data)
       
    local containerId = GetContainerIdByName(data.name)

    if containerId then
        if Containers[containerId] then 

            local container = Containers[containerId]

            return cb( { containerId = containerId, name = container.name, inventory = container.inventory,  maxWeight = tonumber(container.maxWeight), busy = container.busy } ) 
        end
    end

    return cb(nil)

end)

exports.tpz_core:getCoreAPI().addNewCallBack("tpz_inventory:getPlayerInventoryData", function(source, cb, data)

    local target  = tonumber(data.target)
    local tPlayer = TPZ.GetPlayer(tonumber(target))

    local new_contents = {}

    local cash, gold, blackmoney = tPlayer.getAccount(0), tPlayer.getAccount(1), tPlayer.getAccount(2)

    if cash > 0 then
        table.insert(new_contents, { type = 0, item = 'cash', label = Locales['CURRENCY_MONEY'], quantity = tPlayer.getAccount(0), weight = 0.0, metadata = {} })   
    end

    if gold > 0 then
        table.insert(new_contents, { type = 1, item = 'gold', label = Locales['CURRENCY_GOLD'], quantity = tPlayer.getAccount(1), weight = 0.0, metadata = {} })
    end
    
    if blackmoney > 0 then
        table.insert(new_contents, { type = 2, item = 'blackmoney', label = Locales['CURRENCY_BLACKMONEY'], quantity = tPlayer.getAccount(2), weight = 0.0, metadata = {} })
    end

    for _, content in pairs (PlayerInventory[tonumber(target)].inventory) do 
        table.insert(new_contents, content)
    end

    local data = {
        name = tonumber(target),
        inventory = new_contents,
        maxWeight = tPlayer.getInventoryWeightCapacity(),
        busy      = false,
    }

    return cb(data)

end)









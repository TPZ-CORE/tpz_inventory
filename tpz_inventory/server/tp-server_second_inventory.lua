

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
AddEventHandler("tpz_inventory:registerContainerInventory", function(name, weight, create, contents)
    local _name   = name
    local _weight = weight

    if create then
    
        local Parameters = { ['name'] = name, ['weight'] = weight }
        exports.ghmattimysql:execute("INSERT INTO `containers` ( `name`, `weight`) VALUES ( @name, @weight)", Parameters)

        Wait(1500)
    end

    -- Based on the name and the weight, we are searching the ID directly from the containers database table to register it on the Containers List.
    exports["ghmattimysql"]:execute("SELECT * FROM `containers` WHERE `name` = @name AND `weight` = @weight", { ['name'] = _name, ['weight'] = _weight}, function(result)

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

    Containers[containerId].maxWeight = Containers[containerId].maxWeight + weight

    local Parameters = { 
        ['id']      = tonumber(containerId),
        ['weight']  = container.maxWeight + weight, 
    }

    Citizen.CreateThread(function()
        exports.ghmattimysql:execute("UPDATE `containers` SET `weight` = @weight WHERE `id` = @id", Parameters)
    end)

    TriggerClientEvent("tpz_inventory:refreshContainerInventory", _source)

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

-----------------------------------------------------------
--[[ Events  ]]--
-----------------------------------------------------------

RegisterServerEvent("tpz_inventory:transferContainerItem")
AddEventHandler("tpz_inventory:transferContainerItem", function(containerId, inventory, item, quantity, cb)
    local _source = source
    local _item   = item

    containerId   = tonumber(containerId)

    math.randomseed( os.time() )
    Citizen.Wait( math.random(150, 250) )

    -- Don't do any action if for any reason the containerId returns nil.
    if Containers[containerId] == nil then
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

    Citizen.CreateThread(function()
        while true do
            Wait(60000 * Config.Eatables.DurabilityRemovalTimer)
    
            for _, container in pairs (Containers) do 

                local inventoryData   = container.inventory
                local inventoryLength = GetTableLength(inventoryData)

                if inventoryLength > 0 then

                    for index, content in pairs (inventoryData) do

                        local ItemData = Config.Eatables.Items[content.item]

                        if ItemData and tonumber(content.stackable) == 0 then

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

    return nil

end)
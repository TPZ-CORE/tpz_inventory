local CURRENT_CONTAINER_ID     = 0
local SELECTED_CONTAINER_TITLE = nil

local DISABLE_CONTAINER_TRANSFERS = false

local TRANSFER_ITEMS_TYPE         = 'ALL'
local TRANSFER_ITEMS_LISTED_ITEMS = {}

-----------------------------------------------------------
--[[ Local Functions  ]]--
-----------------------------------------------------------

-----------------------------------------------------------
--[[ Functions  ]]--
-----------------------------------------------------------

function GetContainerWeight (inventoryContents)

    local inventory = inventoryContents
    local finished  = false

    local totalWeight = 0

    if inventory == nil or inventory and #inventory <= 0 then
        return 0 
    end
    
    for index, content in pairs (inventory) do

        if content.quantity > 0 then -- In case of bugged item quantity we check if quantity is more than 0.
            totalWeight = totalWeight + (content.quantity * content.weight)
        end

    end

    return totalWeight
end

function GetCurrentContainerId()
    return CURRENT_CONTAINER_ID
end

function ClearCurrentContainerId()
    CURRENT_CONTAINER_ID = 0
end

function openInventoryContainerByPlayerTarget(playerId, data, header, disable)

    if data.busy then
        -- already open from someone else
        return
    end

    DISABLE_CONTAINER_TRANSFERS = disable

    TRANSFER_ITEMS_TYPE         = 'ALL' -- reset
    TRANSFER_ITEMS_LISTED_ITEMS = {} -- reset
	
    local PlayerData = GetPlayerData()
    PlayerData.IsSecondaryInventoryOpen = true

    PlayerData.IsPlayerInventoryOpen    = true 
    PlayerData.PlayerInventoryId        = playerId

    local inventoryContents  = data.inventory
    local inventoryMaxWeight = data.maxWeight

    local weight = GetContainerWeight(inventoryContents)

    if #inventoryContents > 0 then

        for index, content in pairs (inventoryContents) do

            if content.type == 'item' and not Config.UseDatabaseItems then

                content.label          = SharedItems[content.item].label
                content.description    = SharedItems[content.item].description
                content.weight         = SharedItems[content.item].weight
                content.remove         = SharedItems[content.item].remove
                content.action         = SharedItems[content.item].action
                content.stackable      = SharedItems[content.item].stackable
                content.droppable      = SharedItems[content.item].droppable
                content.closeInventory = SharedItems[content.item].closeInventory
            else
                content.description = content.metadata.description
            end

            content.durability  = content.metadata.durability

            if content.type == "weapon" then
                content.label       = SharedWeapons.Weapons[string.upper(content.item)].label
                content.description = SharedWeapons.Weapons[string.upper(content.item)].description
                content.weight      = SharedWeapons.Weapons[string.upper(content.item)].weight
            end

            SendNUIMessage({ action = "updateSecondInventoryContents", item_data = content })
        end
    end
    
    OpenPlayerInventory(false) -- We are opening first the main player inventory.

    SendNUIMessage({ action = "setupSecondInventoryContents", inventory = inventoryContents })

    -- We are opening the second inventory last, after we update its contents.
    SendNUIMessage(
        {  
            action        = "setSecondInventoryState", 
    
            enable        = true,
            header        = header,
            isTarget      = isTarget,
    
            weight        = weight,
            maxWeight     = inventoryMaxWeight, 
			isAllowlisted = false,
        }
    )
    
end

function openInventoryContainerById(containerId, header, isTarget, disable, itemsList)

    -- @param inventory
    -- @param maxWeight
    TriggerEvent("tpz_core:ExecuteServerCallBack", "tpz_inventory:getContainerDataById", function(data)

        if data.busy then
            -- already open from someone else
            return
        end

        DISABLE_CONTAINER_TRANSFERS = disable

        TRANSFER_ITEMS_TYPE         = 'ALL' -- reset
        TRANSFER_ITEMS_LISTED_ITEMS = {} -- reset
    
        if itemsList then
            TRANSFER_ITEMS_TYPE         = itemsList.type -- ALLOWLISTED, BLACKLISTED
            TRANSFER_ITEMS_LISTED_ITEMS = itemsList.items
        end
			
        local PlayerData = GetPlayerData()
        PlayerData.IsSecondaryInventoryOpen = true

        TriggerEvent('tpz_inventory:setSecondaryInventoryOpenState', true)

        local inventoryContents  = data.inventory
        local inventoryMaxWeight = data.maxWeight

        local weight             = GetContainerWeight(inventoryContents)

        if #inventoryContents > 0 then

            for index, content in pairs (inventoryContents) do

                if content.type == 'item' and not Config.UseDatabaseItems then

                    content.label          = SharedItems[content.item].label
                    content.description    = SharedItems[content.item].description
                    content.weight         = SharedItems[content.item].weight
                    content.remove         = SharedItems[content.item].remove
                    content.action         = SharedItems[content.item].action
                    content.stackable      = SharedItems[content.item].stackable
                    content.droppable      = SharedItems[content.item].droppable
                    content.closeInventory = SharedItems[content.item].closeInventory
                else
                    content.description = content.metadata.description
                end

                content.durability  = content.metadata.durability

                if content.type == "weapon" then
                    content.label       = SharedWeapons.Weapons[string.upper(content.item)].label
                    content.description = SharedWeapons.Weapons[string.upper(content.item)].description
                    content.weight      = SharedWeapons.Weapons[string.upper(content.item)].weight
                end

                SendNUIMessage({ action = "updateSecondInventoryContents", item_data = content })
            end
        end

        OpenPlayerInventory(false) -- We are opening first the main player inventory.

        SendNUIMessage({ action = "setupSecondInventoryContents", inventory = inventoryContents })

        local isAllowlisted = ( (Config.Eatables.AllowlistedContainers[containerId]) or (data.data and data.data.allowlisted == 1))

        -- We are opening the second inventory last, after we update its contents.
        SendNUIMessage(
            {  
                action        = "setSecondInventoryState", 
        
                enable        = true,
                header        = header,
                isTarget      = isTarget,
        
                weight        = weight,
                maxWeight     = inventoryMaxWeight, 
                isAllowlisted = isAllowlisted,
					
            }
        )
        
        CURRENT_CONTAINER_ID = containerId

        TriggerServerEvent("tp_containers:server:setBusyState", CURRENT_CONTAINER_ID, true)

    end, { id = containerId } )

end

function openInventoryContainerByName(containerName, header, isTarget, disable, itemsList)

    -- @param inventory
    -- @param maxWeight
    TriggerEvent("tpz_core:ExecuteServerCallBack", "tpz_inventory:getContainerDataByName", function(data)

        if data.busy then
            -- already open from someone else
            return
        end

        local containerId = tonumber(data.containerId)

        DISABLE_CONTAINER_TRANSFERS = disable

        TRANSFER_ITEMS_TYPE         = 'ALL' -- reset
        TRANSFER_ITEMS_LISTED_ITEMS = {} -- reset
    
        if itemsList then
            TRANSFER_ITEMS_TYPE         = itemsList.type -- ALLOWLISTED, BLACKLISTED
            TRANSFER_ITEMS_LISTED_ITEMS = itemsList.items
        end
			
        local PlayerData = GetPlayerData()
        PlayerData.IsSecondaryInventoryOpen = true

        TriggerEvent('tpz_inventory:setSecondaryInventoryOpenState', true)

        local inventoryContents  = data.inventory
        local inventoryMaxWeight = data.maxWeight

        local weight             = GetContainerWeight(inventoryContents)

        if #inventoryContents > 0 then

            for index, content in pairs (inventoryContents) do

                if content.type == 'item' and not Config.UseDatabaseItems then

                    content.label          = SharedItems[content.item].label
                    content.description    = SharedItems[content.item].description
                    content.weight         = SharedItems[content.item].weight
                    content.remove         = SharedItems[content.item].remove
                    content.action         = SharedItems[content.item].action
                    content.stackable      = SharedItems[content.item].stackable
                    content.droppable      = SharedItems[content.item].droppable
                    content.closeInventory = SharedItems[content.item].closeInventory
                else
                    content.description = content.metadata.description
                end

                content.durability  = content.metadata.durability

                if content.type == "weapon" then
                    content.label       = SharedWeapons.Weapons[string.upper(content.item)].label
                    content.description = SharedWeapons.Weapons[string.upper(content.item)].description
                    content.weight      = SharedWeapons.Weapons[string.upper(content.item)].weight
                end

                SendNUIMessage({ action = "updateSecondInventoryContents", item_data = content })
            end
        end

        OpenPlayerInventory(false) -- We are opening first the main player inventory.

        SendNUIMessage({ action = "setupSecondInventoryContents", inventory = inventoryContents })

        local isAllowlisted = ( (Config.Eatables.AllowlistedContainers[containerId]) or (data.data and data.data.allowlisted == 1))

        -- We are opening the second inventory last, after we update its contents.
        SendNUIMessage(
            {  
                action        = "setSecondInventoryState", 
        
                enable        = true,
                header        = header,
                isTarget      = isTarget,
        
                weight        = weight,
                maxWeight     = inventoryMaxWeight, 
                isAllowlisted = isAllowlisted,
					
            }
        )
        
        CURRENT_CONTAINER_ID = containerId

        TriggerServerEvent("tp_containers:server:setBusyState", CURRENT_CONTAINER_ID, true)

    end, { name = containerName } )

end

-----------------------------------------------------------
--[[ Events  ]]--
-----------------------------------------------------------

-- The specified event is used to not only use exports but events instead which are better for tasks performance.
RegisterNetEvent('tpz_inventory:setSecondaryInventoryOpenState')
AddEventHandler("tpz_inventory:setSecondaryInventoryOpenState", function(cb)
    -- todo nothing
end)

RegisterNetEvent('tpz_inventory:openInventoryContainerById')
AddEventHandler("tpz_inventory:openInventoryContainerById", function(containerId, header, isTarget, disable, itemsList)
    openInventoryContainerById(containerId, header, isTarget or false, disable or false, itemsList)
end)

RegisterNetEvent('tpz_inventory:openInventoryContainerByPlayerTarget')
AddEventHandler("tpz_inventory:openInventoryContainerByPlayerTarget", function(playerId, data, header, disable, event)
    local PlayerData = GetPlayerData()
    openInventoryContainerByPlayerTarget(playerId, data, header, disable, event)
    PlayerData.PlayerInventoryRetrieveDataEvent = event
end)

RegisterNetEvent('tpz_inventory:onTransferItemUpdate')
AddEventHandler("tpz_inventory:onTransferItemUpdate", function(inventoryType, item, playerevent)
	local WeaponAPI  = exports.tpz_weapons:getWeaponsAPI()
    local content    = item
    local PlayerData = GetPlayerData()

    local containerData 
    local await = true

    if PlayerData.IsPlayerInventoryOpen then 
        containerData = exports.tpz_core:ClientRpcCall().Callback.TriggerAwait("tpz_inventory:getPlayerInventoryData", { target = PlayerData.PlayerInventoryId } )
        await = false
    else
        containerData = exports.tpz_core:ClientRpcCall().Callback.TriggerAwait("tpz_inventory:getContainerDataById", { id = CURRENT_CONTAINER_ID } )
        await = false
    end

    while await do 
        Wait(10)
    end

    if containerData == nil then 
        return 
    end
		
    if content.type == 'item' and not Config.UseDatabaseItems then

        content.label          = SharedItems[content.item].label
        content.description    = SharedItems[content.item].description
        content.weight         = SharedItems[content.item].weight
        content.remove         = SharedItems[content.item].remove
        content.action         = SharedItems[content.item].action
        content.stackable      = SharedItems[content.item].stackable
        content.droppable      = SharedItems[content.item].droppable
        content.closeInventory = SharedItems[content.item].closeInventory
    else
        content.description = content.metadata.description
    end

    content.durability  = content.metadata.durability
    content.usedType    = 0

    if content.type == "weapon" then
        
        content.label       = SharedWeapons.Weapons[string.upper(content.item)].label
        content.description = SharedWeapons.Weapons[string.upper(content.item)].description
        content.weight      = SharedWeapons.Weapons[string.upper(content.item)].weight

        if not SharedWeapons.Weapons[string.upper(content.item)].displayDurability then
            content.durability  = -1
        end
                
        local WeaponData = WeaponAPI.getUsedWeaponData()

        if WeaponData.weaponId == content.itemId then
            content.usedType = 1
           
        end

    end

    if inventoryType == 'main' then
        SendNUIMessage({ action = "updatePlayerInventoryContents", item_data = content, transfer_type = 'REMOVE' }) -- remove from

        if (tostring(content.type) ~= '0' and tostring(content.type) ~= '1' and tostring(content.type) ~= '2') then
            SendNUIMessage({ action = "updateSecondInventoryContents", item_data = content, transfer_type = 'ADD' }) -- add to.
        else 
            SendNUIMessage({ action = "updateAccount", item_data = content }) -- add to.
        end

    else

        if (tostring(content.type) ~= '0' and tostring(content.type) ~= '1' and tostring(content.type) ~= '2') then
            SendNUIMessage({ action = "updatePlayerInventoryContents", item_data = content,  transfer_type = 'ADD' }) -- add to.
        else 
            SendNUIMessage({ action = "updateAccount", item_data = content }) -- add to.
        end

        SendNUIMessage({ action = "updateSecondInventoryContents", item_data = content,  transfer_type = 'REMOVE' }) -- remove from
    end


    -- Setup player inventory contents and weight.
    for index, content in pairs (PlayerData.Inventory) do

        content.usedType = 0

        if content.type == "weapon" then
                
            local WeaponData = WeaponAPI.getUsedWeaponData()

            if WeaponData.weaponId == content.itemId then
                content.usedType = 1
            end
        end
    end

    SendNUIMessage({ action = "setupPlayerInventoryContents", inventory = PlayerData.Inventory })

    local currentWeight = getWeight()
    SendNUIMessage({ action = "updatePlayerInventoryWeight", weight = round(currentWeight, 3), maxWeight = PlayerData.InventoryMaxWeight .. Config.InventoryWeightLabel })

    -- Setup secondary inventory contents and weight.
    local containerInventoryContents  = containerData.inventory
    local containerInventoryMaxWeight = containerData.maxWeight
    local containerCurrentWeight      = GetContainerWeight(containerInventoryContents)

    SendNUIMessage({ action = "updateContainerInventoryWeight", weight = round(containerCurrentWeight, 3), maxWeight = containerInventoryMaxWeight } )
    SendNUIMessage({ action = "setupSecondInventoryContents", inventory = containerInventoryContents })

end)


-----------------------------------------------------------
--[[ NUI Callbacks  ]]--
-----------------------------------------------------------

-- @param item
-- @param inventory
-- @param quantity
RegisterNUICallback('nui:transferItem', function(data)
    local item          = data.item

    local inventoryType = data.inventory
    local quantity      = tonumber(data.quantity)

    if quantity <= 0 or quantity == nil then
        return
    end

    -- Disabled container transfers
    if inventoryType == 'main' and DISABLE_CONTAINER_TRANSFERS then 
        
        TriggerEvent('tpz_core:sendBottomTipNotification', Locales['NOT_PERMITTED_TO_TRANSFER'], 3000)
        return
    end

    if TRANSFER_ITEMS_TYPE ~= 'ALL' then

        local isPermittedToTransfer = true
			
        if TRANSFER_ITEMS_TYPE == 'BLACKLISTED' or TRANSFER_ITEMS_TYPE == 'BLACKLIST' then

            isPermittedToTransfer = true
            
            for _, blacklistedItem in pairs (TRANSFER_ITEMS_LISTED_ITEMS) do

                if blacklistedItem == item.item then
                    isPermittedToTransfer = false
                end

            end

        elseif TRANSFER_ITEMS_TYPE == 'ALLOWLISTED' or TRANSFER_ITEMS_TYPE == 'ALLOWLIST' then

            isPermittedToTransfer = false

            for _, allowlistedItem in pairs (TRANSFER_ITEMS_LISTED_ITEMS) do

                if allowlistedItem == item.item then
                    isPermittedToTransfer = true
                end

            end

        end

        if not isPermittedToTransfer then
            TriggerEvent('tpz_core:sendBottomTipNotification', Locales['NOT_PERMITTED_TO_TRANSFER_ITEM'], 3000)
            return
        end

    end

    local PlayerData = GetPlayerData()

    if not PlayerData.IsPlayerInventoryOpen then
        TriggerServerEvent("tpz_inventory:transferContainerItem", CURRENT_CONTAINER_ID, inventoryType, item, quantity)
    else
        TriggerServerEvent("tpz_inventory:transferPlayerInventoryItem", PlayerData.PlayerInventoryId, inventoryType, item, quantity, PlayerData.PlayerInventoryRetrieveDataEvent)
    end

end)









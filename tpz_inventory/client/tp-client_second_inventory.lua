local CURRENT_CONTAINER_ID     = 0
local SELECTED_CONTAINER_TITLE = nil

local DISABLE_CONTAINER_TRANSFERS = false

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

function openInventoryContainerById(containerId, header, isTarget, disable)

    -- @param inventory
    -- @param maxWeight
    TriggerEvent("tpz_core:ExecuteServerCallBack", "tpz_inventory:getContainerDataById", function(data)

        if data.busy then
            -- already open from someone else
            return
        end

        DISABLE_CONTAINER_TRANSFERS = disable

        local PlayerData = GetPlayerData()
        PlayerData.IsSecondaryInventoryOpen = true

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

        -- We are opening the second inventory last, after we update its contents.
        SendNUIMessage(
            {  
                action        = "setSecondInventoryState", 
        
                enable        = true,
                header        = header,
                isTarget      = isTarget,
        
                weight        = weight,
                maxWeight     = inventoryMaxWeight, 
            }
        )
        
        CURRENT_CONTAINER_ID = containerId

        TriggerServerEvent("tp_containers:server:setBusyState", CURRENT_CONTAINER_ID, true)

    end, { id = containerId } )

end

-----------------------------------------------------------
--[[ Events  ]]--
-----------------------------------------------------------

local acc = 'TPZ-D27M02Y25@$'

RegisterNetEvent('tpz_inventory:openInventoryContainerById')
AddEventHandler("tpz_inventory:openInventoryContainerById", function(containerId, header, var)
    if tostring(acc) == tostring(var) then
        openInventoryContainerById(containerId, header, false, false)
    end

end)

RegisterNetEvent('tpz_inventory:onTransferItemUpdate')
AddEventHandler("tpz_inventory:onTransferItemUpdate", function(inventoryType, item)

    local content    = item
    local PlayerData = GetPlayerData()

    TriggerEvent("tpz_core:ExecuteServerCallBack", "tpz_inventory:getContainerDataById", function(containerData)

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

            local WeaponData = GetUsedWeaponData()

            if WeaponData.weaponId == content.itemId then
                content.usedType = 1
               
            end

        end

        if inventoryType == 'main' then
            SendNUIMessage({ action = "updatePlayerInventoryContents", item_data = content, transfer_type = 'REMOVE' }) -- remove from
            SendNUIMessage({ action = "updateSecondInventoryContents", item_data = content, transfer_type = 'ADD' }) -- add to.
    
        else
            SendNUIMessage({ action = "updatePlayerInventoryContents", item_data = content,  transfer_type = 'ADD' }) -- add to.
            SendNUIMessage({ action = "updateSecondInventoryContents", item_data = content,  transfer_type = 'REMOVE' }) -- remove from
        end
    

        -- Setup player inventory contents and weight.
        for index, content in pairs (PlayerData.Inventory) do

            content.usedType = 0

            if content.type == "weapon" then
                    
                local WeaponData = GetUsedWeaponData()

                if WeaponData.weaponId == content.itemId then
                    content.usedType = 1
                end
            end
        end

        SendNUIMessage({ action = "setupPlayerInventoryContents", inventory = PlayerData.Inventory })
    
        local currentWeight = getWeight()
        SendNUIMessage({ action = "updatePlayerInventoryWeight", weight = round(currentWeight, 3), maxWeight = Config.InventoryMaxWeightLabel })

        -- Setup secondary inventory contents and weight.
        local containerInventoryContents  = containerData.inventory
        local containerInventoryMaxWeight = containerData.maxWeight
        local containerCurrentWeight      = GetContainerWeight(containerInventoryContents)

        SendNUIMessage({ action = "updateContainerInventoryWeight", weight = round(containerCurrentWeight, 3), maxWeight = containerInventoryMaxWeight } )
        SendNUIMessage({ action = "setupSecondInventoryContents", inventory = containerInventoryContents })

    end, { id = CURRENT_CONTAINER_ID } )
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

    TriggerServerEvent("tpz_inventory:transferContainerItem", CURRENT_CONTAINER_ID, inventoryType, item, quantity)
end)

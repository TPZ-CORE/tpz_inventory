local TPZ = exports.tpz_core:getCoreAPI()

local ItemUseCooldown = 0

-----------------------------------------------------------
--[[ Functions  ]]--
-----------------------------------------------------------


OpenPlayerInventory = function(refresh)

    local finished = false
    local MoneyItemParameters, BlackMoneyItemParameters, GoldItemParameters = nil, nil, nil

    local DUPLICATE_NON_STACKABLE_ITEMS_LIST = {}

    SendNUIMessage({ action = "clearPlayerInventoryContents" })

    local PlayerData = GetPlayerData()

    TriggerEvent("tpz_core:ExecuteServerCallBack", "tpz_core:getPlayerData", function(account)
            
        MoneyItemParameters = { 
                item = "money", 
                label = Locales['INVENTORY_ACCOUNT_MONEY'], 
                type = "money",
                description = string.format(Locales['INVENTORY_ACCOUNT_MONEY_DESC'], account.money),
                quantity = tonumber(account.money),
                weight = 0,
                action = "currency",
                droppable = 1,
                itemId = 1,
                usedType = 0,
        }
    
        table.insert(PlayerData.Inventory, MoneyItemParameters)

        if Config.DisplayBlackMoney then

            BlackMoneyItemParameters = { 
                item = "blackmoney", 
                label = Locales['INVENTORY_ACCOUNT_BLACKMONEY'], 
                type = "blackmoney",
                description = string.format(Locales['INVENTORY_ACCOUNT_BLACKMONEY_DESC'], account.blackmoney),
                quantity = tonumber(account.blackmoney),
                weight = 0,
                action = "currency",
                droppable = 1,
                itemId = 2,
                usedType = 0,
            }
        
            table.insert(PlayerData.Inventory, BlackMoneyItemParameters)
        end

        GoldItemParameters = { 
            item = "gold", 
            label = Locales['INVENTORY_ACCOUNT_GOLD'], 
            type = "gold",
            description = string.format(Locales['INVENTORY_ACCOUNT_GOLD_DESC'], account.gold),
            quantity = tonumber(account.gold),
            weight = 0,
            action = "currency",
            droppable = 1,
            itemId = 4,
            usedType = 0,
        }
    
        table.insert(PlayerData.Inventory, GoldItemParameters)

        Wait(250)

        SendNUIMessage({ action = "updatePlayerInventoryContents", item_data = MoneyItemParameters, displayImage = Config.DisplayMoney })

        if Config.DisplayBlackMoney then
            SendNUIMessage({ action = "updatePlayerInventoryContents", item_data = BlackMoneyItemParameters, displayImage = true })
        end

        SendNUIMessage({ action = "updatePlayerInventoryContents", item_data = GoldItemParameters,  displayImage = Config.DisplayGold })

        for index, content in pairs (PlayerData.Inventory) do
    
            if content.type ~= 'slot' and content.type ~= "money" and content.type ~= "blackmoney" and content.type ~= "gold"  then

                local exist = false 

                if content.type == 'item' and not Config.UseDatabaseItems then

                    if SharedItems[content.item] then

                        if content.quantity > 0 then
                            
                            content.label          = SharedItems[content.item].label
                            content.weight         = SharedItems[content.item].weight
                            content.remove         = SharedItems[content.item].remove
                            content.action         = SharedItems[content.item].action
                            content.stackable      = SharedItems[content.item].stackable
                            content.droppable      = SharedItems[content.item].droppable
                            content.closeInventory = SharedItems[content.item].closeInventory
                            
                            exist = true

                        end

                    else
                        print("Attempted to retrieve an invalid item data with the name as: " .. content.item)
                        exist = false
                    end

                else
                    exist = true
                end

                if exist then

                    local EXIST_ON_DUPLICATE_NON_STACKABLE_ITEMS_LIST = false 

                    content.description = content.metadata.description

                    content.durability  = content.metadata.durability
                    content.usedType    = 0

                    if content.type ~= "weapon" and content.durability == 100 and content.stackable == 0 then

                        local duplicateKey = content.item .. '-' .. tostring(content.durability)

                        if not DUPLICATE_NON_STACKABLE_ITEMS_LIST[duplicateKey] then
                    
                            -- Create a COPY so we never modify PlayerData.Inventory.
                            DUPLICATE_NON_STACKABLE_ITEMS_LIST[duplicateKey] = {}
                    
                            for k, v in pairs(content) do
                                DUPLICATE_NON_STACKABLE_ITEMS_LIST[duplicateKey][k] = v
                            end
                    
                            -- Always start the displayed quantity at 1.
                            DUPLICATE_NON_STACKABLE_ITEMS_LIST[duplicateKey].quantity = 1
                    
                        else
                    
                            -- Only increase the duplicate counter.
                            DUPLICATE_NON_STACKABLE_ITEMS_LIST[duplicateKey].quantity =
                                DUPLICATE_NON_STACKABLE_ITEMS_LIST[duplicateKey].quantity + 1
                    
                        end
                    
                        EXIST_ON_DUPLICATE_NON_STACKABLE_ITEMS_LIST = true
                    end
    
                    if content.type == "weapon" then
                        
                        content.label       = SharedWeapons.Weapons[string.upper(content.item)].label
                        content.description = SharedWeapons.Weapons[string.upper(content.item)].description
                        content.weight      = SharedWeapons.Weapons[string.upper(content.item)].weight
    
                        if not SharedWeapons.Weapons[string.upper(content.item)].displayDurability then
                            content.durability  = -1
                        end
    
                        local WeaponData = exports.tpz_weapons:getWeaponsAPI().getUsedWeaponsData()
    
                        if WeaponData[content.itemId] then -- 1.1.3
   
                            content.usedType = 1
                            
                            if WeaponData[content.itemId].ammoType then
                                content.ammoType      = WeaponData[content.itemId].ammoType
                                content.ammoTypeLabel = SharedWeapons.Ammo[WeaponData[content.itemId].ammoType].label
    
                                content.metadata.ammoType = WeaponData[content.itemId].ammoType
                            end
                        end
    
                        if content.metadata.ammoType == nil then
    
                            local weaponGroup = GetWeapontypeGroup(GetHashKey(string.upper(content.item)))
    
                            if string.upper(content.item) == "WEAPON_RIFLE_VARMINT" then 
                                weaponGroup = tostring(weaponGroup) .. '1'
                            end
    
                            local getAmmoType = SharedWeapons.AmmoTypes[tostring(weaponGroup)]
    
                            if getAmmoType then
                                content.metadata.ammoType = getAmmoType[1]
                            end
                        end
    
                        content.ammoType = content.metadata.ammoType
                        content.ammo     = content.metadata.ammo
    
                        if content.ammoType then
                            content.ammoTypeLabel = SharedWeapons.Ammo[content.ammoType].label
                        end
    
                    end
    
                    if not EXIST_ON_DUPLICATE_NON_STACKABLE_ITEMS_LIST then

                        local show_quantity = true 
                        
                        if tonumber(content.stackable) == 0 then 
                            show_quantity = false 
                        end
                        
                        SendNUIMessage({ action = "updatePlayerInventoryContents", item_data = content, show_quantity = show_quantity  })
                    end

                end

            end
    
            if next(PlayerData.Inventory, index) == nil then
                finished = true
            end

        end

        for _, dup_content in pairs (DUPLICATE_NON_STACKABLE_ITEMS_LIST) do 

            if dup_content.quantity == 1 then
                SendNUIMessage({ action = "updatePlayerInventoryContents", item_data = dup_content, show_quantity = false })
            else
                SendNUIMessage({ action = "updatePlayerInventoryContents", item_data = dup_content, show_quantity = true })
            end

        end
    
        while not finished do
            Wait(100)
        end

        Wait(150)
    
        local currentWeight = getWeight()

        SendNUIMessage({ action = "updatePlayerInventoryWeight", weight = round(currentWeight, 3), maxWeight = account.inventoryMaxWeight .. Config.InventoryWeightLabel })

        if not refresh then

            SendNUIMessage({ action = "updatePlayerSourceId", sourceId = GetPlayerServerId(PlayerId()) }) -- Player ID

            SetNUIFocusStatus(true)

        end

        SendNUIMessage({ action = "setupPlayerInventoryContents", inventory = PlayerData.Inventory })

    end)

end

RefreshPlayerInventory = function()

    SendNUIMessage({ action = "clearPlayerInventoryContents" })

    Wait(250)
    
    OpenPlayerInventory(true)

end

ClosePlayerInventory = function()
    SendNUIMessage( { action = 'closePlayerInventory' } )
end

SetNUIFocusStatus = function(state)
    local PlayerData = GetPlayerData()

    PlayerData.IsInventoryOpen = state

	SetNuiFocus(state, state)
	SendNUIMessage({ action = "setPlayerInventoryState", enable = state })
    
    if state == false and PlayerData.IsSecondaryInventoryOpen then

        TriggerServerEvent("tpz_inventory:onContainerInventoryClose", GetCurrentContainerId() )

        PlayerData.IsSecondaryInventoryOpen = false

        TriggerEvent('tpz_inventory:setSecondaryInventoryOpenState', false)
        
        if not PlayerData.IsPlayerInventoryOpen then

            SendNUIMessage({ action = "setSecondInventoryState", enable = false })
    
            TriggerServerEvent("tp_containers:server:setBusyState",  GetCurrentContainerId(), false)
            
            ClearCurrentContainerId()
        end

        PlayerData.IsPlayerInventoryOpen = false 
        PlayerData.PlayerInventoryId = 0

    end
    

end 

-----------------------------------------------------------
--[[ Local Functions  ]]--
-----------------------------------------------------------

function getWeight()
    local PlayerData = GetPlayerData()
    local inventory  = PlayerData.Inventory
    local finished   = false

    local totalWeight = 0

    if next(inventory) == nil then
        return totalWeight
    end
    
    for index, content in pairs (inventory) do

        if content.quantity and content.quantity > 0 then -- In case of bugged item quantity we check if quantity is more than 0.
            totalWeight = totalWeight + (content.quantity * content.weight)
        end

        if next(inventory, index) == nil then
            finished = true
        end

    end

    while not finished do
        Wait(50)
    end

    return totalWeight
end

-----------------------------------------------------------
--[[ NUI Callbacks  ]]--
-----------------------------------------------------------

RegisterNUICallback('closePlayerInventory', function()
    local PlayerData = GetPlayerData()

    if not PlayerData.IsInventoryOpen then
        return
    end

    SetNuiFocus(true, false)

    PlayerData.IsInventoryOpen = false

    Wait(350)

    SetNUIFocusStatus(false)
end)

-- add item use cooldown
RegisterNUICallback('useItem', function(data)

    if ItemUseCooldown == 0 then

        ItemUseCooldown = 2 -- adding (2) seconds of cooldown. 

        if tonumber(data.closeInventory) == 1 or data.type == "weapon" or tonumber(data.stackable) == 0 then
            ClosePlayerInventory()
        end
    
        -- 1.1.3
        if tonumber(data.remove) == 1 and data.type ~= "weapon" then
            TriggerServerEvent("tpz_inventory:removeUsableItem", tonumber(data.itemId), tonumber(data.id), data.item, data.label)
        end

        if data.type ~= "weapon" then

            TriggerServerEvent("tpz_inventory:useItem", tonumber(data.itemId), tonumber(data.id), data.item, data.label, data.weight, data.durability, data.metadata)
       
        end

        Wait(1000 * ItemUseCooldown)
        ItemUseCooldown = 0

    else
        TriggerEvent('tpz_core:sendRightTipNotification', Locales['USABLE_ITEM_CLICK_SPAM'], 3000)
    end

end)

RegisterNUICallback('drop', function(data)
    local _data   = data

    local player  = PlayerPedId()
    local coords  = GetEntityCoords(player, true, true)

    ClosePlayerInventory()

    Wait(550)

    if _data.quantity == 0 then
        TriggerEvent('tpz_core:sendRightTipNotification', Locales['INVENTORY_DROP_NOT_ENOUGH_QUANTITY'], 3000)
        return
    end

    if _data.type ~= "weapon" then

        if _data.quantity ~= 1 or _data.type == "money" or _data.type == "blackmoney" or _data.type == "gold"  then

            local inputData = {
                title        = _data.label .. " (X" .. _data.quantity .. ")",
                desc         = Locales['INVENTORY_DROP_DESCRIPTION'],
                buttonparam1 = Locales['INVENTORY_DROP_ACCEPT'],
                buttonparam2 = Locales['INVENTORY_DROP_DECLINE']
            }
                                        
            TriggerEvent("tp_inputs:getTextInput", inputData, function(cb)
        
                local quantity = tonumber(cb)
        
                if quantity ~= nil and quantity ~= 0 and quantity > 0 then
        
                    if quantity <= tonumber(_data.quantity) then
    
                        if _data.type == "item"  then

                            TriggerServerEvent("tpz_inventory:dropItem", coords, _data, quantity)
        
                        elseif _data.type == "money" or _data.type == "blackmoney" or _data.type == "gold" then
                            TriggerServerEvent("tpz_inventory:dropMoney", coords, _data.type, quantity)
                        end
        
                    else
                        TriggerEvent('tpz_core:sendRightTipNotification', Locales['INVENTORY_DROP_NOT_ENOUGH_QUANTITY'], 3000)
                    end
                else
                    if cb == "DECLINE" then return end
                    TriggerEvent('tpz_core:sendRightTipNotification', Locales['INVENTORY_DROP_INVALID_QUANTITY'], 3000)
                end
            end)

        else

            TriggerServerEvent("tpz_inventory:dropItem", coords, _data, 1)
        end
    else

        TriggerServerEvent("tpz_inventory:dropWeapon", coords, _data)
    end

end)


RegisterNUICallback('give', function(data)
    local _data   = data

    /*
    if DoesItemExistOnSlot(_data) then 
        TriggerEvent('tpz_core:sendRightTipNotification', Locales['CANNOT_WHILE_BEING_SET_AS_USABLE_SLOT'], 3000)
        return 
    end*/

    ClosePlayerInventory()

    Wait(500)

    if _data.quantity == 0 then
        TriggerEvent('tpz_core:sendRightTipNotification', Locales['INVENTORY_GIVE_NOT_ENOUGH_QUANTITY'], 3000)
        return
    end

	local nearestPlayers = GetNearestPlayers(Config.NearPlayersTradeDistance)
    local finished       = false
    local elements       = {}

    local playerid       = 0

    if #nearestPlayers <= 0 then
        TriggerEvent('tpz_core:sendRightTipNotification', Locales['INVENTORY_GIVE_NO_PLAYER_CLOSE'], 3000)
        return
    end
    
	for _, player in pairs(nearestPlayers) do
        table.insert(elements, GetPlayerServerId(player))
    end

    if #elements > 1 then

        local inputPlayersData = {
            title        = _data.label .. " (X" .. _data.quantity .. ")",
            desc         = Locales['INVENTORY_GIVE_PLAYERS_DESCRIPTION'],
            buttonparam1 = Locales['INVENTORY_GIVE_PLAYERS_ACCEPT'],
            buttonparam2 = Locales['INVENTORY_GIVE_PLAYERS_DECLINE'],
            options      = elements,
        }
    
        TriggerEvent("tp_inputs:getSelectedOptionsInput", inputPlayersData, function(cb)
    
            if cb ~= "DECLINE" then
                playerid = tonumber(cb)
            end
    
           finished = true
                    
        end)
    
    else
        playerid = tonumber(elements[1])
        finished = true
    end

    while not finished do
        Wait(50)
    end

    if playerid == 0 then
        return
    end

    Wait(250)

    if _data.quantity == 0 then
        _data.quantity = 1
    end

    exports.tpz_inventory_trade:StartTradingProcess(playerid, _data, _data.quantity)
end)



local ItemUseCooldown = 0

-----------------------------------------------------------
--[[ Functions  ]]--
-----------------------------------------------------------

OpenPlayerInventory = function(refresh)

    local finished = false
    local MoneyItemParameters, BlackMoneyItemParameters, GoldItemParameters = nil, nil, nil

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
    
            if content.type ~= "money" and content.type ~= "blackmoney" and content.type ~= "gold"  then
                
                if content.type == 'item' and not Config.UseDatabaseItems then

                    content.label          = SharedItems[content.item].label
                    content.weight         = SharedItems[content.item].weight
                    content.remove         = SharedItems[content.item].remove
                    content.action         = SharedItems[content.item].action
                    content.stackable      = SharedItems[content.item].stackable
                    content.droppable      = SharedItems[content.item].droppable
                    content.closeInventory = SharedItems[content.item].closeInventory
                end

                content.description = content.metadata.description

                content.durability  = content.metadata.durability
                content.usedType    = 0

                if content.type == "weapon" then
                    
                    content.label       = SharedWeapons.Weapons[string.upper(content.item)].label
                    content.description = SharedWeapons.Weapons[string.upper(content.item)].description
                    content.weight      = SharedWeapons.Weapons[string.upper(content.item)].weight

                    if not SharedWeapons.Weapons[string.upper(content.item)].displayDurability then
                        content.durability  = -1
                    end

                    local WeaponData = exports.tpz_weapons:getWeaponsAPI().getUsedWeaponData()

                    if WeaponData.weaponId == content.itemId then
                        content.usedType = 1
                        
                        if WeaponData.ammoType then
                            content.ammoType      = WeaponData.ammoType
                            content.ammoTypeLabel = SharedWeapons.Ammo[WeaponData.ammoType].label

                            content.metadata.ammoType = WeaponData.ammoType
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

                SendNUIMessage({ action = "updatePlayerInventoryContents", item_data = content })

            end
    
            if next(PlayerData.Inventory, index) == nil then
                finished = true
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

        if content.quantity > 0 then -- In case of bugged item quantity we check if quantity is more than 0.
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

        if tonumber(data.closeInventory) == 1 or data.type == "weapon" then
            ClosePlayerInventory()
        end
    
        if tonumber(data.remove) == 1 and not data.type == "weapon" then
            TriggerServerEvent("tpz_inventory:removeUsableItem", tonumber(data.itemId), tonumber(data.id), data.item, data.label)
        end

        if data.type ~= "weapon" then

            TriggerServerEvent("tpz_inventory:useItem", tonumber(data.itemId), tonumber(data.id), data.item, data.label, data.weight, data.durability, data.metadata)
       
        elseif data.type == "weapon" then

            EquipWeapon(data.primary, data.itemId, data.item, data.ammoType, data.ammo, data.label, data.durability, data.metadata)

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



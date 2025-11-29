local TPZ = exports.tpz_core:getCoreAPI()

local ItemUseCooldown = 0

local EquippedSlot = nil

-----------------------------------------------------------
--[[ Functions  ]]--
-----------------------------------------------------------

OpenPlayerInventory = function(refresh)

    local finished = false
    local MoneyItemParameters, BlackMoneyItemParameters, GoldItemParameters = nil, nil, nil

    SendNUIMessage({ action = "clearPlayerInventoryContents" })

    local PlayerData = GetPlayerData()

    TriggerEvent("tpz_core:ExecuteServerCallBack", "tpz_core:getPlayerData", function(account)
            
        ClearSlotsProperly()

        -- Inventory Slot Keys

        local slot1item  = PlayerData.Slots['1'].item
        local slot1label = PlayerData.Slots['1'].type == 'weapon' and SharedWeapons.Weapons[string.upper(slot1item)].label or SharedItems[slot1item].label
        local slot1 = { item = slot1item, label = slot1label, type = 'slot', description = '', weight = 0.0, action = 'slot1', droppable = 0, itemId = -1, usedType = 0, quantity = 1 }
       
        local slot2item  = PlayerData.Slots['2'].item
        local slot2label = PlayerData.Slots['2'].type == 'weapon' and SharedWeapons.Weapons[string.upper(slot2item)].label or SharedItems[slot2item].label
        local slot2 = { item = slot2item, label = slot2label, type = 'slot', description = '', weight = 0.0, action = 'slot2', droppable = 0, itemId = -2, usedType = 0, quantity = 1  }
       
        local slot3item  = PlayerData.Slots['3'].item
        local slot3label = PlayerData.Slots['3'].type == 'weapon' and SharedWeapons.Weapons[string.upper(slot3item)].label or SharedItems[slot3item].label
        local slot3 = { item = slot3item, label = slot3label, type = 'slot', description = '', weight = 0.0, action = 'slot3', droppable = 0, itemId = -3, usedType = 0, quantity = 1  }
        
        local slot4item  = PlayerData.Slots['4'].item
        local slot4label = PlayerData.Slots['4'].type == 'weapon' and SharedWeapons.Weapons[string.upper(slot4item)].label or SharedItems[slot4item].label
        local slot4 = { item = slot4item, label = slot4label, type = 'slot', description = '', weight = 0.0, action = 'slot4', droppable = 0, itemId = -4, usedType = 0, quantity = 1  }
    
        table.insert(PlayerData.Inventory, slot1)
        table.insert(PlayerData.Inventory, slot2)
        table.insert(PlayerData.Inventory, slot3)
        table.insert(PlayerData.Inventory, slot4)

        -- End of Slot Keys

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

        local _slot1 = { item = 'slot1', label = slot1label, type = 'slot', description = '', weight = 0.0, action = 'slot1', droppable = 0, itemId = -1, usedType = 0, quantity = 1 }
        local _slot2 = { item = 'slot2', label = slot2label, type = 'slot', description = '', weight = 0.0, action = 'slot2', droppable = 0, itemId = -2, usedType = 0, quantity = 1  }
        local _slot3 = { item = 'slot3', label = slot3label, type = 'slot', description = '', weight = 0.0, action = 'slot3', droppable = 0, itemId = -3, usedType = 0, quantity = 1  }
        local _slot4 = { item = 'slot4', label = slot4label, type = 'slot', description = '', weight = 0.0, action = 'slot4', droppable = 0, itemId = -4, usedType = 0, quantity = 1  }
    
        -- we run fake slots in order to load their images, somehow they can never be set without loading them first.
        SendNUIMessage({ action = "updatePlayerInventoryContents", item_data = _slot1, displayImage = true })
        SendNUIMessage({ action = "updatePlayerInventoryContents", item_data = _slot2, displayImage = true })
        SendNUIMessage({ action = "updatePlayerInventoryContents", item_data = _slot3, displayImage = true })
        SendNUIMessage({ action = "updatePlayerInventoryContents", item_data = _slot4, displayImage = true })

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

                        content.label          = SharedItems[content.item].label
                        content.weight         = SharedItems[content.item].weight
                        content.remove         = SharedItems[content.item].remove
                        content.action         = SharedItems[content.item].action
                        content.stackable      = SharedItems[content.item].stackable
                        content.droppable      = SharedItems[content.item].droppable
                        content.closeInventory = SharedItems[content.item].closeInventory
                        
                        exist = true
                    else
                        print("Attempted to retrieve an invalid item data with the name as: " .. content.item)
                        exist = false
                    end

                else
                    exist = true
                end

                if exist then
      
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
        
        -- We are running after loading fake slot images, the real item images.
        SendNUIMessage({ action = 'updateSlot', slotIndex = "1", result = { item = slot1.item, itemId = tonumber("-1")} })
        SendNUIMessage({ action = 'updateSlot', slotIndex = "2", result = { item = slot2.item, itemId = tonumber("-2")} })
        SendNUIMessage({ action = 'updateSlot', slotIndex = "3", result = { item = slot3.item, itemId = tonumber("-3")} })
        SendNUIMessage({ action = 'updateSlot', slotIndex = "4", result = { item = slot4.item, itemId = tonumber("-4")} })
        
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

DoesItemExistOnSlot = function(data)
    local PlayerData = GetPlayerData()

    for _, slot in pairs (PlayerData.Slots) do 

        if slot.item == data.item and slot.itemId == data.itemId then 
            return true
        end

    end

    return false
end

RemoveFromSlotByItemData = function(data)
    local PlayerData = GetPlayerData()

    for _, slot in pairs (PlayerData.Slots) do 

        if slot.item == data.item and slot.itemId == data.itemId then 
            
            TriggerServerEvent("tpz_inventory:server:set_slot", _, { item = "slot" .. _, type = 'slot', action = "slot" .. _ })

            PlayerData.Slots[_] = { item = "slot" .. _, type = 'slot', action = "slot" .. _}

            if PlayerData.IsInventoryOpen then
                SendNUIMessage({ action = 'updateSlot', slotIndex = _, result = { item = "slot" .. _, itemId = tonumber("-" .. _)} })
            end

            if EquippedSlot and EquippedSlot == _ then

                local equipped_data = PlayerData.Slots[EquippedSlot]

                if equipped_data.type == 'weapon' then 
                    
                    local WeaponAPI = exports.tpz_weapons:getWeaponsAPI()
    
                    WeaponAPI.saveUsedWeaponData()
                    WeaponAPI.clearUsedWeaponData(true)

                    EquippedSlot = nil

                else 
                    
                    TriggerServerEvent("tpz_inventory:useItem", tonumber(equipped_data.itemId), tonumber(equipped_data.id), equipped_data.item, equipped_data.label, equipped_data.weight, equipped_data.durability, equipped_data.metadata)
                end

                EquippedSlot = nil

            end

            break
        end

    end

end

ClearSlotsProperly = function()

    local PlayerData = GetPlayerData()

    for _, slot in pairs (PlayerData.Slots) do 

        local exist = false 

        for index, content in pairs (PlayerData.Inventory) do
            
            if content.type ~= 'slot' and content.type ~= "money" and content.type ~= "blackmoney" and content.type ~= "gold"  then
               
                if slot.item == content.item and slot.itemId == content.itemId then 
                    exist = true
                    break
                end

            end

        end

        if not exist then 
            RemoveFromSlotByItemData(slot)
        end

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
--[[ Events ]]--
-----------------------------------------------------------

RegisterNetEvent("tpz_core:isPlayerRespawned")
AddEventHandler("tpz_core:isPlayerRespawned", function()

    TriggerServerEvent("tpz_inventory:server:set_slot", "1", { item = "slot1", type = 'slot', action = "slot1" })
    TriggerServerEvent("tpz_inventory:server:set_slot", "2", { item = "slot2", type = 'slot', action = "slot2" })
    TriggerServerEvent("tpz_inventory:server:set_slot", "3", { item = "slot3", type = 'slot', action = "slot3" })
    TriggerServerEvent("tpz_inventory:server:set_slot", "4", { item = "slot4", type = 'slot', action = "slot4" })

    PlayerData.Slots['1'] = { item = "slot1", type = 'slot', action = "slot1"}
    PlayerData.Slots['2'] = { item = "slot2", type = 'slot', action = "slot2"}
    PlayerData.Slots['3'] = { item = "slot3", type = 'slot', action = "slot3"}
    PlayerData.Slots['4'] = { item = "slot4", type = 'slot', action = "slot4"}
end)

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

        if data.type == 'slot' then 
            local PlayerData = GetPlayerData()
            local slotId     = string.gsub(data.action, 'slot', "")

            if EquippedSlot and tostring(EquippedSlot) == tostring(slotId) then

                local equipped_data = PlayerData.Slots[EquippedSlot]

                if equipped_data.type == 'weapon' then 
                    
                    local WeaponAPI = exports.tpz_weapons:getWeaponsAPI()
    
                    WeaponAPI.saveUsedWeaponData()
                    WeaponAPI.clearUsedWeaponData(true)

                    EquippedSlot = nil

                else 
                    TriggerServerEvent("tpz_inventory:useItem", tonumber(equipped_data.itemId), tonumber(equipped_data.id), equipped_data.item, equipped_data.label, equipped_data.weight, equipped_data.durability, equipped_data.metadata)
                end

                EquippedSlot = nil

            end

            TriggerServerEvent("tpz_inventory:server:set_slot", slotId, { item = data.action, type = 'slot', action = data.action })

            PlayerData.Slots[slotId] = { item = data.action, type = 'slot', action = data.action }
 
            SendNUIMessage({ action = 'updateSlot', slotIndex = slotId, result = { item = data.action, itemId = tonumber("-" .. slotId)} })
            return 
        end

        ItemUseCooldown = 2 -- adding (2) seconds of cooldown. 

        if tonumber(data.closeInventory) == 1 or data.type == "weapon" then
            ClosePlayerInventory()
        end
    
        if tonumber(data.remove) == 1 and not data.type == "weapon" then
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

RegisterNUICallback('select_slot', function(data)
    local _data      = data
    local PlayerData = GetPlayerData()
    
    local doesItemExist = false

    for _, slot in pairs (PlayerData.Slots) do 

        if slot.item == _data.item then -- and slot.itemId == _data.itemId then 
            doesItemExist = true
            break
        end

    end

    if doesItemExist then 
        TriggerEvent('tpz_core:sendBottomTipNotification', Locales['SLOT_ALREADY_REGISTERED'], 3000)
        return 
    end

    local inputData = {
        title = Locales['SELECT_SLOT_TITLE'],
        desc  = Locales['SELECT_SLOT_DESCRIPTION'],
        buttonparam1 = Locales['SELECT_SLOT_INPUT_ACCEPT'],
        buttonparam2 = Locales['SELECT_SLOT_INPUT_CANCEL'],
    
        options = { '1', '2', '3', '4'} -- <- The list with the name values.
    }
        
    TriggerEvent("tpz_inputs:getSelectedOptionsInput", inputData, function(cb)
        
        if cb ~= "DECLINE" then
           TriggerServerEvent("tpz_inventory:server:set_slot", cb, _data)

           PlayerData.Slots[tostring(cb)] = _data

           SendNUIMessage({ action = 'updateSlot', slotIndex = cb, result = _data })
        end
                
    end)

end)

RegisterNUICallback('drop', function(data)
    local _data   = data

    local player  = PlayerPedId()
    local coords  = GetEntityCoords(player, true, true)

    if DoesItemExistOnSlot(_data) then 
        TriggerEvent('tpz_core:sendRightTipNotification', Locales['CANNOT_WHILE_BEING_SET_AS_USABLE_SLOT'], 3000)
        return 
    end

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

    if DoesItemExistOnSlot(_data) then 
        TriggerEvent('tpz_core:sendRightTipNotification', Locales['CANNOT_WHILE_BEING_SET_AS_USABLE_SLOT'], 3000)
        return 
    end

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


Citizen.CreateThread(function()
    

    while true do

        Wait(1)

        local PlayerData = GetPlayerData()

        local pressed      = false
        local pressed_slot = '1'

        if IsControlJustPressed(0, 0xE6F612E4) and PlayerData.Slots['1'].item ~= 'slot1' then
            pressed = true
            pressed_slot = '1'
        end

        if IsControlJustPressed(0, 0x1CE6D9EB) and PlayerData.Slots['2'].item ~= 'slot2' then
            pressed = true
            pressed_slot = '2'
        end

        if IsControlJustPressed(0, 0x4F49CC4C) and PlayerData.Slots['3'].item ~= 'slot3' then
            pressed = true
            pressed_slot = '3'
        end

        if IsControlJustPressed(0, 0x8F9F9E58) and PlayerData.Slots['4'].item ~= 'slot4' then
            pressed = true
            pressed_slot = '4'
        end

        if pressed then

            local data = PlayerData.Slots[pressed_slot]

            if EquippedSlot and EquippedSlot ~= pressed_slot then

                local equipped_data = PlayerData.Slots[EquippedSlot]

                if equipped_data.type == 'weapon' then 
                    
                    local WeaponAPI = exports.tpz_weapons:getWeaponsAPI()
    
                    WeaponAPI.saveUsedWeaponData()
                    WeaponAPI.clearUsedWeaponData(true)

                    EquippedSlot = nil

                else 
                    
                    TriggerServerEvent("tpz_inventory:useItem", tonumber(equipped_data.itemId), tonumber(equipped_data.id), equipped_data.item, equipped_data.label, equipped_data.weight, equipped_data.durability, equipped_data.metadata)
                end

                EquippedSlot = nil

            end

            if tonumber(data.remove) == 1 and not data.type == "weapon" then

                TriggerServerEvent("tpz_inventory:removeUsableItem", tonumber(data.itemId), tonumber(data.id), data.item, data.label)

                -- remove from slot since item is one time use.
                TriggerServerEvent("tpz_inventory:server:set_slot", pressed_slot, { item = "slot".. pressed_slot, type = 'slot', action = "slot" .. pressed_slot })
                
                PlayerData.Slots[pressed_slot] = { item = "slot".. pressed_slot, type = 'slot', action = "slot" .. pressed_slot }
                SendNUIMessage({ action = 'updateSlot', slotIndex = pressed_slot, result = { item = "slot" .. pressed_slot, itemId = tonumber("-" .. pressed_slot)} })
                EquippedSlot = nil
            end
    
            if data.type ~= "weapon" then
    
                TriggerServerEvent("tpz_inventory:useItem", tonumber(data.itemId), tonumber(data.id), data.item, data.label, data.weight, data.durability, data.metadata)
                EquippedSlot = pressed_slot

            elseif data.type == "weapon" then
    
                local WeaponAPI = exports.tpz_weapons:getWeaponsAPI()

                WeaponAPI.saveUsedWeaponData()

                if WeaponAPI.getUsedWeaponData().weaponId == nil then

                    WeaponAPI.equipWeapon(data.itemId, data.item, data.ammoType, data.ammo, data.label, data.durability, data.metadata)
                    EquippedSlot = pressed_slot
                else
                    
                    WeaponAPI.clearUsedWeaponData(true)
                    EquippedSlot = nil
                end

            end

            Wait(500)

        end


    end

end)


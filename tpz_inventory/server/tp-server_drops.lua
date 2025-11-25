

local TPZ = exports.tpz_core:getCoreAPI()

local DroppedUsersList = {}
local DroppedItems     = {}

-----------------------------------------------------------
--[[ Local Functions  ]]--
-----------------------------------------------------------

local function GetPlayerData(source)
	local _source = source
    local xPlayer = TPZ.GetPlayer(_source)

	return {
        steamName      = GetPlayerName(_source),
        username       = xPlayer.getFirstName() .. ' ' .. xPlayer.getLastName(),
		identifier     = xPlayer.getIdentifier(),
        charIdentifier = xPlayer.getCharacterIdentifier(),
	}

end

-----------------------------------------------------------
--[[ Base Events  ]]--
-----------------------------------------------------------

AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    DroppedItems = nil
    DroppedUsersList = nil
end)

-----------------------------------------------------------
--[[ General Events  ]]--
-----------------------------------------------------------

RegisterServerEvent("tpz_inventory:dropMoney")
AddEventHandler("tpz_inventory:dropMoney", function(coords, currencyType, quantity)
    local _source = source
    local xPlayer = TPZ.GetPlayer(_source)
		
    if xPlayer.hasLostConnection() then 
        print(string.format('A player with the steam name as: %s and online id: %s, attempted to drop money on the ground while his connection is lost.', GetPlayerName(_source), _source))
        return 
    end
		
    math.randomseed( os.time() )
    Citizen.Wait( math.random(250, 500) )

    if DroppedUsersList[_source] then
        TriggerClientEvent('tpz_core:sendBottomTipNotification', _source, Locales['DROP_COOLDOWN'], 3000)
        return
    end

    local PlayerData = GetPlayerData(_source)

    DroppedUsersList[_source] = true

    local accounts = {
        ['money']      = 0,
        ['gold']       = 1,
        ['blackmoney'] = 2,
    }

    -- @accounts[currencyType] : returns the correct currency account type to be used directly than checking with if statements
    -- for every single account separately.
    local account = accounts[currencyType]

    -- We check if the player has the money that is willing to drop.
    if xPlayer.getAccount(account) < tonumber(quantity) then

        if Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Enabled then
            local _w, _c      = Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Url, Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Color
            local description = 'The specified user attempted to use devtools / injection or netbug cheat when dropping money.'
            TPZ.SendToDiscordWithPlayerParameters(_w, Locales['DEVTOOLS_INJECTION_DETECTED_TITLE_LOG'], _source, PlayerData.steamName, PlayerData.username, PlayerData.identifier, PlayerData.charIdentifier, description, _c)
        end

        DroppedUsersList[_source] = nil
        xPlayer.disconnect(Locales['DEVTOOLS_INJECTION_DETECTED'])
        return
    end

    xPlayer.removeAccount(account, tonumber(quantity))

    local hours, minutes, seconds = os.date('%H'), os.date('%M'), os.date('%S')
    local randomDropId = account .. tonumber(hours) .. tonumber(minutes) .. tonumber(seconds) .. math.random(1, 9) .. math.random(1, 9)

    DroppedItems[randomDropId] = {}
    DroppedItems[randomDropId] = {
        dropId   = randomDropId, -- unique dropped item identifier.
        time     = Config.Droppables.RemoveAfter, 
        quantity = tonumber(quantity), 
        type     = currencyType,
        coords   = coords,
        label    = Locales['CURRENCY_' .. string.upper(currencyType) ]
    }

    TPZ.TriggerClientEventAsyncByCoords("tpz_inventory:onDroppedItemUpdate", { actionType = "INSERT", dropId = randomDropId, data = DroppedItems[randomDropId] }, coords, 150.0, 200, true, 40)
    TriggerClientEvent('tpz_core:sendBottomTipNotification', _source, string.format(Locales['INVENTORY_DROPPED_' .. string.upper(currencyType)], tonumber(quantity)), 3000)

    local webhookData = Config.Webhooks['DROPPED_ITEMS']
    
    if webhookData.Enabled then
        local title   = "💰` Inventory Money Dropped` "
        local message = "The specified user dropped on the ground " .. tonumber(quantity) .. " " .. currencyType
        TPZ.SendToDiscordWithPlayerParameters(webhookData.Url, title, _source, PlayerData.steamName, PlayerData.username, PlayerData.identifier, PlayerData.charIdentifier, message, webhookData.Color)
    end

    Wait(Config.Droppables.DropCooldown * 1000)
    DroppedUsersList[_source] = nil

end)

RegisterServerEvent("tpz_inventory:onMoneyPickup")
AddEventHandler("tpz_inventory:onMoneyPickup", function(currencyType, data)
    local _source = source
    local xPlayer = TPZ.GetPlayer(_source)

    if xPlayer.hasLostConnection() then 
        print(string.format('A player with the steam name as: %s and online id: %s, attempted to pickup money from the ground while his connection is lost.', GetPlayerName(_source), _source))
        return 
    end
		
    math.randomseed( os.time() )
    Citizen.Wait( math.random(500, 1000) )

    local PlayerData = GetPlayerData(_source)

    if DroppedItems[data.dropId] == nil then

        if Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Enabled then
            local _w, _c      = Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Url, Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Color
            local description = 'The specified user attempted to use devtools / injection or netbug cheat when picking up money.'
            TPZ.SendToDiscordWithPlayerParameters(_w, Locales['DEVTOOLS_INJECTION_DETECTED_TITLE_LOG'], _source, PlayerData.steamName, PlayerData.username, PlayerData.identifier, PlayerData.charIdentifier, description, _c)
        end

        xPlayer.disconnect(Locales['DEVTOOLS_INJECTION_DETECTED'])
        return
    end

    if DroppedItems[data.dropId].quantity ~= tonumber(data.quantity) or DroppedItems[data.dropId].type ~= currencyType then

        if Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Enabled then
            local _w, _c      = Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Url, Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Color
            local description = 'The specified user attempted to use devtools / injection or netbug cheat when picking up money.'
            TPZ.SendToDiscordWithPlayerParameters(_w, Locales['DEVTOOLS_INJECTION_DETECTED_TITLE_LOG'], _source, PlayerData.steamName, PlayerData.username, PlayerData.identifier, PlayerData.charIdentifier, description, _c)
        end

        xPlayer.disconnect(Locales['DEVTOOLS_INJECTION_DETECTED'])
        return
    end

    DroppedItems[data.dropId] = nil

    local accounts = {
        ['money']      = 0,
        ['gold']       = 1,
        ['blackmoney'] = 2,
    }

    -- @accounts[currencyType] : returns the correct currency account type to be used directly than checking with if statements
    -- for every single account separately.
    local account = accounts[currencyType]

    xPlayer.addAccount(account, tonumber(data.quantity))

    TPZ.TriggerClientEventAsyncByCoords("tpz_inventory:onDroppedItemUpdate", { actionType = "REMOVE", dropId = data.dropId }, data.coords, 150.0, 200, true, 40)
    TriggerClientEvent('tpz_core:sendBottomTipNotification', _source, string.format(Locales['INVENTORY_PICKED_UP_' .. string.upper(currencyType)], tonumber(data.quantity)), 3000)

    local webhookData = Config.Webhooks['DROPPED_ITEMS']
    
    if webhookData.Enabled then
        local title   = "💰` Inventory Money Pickup` "
        local message = "The specified user picked from the ground " .. tonumber(data.quantity) .. " " .. currencyType
        TPZ.SendToDiscordWithPlayerParameters(webhookData.Url, title, _source, PlayerData.steamName, PlayerData.username, PlayerData.identifier, PlayerData.charIdentifier, message, webhookData.Color)
    end

    Wait(150)

    TriggerClientEvent("tpz_inventory:isPlayerPickingUp", _source, false)
end)


RegisterServerEvent("tpz_inventory:dropItem")
AddEventHandler("tpz_inventory:dropItem", function(coords, data, quantity)
    local _source = source
    local xPlayer = TPZ.GetPlayer(_source)

    if xPlayer.hasLostConnection() then 
        print(string.format('A player with the steam name as: %s and online id: %s, attempted to drop an item on the ground while his connection is lost.', GetPlayerName(_source), _source))
        return 
    end
		
    math.randomseed( os.time() )
    Citizen.Wait( math.random(100, 500) )

    if DroppedUsersList[_source] then
        TriggerClientEvent('tpz_core:sendBottomTipNotification', _source, Locales['DROP_COOLDOWN'], 3000)
        return
    end

    local PlayerData = GetPlayerData(_source)

    DroppedUsersList[_source] = true

    local itemData = SharedItems[data.item]

    if itemData == nil then

        if Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Enabled then
            local _w, _c      = Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Url, Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Color
            local description = 'The specified user attempted to use devtools / injection or netbug cheat when dropping items.'
            TPZ.SendToDiscordWithPlayerParameters(_w, Locales['DEVTOOLS_INJECTION_DETECTED_TITLE_LOG'], _source, PlayerData.steamName, PlayerData.username, PlayerData.identifier, PlayerData.charIdentifier, description, _c)
        end

        xPlayer.disconnect(Locales['DEVTOOLS_INJECTION_DETECTED'])
        DroppedUsersList[_source] = nil
        return
    end

    if data.remove == nil and data.closeInventory == nil and data.quantity == nil and data.weight == nil then

        if Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Enabled then
            local _w, _c      = Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Url, Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Color
            local description = 'The specified user attempted to use devtools / injection or netbug cheat when dropping items.'
            TPZ.SendToDiscordWithPlayerParameters(_w, Locales['DEVTOOLS_INJECTION_DETECTED_TITLE_LOG'], _source, PlayerData.steamName, PlayerData.username, PlayerData.identifier, PlayerData.charIdentifier, description, _c)
        end

        xPlayer.disconnect(Locales['DEVTOOLS_INJECTION_DETECTED'])
        DroppedUsersList[_source] = nil
        return
    end

    local getItemQuantity = getItemQuantity(_source, data.item)

    if getItemQuantity == nil or getItemQuantity and getItemQuantity < quantity then

        if Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Enabled then
            local _w, _c      = Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Url, Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Color
            local description = 'The specified user attempted to use devtools / injection or netbug cheat when dropping items.'
            TPZ.SendToDiscordWithPlayerParameters(_w, Locales['DEVTOOLS_INJECTION_DETECTED_TITLE_LOG'], _source, PlayerData.steamName, PlayerData.username, PlayerData.identifier, PlayerData.charIdentifier, description, _c)
        end

        xPlayer.disconnect(Locales['DEVTOOLS_INJECTION_DETECTED'])
        DroppedUsersList[_source] = nil
        return
    end

    local hours, minutes, seconds = os.date('%H'), os.date('%M'), os.date('%S')
    local randomDropId = data.item .. tonumber(hours) .. tonumber(minutes) .. tonumber(seconds) .. math.random(1, 9) .. math.random(1, 9)

    DroppedItems[randomDropId]           = {}
    DroppedItems[randomDropId]           = data -- we set the data parameter because it contains all the metadata and all the required information about the dropped item.

    DroppedItems[randomDropId].dropId    = randomDropId -- unique dropped item identifier.
    DroppedItems[randomDropId].time      = Config.Droppables.RemoveAfter
    DroppedItems[randomDropId].quantity  = tonumber(quantity)
    DroppedItems[randomDropId].type      = "item"
    DroppedItems[randomDropId].coords    = coords

    removeItem(_source, data.item, tonumber(quantity), tonumber(data.itemId))

    TPZ.TriggerClientEventAsyncByCoords("tpz_inventory:onDroppedItemUpdate", { actionType = "INSERT", dropId = randomDropId, data = DroppedItems[randomDropId] }, coords, 150.0, 200, true, 40)
    TriggerClientEvent('tpz_core:sendBottomTipNotification', _source, string.format(Locales['INVENTORY_DROPPED'], tonumber(quantity), data.label), 3000)

    local webhookData = Config.Webhooks['DROPPED_ITEMS']
    
    if webhookData.Enabled then
        local title   = "💰` Inventory Item Dropped` "
        local message = "The specified user dropped on the ground X" .. tonumber(quantity) .. " " .. data.label .. " (" .. data.item .. ")"
        TPZ.SendToDiscordWithPlayerParameters(webhookData.Url, title, _source, PlayerData.steamName, PlayerData.username, PlayerData.identifier, PlayerData.charIdentifier, message, webhookData.Color)
    end

    Wait(Config.Droppables.DropCooldown * 1000)
    DroppedUsersList[_source] = nil
end)

RegisterServerEvent("tpz_inventory:onItemPickup")
AddEventHandler("tpz_inventory:onItemPickup", function(data)
    local _source = source
    local xPlayer = TPZ.GetPlayer(_source)

    if xPlayer.hasLostConnection() then 
        print(string.format('A player with the steam name as: %s and online id: %s, attempted to pickup an item from the ground while his connection is lost.', GetPlayerName(_source), _source))
        return 
    end
		
    math.randomseed( os.time() )
    Citizen.Wait( math.random(500, 1000) )

    local PlayerData = GetPlayerData(_source)

    if DroppedItems[data.dropId] == nil then

        if Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Enabled then
            local _w, _c      = Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Url, Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Color
            local description = 'The specified user attempted to use devtools / injection or netbug cheat when picking up items.'
            TPZ.SendToDiscordWithPlayerParameters(_w, Locales['DEVTOOLS_INJECTION_DETECTED_TITLE_LOG'], _source, PlayerData.steamName, PlayerData.username, PlayerData.identifier, PlayerData.charIdentifier, description, _c)
        end

        xPlayer.disconnect(Locales['DEVTOOLS_INJECTION_DETECTED'])
        return
    end

    if DroppedItems[data.dropId].quantity ~= tonumber(data.quantity) or DroppedItems[data.dropId].type ~= "item" then

        if Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Enabled then
            local _w, _c      = Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Url, Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Color
            local description = 'The specified user attempted to use devtools / injection or netbug cheat when picking up items.'
            TPZ.SendToDiscordWithPlayerParameters(_w, Locales['DEVTOOLS_INJECTION_DETECTED_TITLE_LOG'], _source, PlayerData.steamName, PlayerData.username, PlayerData.identifier, PlayerData.charIdentifier, description, _c)
        end

        xPlayer.disconnect(Locales['DEVTOOLS_INJECTION_DETECTED'])
        return
    end

    if canCarryItem(_source, data.item, tonumber(data.quantity)) then

        addItem(_source, data.item, tonumber(data.quantity), data.metadata)

        DroppedItems[data.dropId] = nil
        
        TPZ.TriggerClientEventAsyncByCoords("tpz_inventory:onDroppedItemUpdate", { actionType = "REMOVE", dropId = data.dropId }, data.coords, 150.0, 200, true, 40)
        TriggerClientEvent('tpz_core:sendBottomTipNotification', _source, string.format(Locales['INVENTORY_PICKED_UP'], tonumber(data.quantity), data.label), 3000)

        local webhookData = Config.Webhooks['DROPPED_ITEMS']
    
        if webhookData.Enabled then
            local title   = "💰` Inventory Item Dropped` "
            local message = "The specified user picked from the ground X" .. tonumber(data.quantity) .. " " .. data.label .. " (" .. data.item .. ")"
            TPZ.SendToDiscordWithPlayerParameters(webhookData.Url, title, _source, PlayerData.steamName, PlayerData.username, PlayerData.identifier, PlayerData.charIdentifier, message, webhookData.Color)
        end    
        
    else
        TriggerClientEvent('tpz_core:sendRightTipNotification', _source, Locales['CANNOT_CARRY_ITEM'], 3000)
    end

    TriggerClientEvent("tpz_inventory:isPlayerPickingUp", _source, false)
end)

RegisterServerEvent("tpz_inventory:dropWeapon")
AddEventHandler("tpz_inventory:dropWeapon", function(coords, data)
    local _source = source
    local xPlayer = TPZ.GetPlayer(_source)

    if xPlayer.hasLostConnection() then 
        print(string.format('A player with the steam name as: %s and online id: %s, attempted to drop a weapon on the ground while his connection is lost.', GetPlayerName(_source), _source))
        return 
    end

    math.randomseed( os.time() )
    Citizen.Wait( math.random(500, 1000) )

    if DroppedUsersList[_source] then
        TriggerClientEvent('tpz_core:sendBottomTipNotification', _source, Locales['DROP_COOLDOWN'], 3000)
        return
    end

    local PlayerData = GetPlayerData(_source)

    DroppedUsersList[_source] = true

    local hasWeapon  = doesPlayerHaveWeapon(_source, data.item, data.itemId)

    if not hasWeapon then

        if Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Enabled then
            local _w, _c      = Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Url, Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Color
            local description = 'The specified user attempted to use devtools / injection or netbug cheat when dropping weapons.'
            TPZ.SendToDiscordWithPlayerParameters(_w, Locales['DEVTOOLS_INJECTION_DETECTED_TITLE_LOG'], _source, PlayerData.steamName, PlayerData.username, PlayerData.identifier, PlayerData.charIdentifier, description, _c)
        end

        xPlayer.disconnect(Locales['DEVTOOLS_INJECTION_DETECTED'])
        DroppedUsersList[_source] = nil
        return
    end

    if data.itemId == nil or data.metadata == nil then

        if Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Enabled then
            local _w, _c      = Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Url, Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Color
            local description = 'The specified user attempted to use devtools / injection or netbug cheat when dropping weapons.'
            TPZ.SendToDiscordWithPlayerParameters(_w, Locales['DEVTOOLS_INJECTION_DETECTED_TITLE_LOG'], _source, PlayerData.steamName, PlayerData.username, PlayerData.identifier, PlayerData.charIdentifier, description, _c)
        end

        xPlayer.disconnect(Locales['DEVTOOLS_INJECTION_DETECTED'])
        DroppedUsersList[_source] = nil
        return
    end

    local hours, minutes, seconds = os.date('%H'), os.date('%M'), os.date('%S')
    local randomDropId = data.item .. tonumber(hours) .. tonumber(minutes) .. tonumber(seconds) .. math.random(1, 9) .. math.random(1, 9)

    DroppedItems[randomDropId]           = {}
    DroppedItems[randomDropId]           = data -- we set the data parameter because it contains all the metadata and all the required information about the dropped item.

    DroppedItems[randomDropId].dropId    = randomDropId -- unique dropped item identifier.
    DroppedItems[randomDropId].time      = Config.Droppables.RemoveAfter
    DroppedItems[randomDropId].quantity  = 1
    DroppedItems[randomDropId].type      = "weapon"
    DroppedItems[randomDropId].coords    = coords

    removeWeapon(_source, data.item, data.itemId)

    TPZ.TriggerClientEventAsyncByCoords("tpz_inventory:onDroppedItemUpdate", { actionType = "INSERT", dropId = randomDropId, data = DroppedItems[randomDropId] }, coords, 150.0, 200, true, 40)
    TriggerClientEvent('tpz_core:sendBottomTipNotification', _source, string.format(Locales['INVENTORY_DROPPED'], 1, data.label), 3000)

    local webhookData = Config.Webhooks['DROPPED_ITEMS']
    
    if webhookData.Enabled then
        local title   = "💰` Inventory Item Dropped` "
        local message = "The specified user dropped on the ground X1 " .. data.label .. " (" .. data.item .. ")"
        TPZ.SendToDiscordWithPlayerParameters(webhookData.Url, title, _source, PlayerData.steamName, PlayerData.username, PlayerData.identifier, PlayerData.charIdentifier, message, webhookData.Color)
    end  

    Wait(Config.Droppables.DropCooldown * 1000)
    DroppedUsersList[_source] = nil
end)

RegisterServerEvent("tpz_inventory:onWeaponPickup")
AddEventHandler("tpz_inventory:onWeaponPickup", function(data)
    local _source = source
    local xPlayer = TPZ.GetPlayer(_source)

    if xPlayer.hasLostConnection() then 
        print(string.format('A player with the steam name as: %s and online id: %s, attempted to pickup a weapon from the ground while his connection is lost.', GetPlayerName(_source), _source))
        return 
    end

    math.randomseed( os.time() )
    Citizen.Wait( math.random(500, 1000) )

    local PlayerData = GetPlayerData(_source)

    if DroppedItems[data.dropId] == nil then

        if Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Enabled then
            local _w, _c      = Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Url, Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Color
            local description = 'The specified user attempted to use devtools / injection or netbug cheat when picking up weapons.'
            TPZ.SendToDiscordWithPlayerParameters(_w, Locales['DEVTOOLS_INJECTION_DETECTED_TITLE_LOG'], _source, PlayerData.steamName, PlayerData.username, PlayerData.identifier, PlayerData.charIdentifier, description, _c)
        end

        xPlayer.disconnect(Locales['DEVTOOLS_INJECTION_DETECTED'])
        return
    end

    if DroppedItems[data.dropId].itemId ~= data.itemId then

        if Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Enabled then
            local _w, _c      = Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Url, Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Color
            local description = 'The specified user attempted to use devtools / injection or netbug cheat when picking up weapons.'
            TPZ.SendToDiscordWithPlayerParameters(_w, Locales['DEVTOOLS_INJECTION_DETECTED_TITLE_LOG'], _source, PlayerData.steamName, PlayerData.username, PlayerData.identifier, PlayerData.charIdentifier, description, _c)
        end

        xPlayer.disconnect(Locales['DEVTOOLS_INJECTION_DETECTED'])
        return
    end

    local canCarry = canCarryWeapon(_source, data.item)

    if canCarry then

        addWeapon(_source, data.item, data.itemId, data.metadata)

        DroppedItems[data.dropId] = nil

        TPZ.TriggerClientEventAsyncByCoords("tpz_inventory:onDroppedItemUpdate", { actionType = "REMOVE", dropId = data.dropId }, data.coords, 150.0, 200, true, 40)
        TriggerClientEvent('tpz_core:sendBottomTipNotification', _source, string.format(Locales['INVENTORY_PICKED_UP'], 1, data.label), 3000)

        local webhookData = Config.Webhooks['DROPPED_ITEMS']
    
        if webhookData.Enabled then
            local title   = "💰` Inventory Item Dropped` "
            local message = "The specified user pickuped from the ground X1 " .. data.label .. " (" .. data.item .. ")"
            TPZ.SendToDiscordWithPlayerParameters(webhookData.Url, title, _source, PlayerData.steamName, PlayerData.username, PlayerData.identifier, PlayerData.charIdentifier, message, webhookData.Color)
        end      
        
    else
        TriggerClientEvent('tpz_core:sendRightTipNotification', _source, Locales['CANNOT_CARRY_WEAPON'], 3000)

    end

    TriggerClientEvent("tpz_inventory:isPlayerPickingUp", _source, false)
end)

-----------------------------------------------------------
--[[ Threads  ]]--
-----------------------------------------------------------

-- The following thread is updating the dropped items timer in order to be removed if they are in the ground for too long.
Citizen.CreateThread(function()
    while true do
        Wait(60000)

        if DroppedItems and GetTableLength(DroppedItems) > 0 then
 
            for index, itemData in pairs (DroppedItems) do

                itemData.time = itemData.time - 1

                if itemData.time <= 0 then
                    TPZ.TriggerClientEventAsyncByCoords("tpz_inventory:onDroppedItemUpdate", { actionType = "REMOVE", dropId = itemData.dropId }, itemData.coords, 150.0, 200, true, 40)
                    DroppedItems[itemData.dropId] = nil
                end

            end

        end

    end
end)


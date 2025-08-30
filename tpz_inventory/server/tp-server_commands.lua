local TPZ = exports.tpz_core:getCoreAPI()

-----------------------------------------------------------
--[[ Local Functions ]]--
-----------------------------------------------------------

local GetIdentity = function(source, identity)
    local num = 0
    if not source then return end
    
    local num2 = GetNumPlayerIdentifiers(source)

    if GetNumPlayerIdentifiers(source) > 0 then
        local ident = nil
        while num < num2 and not ident do
            local a = GetPlayerIdentifier(source, num)
            if string.find(a, identity) then ident = a end
            num = num + 1
        end
        --return ident;
        if ident == nil then
            return ""
        end
        return string.sub(ident, 9)
    end
end

-----------------------------------------------------------
--[[ Commands ]]--
-----------------------------------------------------------

--[[ Add Item Command ]] --
RegisterCommand("additem", function(source, args, rawCommand)
    local _source = source

    local hasPermissions, await = false, true
   
    if _source ~= 0 then

        local xPlayer = TPZ.GetPlayer(_source)

        hasPermissions = xPlayer.hasPermissionsByAce("tpzcore.inventory.additem") or xPlayer.hasPermissionsByAce("tpzcore.inventory.all")

        if not hasPermissions then
            hasPermissions = xPlayer.hasAdministratorPermissions(Config.Commands['additem'].Groups, Config.Commands['additem'].DiscordRoles)
        end

        await = false

    else
        hasPermissions = true -- CONSOLE HAS PERMISSIONS.
        await = false
    end

    while await do
        Wait(100)
    end

    if hasPermissions then

        local target, item, quantity = args[1], args[2], args[3]

        if target == nil or target == '' or  tonumber(target) == nil or item == nil or item == '' or quantity == nil or quantity == '' or tonumber(quantity) == nil then
            SendCommandNotification(_source, Locales['INCORRECT_SYNTAX'], 'error', 3000)
            return
        end

        local targetSteamName = GetPlayerName(tonumber(target))

        local webhookData = Config.Commands['additem'].Webhook
    
        if webhookData.Enabled then
            local title   = "📋` /additem ".. target .. " " .. item .. " " .. quantity .. "`"
            local message = 'The specified command has been executed from the console (txadmin?).'

            if _source ~= 0 then

                local xPlayer         = TPZ.GetPlayer(_source)
                local identifier      = xPlayer.getIdentifier()

                local ip              = GetPlayerEndpoint(_source)
            
                local discordIdentity = GetIdentity(_source, "discord")
                local discordId       = string.sub(discordIdentity, 9)

                local steamName       = GetPlayerName(_source)
                
                message = "**Steam name: **`" .. steamName .. " (" .. xPlayer.getGroup() .. ")`**\nIdentifier**`" .. identifier .. "` \n**Discord:** <@" .. discordId .. ">**\nIP: **`" .. ip .. "`\n **Action:** `Used Add Item Command`"
            
            end

            TPZ.SendToDiscordWebhook(webhookData.Url, title, message, webhookData.Color)
        end

        if targetSteamName then
            local tPlayer = TPZ.GetPlayer(tonumber(target))

            if tPlayer.loaded() then

                local getItemData = SharedItems[item]

                if getItemData == nil then
                    SendCommandNotification(tonumber(_source), string.format("~e~The specified item: %s does not exist.", item), 3000)
                    return
                end

                addItem(tonumber(target), item, quantity)

                SendCommandNotification(_source, string.format("You gave : X%s %s on The following ID: %s.", quantity, item, target), 'success', 3000)
                SendCommandNotification(tonumber(target), string.format("You received X%s %s", quantity, item), 'info', 3000)
          
            else
                SendCommandNotification(_source, Locales['PLAYER_NOT_ONLINE'], 'error', 3000)
            end

        else
            SendCommandNotification(_source, Locales['PLAYER_NOT_ONLINE'], 'error', 3000)
        end

    else
        SendCommandNotification(_source, Locales['NO_PERMISSIONS'], 'error', 3000)
    end

end, false)


--[[ Add Weapon Command ]] --
RegisterCommand("addweapon", function(source, args, rawCommand)
    local _source = source

    local hasPermissions, await = false, true
   
    if _source ~= 0 then

        local xPlayer = TPZ.GetPlayer(_source)

        hasPermissions = xPlayer.hasPermissionsByAce("tpzcore.inventory.addweapon") or xPlayer.hasPermissionsByAce("tpzcore.inventory.all")
 
        if not hasPermissions then
            hasPermissions = xPlayer.hasAdministratorPermissions(Config.Commands['addweapon'].Groups, Config.Commands['addweapon'].DiscordRoles)
        end
    
        await = false

    else
        hasPermissions = true -- CONSOLE HAS PERMISSIONS.
        await = false
    end
    
    while await do
        Wait(100)
    end

    if hasPermissions then

        local target, weaponName, serialId = args[1], args[2], args[3]

        if target == nil or target == '' or tonumber(target) == nil or weaponName == nil or weaponName == '' then
            SendCommandNotification(_source, Locales['INCORRECT_SYNTAX'], 'error', 3000)
            return
        end

        local targetSteamName = GetPlayerName(tonumber(target))

        local webhookData = Config.Commands['addweapon'].Webhook
    
        if webhookData.Enabled then
            local title   = "📋` /addweapon ".. target .. " " .. weaponName .. "`"
            local message = 'The specified command has been executed from the console (txadmin?).'

            if _source ~= 0 then

                local xPlayer         = TPZ.GetPlayer(_source)
                local identifier      = xPlayer.getIdentifier()

                local ip              = GetPlayerEndpoint(_source)
            
                local discordIdentity = GetIdentity(_source, "discord")
                local discordId       = string.sub(discordIdentity, 9)

                local steamName       = GetPlayerName(_source)
                message = "**Steam name: **`" .. steamName .. " (" .. xPlayer.getGroup() .. ")`**\nIdentifier**`" .. identifier .. "` \n**Discord:** <@" .. discordId .. ">**\nIP: **`" .. ip .. "`\n **Action:** `Used Add Weapon Command`"
            
            end

            TPZ.SendToDiscordWebhook(webhookData.Url, title, message, webhookData.Color)
        end

        if targetSteamName then
            local tPlayer = TPZ.GetPlayer(tonumber(target))

            if tPlayer.loaded() then

                if SharedWeapons.Weapons[string.upper(weaponName)] == nil then
                                        SendCommandNotification(tonumber(_source), Locales['WEAPON_DOES_NOT_EXIST'], 3000)
                    return
                end

                addWeapon(tonumber(target), string.upper(weaponName), serialId)

                local weaponLabel = SharedWeapons.Weapons[string.upper(weaponName)].label

                SendCommandNotification(_source, string.format("You gave : X1 %s on The following ID: %s.", weaponLabel, target), 'success', 3000)
                SendCommandNotification(tonumber(target), string.format("You received X1 %s", weaponLabel), 'info', 3000)

            else
                SendCommandNotification(_source, Locales['PLAYER_NOT_ONLINE'], 'error', 3000)
            end

        else
            SendCommandNotification(_source, Locales['PLAYER_NOT_ONLINE'], 'error', 3000)
        end

    else
        SendCommandNotification(_source, Locales['NO_PERMISSIONS'], 'error', 3000)
    end

end, false)

--[[ Clear All Inventory Contents Command ]] --
RegisterCommand("clearinventory", function(source, args, rawCommand)
    local _source = source

    local hasPermissions, await = false, true
   
    if _source ~= 0 then

        local xPlayer = TPZ.GetPlayer(_source)

        hasPermissions = xPlayer.hasPermissionsByAce("tpzcore.inventory.clearinventory") or xPlayer.hasPermissionsByAce("tpzcore.inventory.all")

        if not hasPermissions then
            hasPermissions = xPlayer.hasAdministratorPermissions(Config.Commands['clearinventory'].Groups, Config.Commands['clearinventory'].DiscordRoles)
        end
    
        await = false

    else
        hasPermissions = true -- CONSOLE HAS PERMISSIONS.
        await = false
    end
    
    while await do
        Wait(100)
    end

    if hasPermissions then

        local target = args[1]

        if target == nil or target == '' or tonumber(target) == nil then
            SendCommandNotification(_source, Locales['INCORRECT_SYNTAX'], 'error', 3000)
            return
        end
        
        local targetSteamName = GetPlayerName(tonumber(target))

        local webhookData = Config.Commands['clearinventory'].Webhook
    
        if webhookData.Enabled then
            local title   = "📋` /clearinventory ".. target .. "`"
            local message = 'The specified command has been executed from the console (txadmin?).'

            if _source ~= 0 then

                local xPlayer         = TPZ.GetPlayer(_source)
                local identifier      = xPlayer.getIdentifier()

                local ip              = GetPlayerEndpoint(_source)
            
                local discordIdentity = GetIdentity(_source, "discord")
                local discordId       = string.sub(discordIdentity, 9)

                local steamName       = GetPlayerName(_source)
                message = "**Steam name: **`" .. steamName .. " (" .. xPlayer.getGroup() .. ")`**\nIdentifier**`" .. identifier .. "` \n**Discord:** <@" .. discordId .. ">**\nIP: **`" .. ip .. "`\n **Action:** `Used Clear Inventory Command`"
            end
            
            TPZ.SendToDiscordWebhook(webhookData.Url, title, message, webhookData.Color)
        end

        if targetSteamName then
            local tPlayer = TPZ.GetPlayer(tonumber(target))

            if tPlayer.loaded() then

                PlayerInventory[tonumber(target)].inventory = nil
                PlayerInventory[tonumber(target)].inventory = {}
        
                saveInventoryContents(tonumber(target))
        
                TriggerClientEvent('tpz_inventory:updatePlayerInventoryContents', tonumber(target), PlayerInventory[tonumber(target)], true, false)

                SendCommandNotification(_source, string.format("You cleared all the inventory contents on the following ID: %s.", target), 'success', 3000)
                SendCommandNotification(tonumber(target), "All your inventory contents have been removed.", 'info', 3000)

            else
                SendCommandNotification(_source, Locales['PLAYER_NOT_ONLINE'], 'error', 3000)
            end

        else
            SendCommandNotification(_source, Locales['PLAYER_NOT_ONLINE'], 'error', 3000)
        end

    else
        SendCommandNotification(_source, Locales['NO_PERMISSIONS'], 'error', 3000)
    end

end, false)


--[[ ------------------------------------------------
   Chat Suggestions Registration
]]---------------------------------------------------

RegisterServerEvent("tpz_inventory:registerChatSuggestions")
AddEventHandler("tpz_inventory:registerChatSuggestions", function()
    local _source = source
    
    TriggerClientEvent("chat:addSuggestion", _source, "/additem", Config.Commands['additem'].Suggestion, {
        { name = "Id", help = 'Player ID' },
        { name = "Item", help = 'Item' },
        { name = "Quantity", help = 'Quantity' },
    })
        
    TriggerClientEvent("chat:addSuggestion", _source, "/addweapon", Config.Commands['addweapon'].Suggestion, {
        { name = "Id", help = 'Player ID' },
        { name = "Weapon", help = 'Weapon Name' },
        { name = "Serial Number", help = 'Serial Number ID (do not add spaces)' },
    })

    TriggerClientEvent("chat:addSuggestion", _source, "/clearinventory", Config.Commands['clearinventory'].Suggestion, {
        { name = "Id", help = 'Player ID' },
    })
    
end)



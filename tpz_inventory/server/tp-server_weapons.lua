local TPZ = exports.tpz_core:getCoreAPI()

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
--[[ Events ]]--
-----------------------------------------------------------

-- The specified event is removing from the player a weapon by its id and weapon name.
-- You dont have to worry about DevTools and injections, its literally impossible for someone
-- to find the weapon name and the weaponId to remove.
RegisterServerEvent("tpz_inventory:removeWeaponByWeaponId")
AddEventHandler("tpz_inventory:removeWeaponByWeaponId", function(weaponId)
    local _source = source
    removeWeaponById(_source, weaponId)
end)

-- We don't mind the specified event to be triggered through devtools or injection, it does not cause anything.
RegisterServerEvent("tpz_inventory:setDefaultUsedWeapon")
AddEventHandler("tpz_inventory:setDefaultUsedWeapon", function(weaponId)
    local _source = source
    local xPlayer = TPZ.GetPlayer(_source)

    if not xPlayer.loaded() then
        return
    end

    xPlayer.setDefaultUsedWeapon(weaponId)
end)

RegisterServerEvent("tpz_inventory:reloadWeapon")
AddEventHandler("tpz_inventory:reloadWeapon", function(weaponId, item, currentAmmo, maxAmmo)
    local _source   = source
    local xPlayer   = TPZ.GetPlayer(_source)

    local inventory = PlayerInventory[_source].inventory
    local exist     = false

    -- We check for weaponId to avoid any kind of Devtools / Injections
    -- Impossible to find the weapon unique id.
    for index, content in pairs (inventory) do
    
        if content.type == 'weapon' and content.itemId == weaponId then

            local withdrawQuantity = maxAmmo - currentAmmo
            local quantity         = getItemQuantity(_source, item)
        
            if withdrawQuantity == 0 or quantity == 0 or quantity == nil then
                TriggerClientEvent('tpz_weapons:client:clearReloadingState', _source)
                return
            end
        
            local addAmmoQuantity = 0
   
            if quantity > withdrawQuantity then
                removeItem(_source, item, withdrawQuantity )
                
                addAmmoQuantity = withdrawQuantity

            end
        
            if quantity <= withdrawQuantity then
                removeItem(_source, item, quantity )
        
                addAmmoQuantity = quantity

            end
        
            if addAmmoQuantity ~= 0 then
                TriggerClientEvent("tpz_weapons:client:reloadWeaponAmmoByWeaponId", _source, weaponId, addAmmoQuantity)
            end

            exist = true
        end

    end

    if not exist then

        local PlayerData = GetPlayerData(_source)

        if Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Enabled then
            local _w, _c      = Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Webhook, Config.Webhooks['DEVTOOLS_INJECTION_CHEAT'].Color
            local description = 'The specified user attempted to use devtools / injection on reload weapon event.'
            TPZ.SendToDiscordWithPlayerParameters(_w, Locales['DEVTOOLS_INJECTION_DETECTED_TITLE_LOG'], _source, PlayerData.steamName, PlayerData.username, PlayerData.identifier, PlayerData.charIdentifier, description, _c)
        end

        xPlayer.disconnect(Locales['DEVTOOLS_INJECTION_DETECTED'])
    end

end)

RegisterServerEvent("tpz_inventory:setWeaponMetadata")
AddEventHandler("tpz_inventory:setWeaponMetadata", function(weaponId, type, value)
    local _source   = source
    local inventory = PlayerInventory[_source].inventory
    local exist     = false

    for index, content in pairs (inventory) do
    
        if content.type == 'weapon' and content.itemId == weaponId then

            if type == "AMMO_TYPE" then
                content.metadata.ammoType = value
            end

            if type == "SET_AMMO" then
                content.metadata.ammo = tonumber(value)
            end
            
            if type == "DIRT_LEVEL" and value ~= nil and value ~= 0 then
                content.metadata.dirtLevel = tonumber(value) + 0.0
            end

            if type == "SET_DURABILITY" then
                content.metadata.durability = tonumber(value)
            end

            if type == "ADD_DURABILITY" then
                
                content.metadata.durability = content.metadata.durability + tonumber(value)

                if content.metadata.durability >= 100 then
                    content.metadata.durability = 100
                end

            end

            if type == 'COMPONENT' then

                -- In case the component does not exist, we add it to the components list.
                if content.metadata.components[value[1]] == nil then
                    content.metadata.components[value[1]] = {}
                end

                if tonumber(value[2]) == 0 then -- If the component is 0 (nothing), we reset.
                    content.metadata.components[value[1]] = nil

                else
                    content.metadata.components[value[1]] = value[2]
                end

                print(value[1], value[2])
            end

            exist = true
        end

    end

    if exist then
        TriggerClientEvent('tpz_inventory:updatePlayerInventoryContents', _source, PlayerInventory[_source], false, false)
    end
    
end)

RegisterServerEvent("tpz_inventory:onThrowableWeaponAmmoAmbientPickup")
AddEventHandler("tpz_inventory:onThrowableWeaponAmmoAmbientPickup", function(pickedType)
    local _source = source

    pickedType = string.gsub(pickedType, "PICKUP_", "")

    local isThrowable = false

    -- If picked up was a weapon throwable.
    if SharedWeapons.Weapons[pickedType] then

        addWeapon(_source, pickedType)

    else -- is ammo throwable (arrow, etc.) - AMMO ALWAYS AN ITEM.

        local data = SharedWeapons.Ammo[pickedType]

        if data then
            local item = SharedWeapons.Ammo[pickedType].item
            addItem(_source, item, 1)
        end

    end

end)

-----------------------------------------------------------
--[[ Callbacks ]]--
-----------------------------------------------------------

exports.tpz_core:getCoreAPI().addNewCallBack("tpz_inventory:callbacks:requestWeaponData", function(source, cb, data)
    local _source   = source
    local inventory = PlayerInventory[_source].inventory

    local weapon_data = {}

    for index, content in pairs (inventory) do
    
        if content.type == 'weapon' and content.itemId == data.itemId then
            weapon_data = content
			break
        end

    end

    return cb(weapon_data)

end)


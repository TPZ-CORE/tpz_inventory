
-----------------------------------------------------------
--[[ NUI Callbacks  ]]--
-----------------------------------------------------------

RegisterNUICallback('equipWeapon', function(data)
	local WeaponAPI = exports.tpz_weapons:getWeaponsAPI()
	ClosePlayerInventory()

	WeaponAPI.saveUsedWeaponData()
    WeaponAPI.equipWeapon(data.itemId, data.item, data.ammoType, data.ammo, data.label, data.durability, data.metadata)
end)

RegisterNUICallback('unequipWeapon', function(data)
	local WeaponAPI = exports.tpz_weapons:getWeaponsAPI()

    ClosePlayerInventory()

	WeaponAPI.saveUsedWeaponData()
	WeaponAPI.clearUsedWeaponData(true)
end)

-- @param item
-- @param itemId
-- @param metadata
RegisterNUICallback('setAmmoType', function(data)
	local WeaponAPI = exports.tpz_weapons:getWeaponsAPI()
	
    ClosePlayerInventory()

	Wait(550)

	local UsedWeapon = WeaponAPI.getUsedWeaponData()

	local ammo = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(UsedWeapon.hash))

	if ammo > 1 then
		TriggerEvent('tpz_core:sendBottomTipNotification', Locales['CANNOT_CHANGE_TYPE'], 4000)
		return
	end

	local weaponGroup      = GetWeapontypeGroup(GetHashKey(UsedWeapon.hash))
	local getAmmoTypes     = SharedWeapons.AmmoTypes[tostring(weaponGroup)]

	local elements         = {}

	for index, ammo in pairs (getAmmoTypes) do
		table.insert(elements, SharedWeapons.Ammo[ammo].label)
	end

	local inputData = {
		title = Locales['SET_AMMO_TITLE'],
		desc  = "",
		buttonparam1 = Locales['SET_AMMO_ACCEPT'],
		buttonparam2 = Locales['SET_AMMO_DECLINE'],
	
		options = elements
	}

	Wait(500)

	TriggerEvent("tp_inputs:getSelectedOptionsInput", inputData, function(cb)
		if cb == "DECLINE" then
			return
		end

		local ammoType = nil

		for index, ammo in pairs (SharedWeapons.Ammo) do
			if cb == ammo.label then
				ammoType = index
			end
		end

		Wait(250)
		TriggerServerEvent("tpz_inventory:setWeaponMetadata", data.itemId, "AMMO_TYPE", ammoType)

		WeaponAPI.setUsedWeaponAmmoType(ammoType)
		Citizen.InvokeNative(0xCC9C4393523833E2, PlayerPedId(), GetHashKey(string.upper(UsedWeapon.hash)), GetHashKey(ammoType) )
	end)

end)



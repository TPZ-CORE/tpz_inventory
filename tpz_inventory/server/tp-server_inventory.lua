local TPZ = exports.tpz_core:getCoreAPI()

PlayerInventory = {}

-----------------------------------------------------------
--[[ Base Events  ]]--
-----------------------------------------------------------

AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    PlayerInventory = nil
end)

AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end

    if Config.UseDatabaseItems then

        Wait(2000)
    
        SharedItems = nil
        SharedItems = {}

        exports["ghmattimysql"]:execute("SELECT * FROM items", {}, function(result)

            for index, res in pairs (result) do
    
                SharedItems[res.item]                = {}
                SharedItems[res.item].item           = res.item
                SharedItems[res.item].label          = res.label
                SharedItems[res.item].weight         = res.weight
                SharedItems[res.item].remove         = res.remove
                SharedItems[res.item].type           = res.type
                SharedItems[res.item].description    = res.description
                SharedItems[res.item].action         = res.action
                SharedItems[res.item].stackable      = res.stackable
                SharedItems[res.item].droppable      = res.droppable
                SharedItems[res.item].closeInventory = res.closeInventory
            end
            
        end)

    end

    Wait(2000)
    LoadContainerInventories()

end)
  
-----------------------------------------------------------
--[[ Functions  ]]--
-----------------------------------------------------------

-- Loading player inventory contents
function LoadPlayerInventoryContents(source, identifier, charId, newChar)
	local _source = source

    PlayerInventory[_source] = {}

    exports["ghmattimysql"]:execute("SELECT * FROM characters WHERE identifier = @identifier AND charidentifier = @charidentifier", { ['identifier'] = identifier, ['charidentifier'] = tonumber(charId) }, function(result)

		while result == nil or result[1] == nil do
			Wait(100)
		end
		
        local res           = result[1]
        local inventoryData = PlayerInventory[_source]

        if type(res.inventory_slots) == "string" then
            inventoryData.slots = json.decode(res.inventory_slots)
        end

        if res.inventory == nil or tostring(res.inventory) == '[]' then
            
            inventoryData.inventory = {}
            TriggerClientEvent('tpz_inventory:updatePlayerInventoryContents', _source, inventoryData, true, true)
            
            if tonumber(newChar) == 1 then

                local CoreConfig = exports.tpz_core:getCoreAPI().GetConfig().NewCharacter

                local hasStartItems, hasStartWeapons = CoreConfig.StartItems.Enabled, CoreConfig.StartWeapons.Enabled
    
                if hasStartItems then
                    local startItemsList = CoreConfig.StartItems.Items
 
                    for item, quantity in pairs (startItemsList) do
                        addItem(_source, item, quantity)
                    end
                        
                end
    
                if hasStartWeapons then
                    local startWeaponsList = CoreConfig.StartWeapons.Weapons
    
                    for _, weaponName in pairs (startWeaponsList) do
                        addWeapon(_source, weaponName)
                    end
    
                end
    
            end

            return
        end

        if Config.UseDatabaseItems then
            local decodedInventoryContents  = json.decode(res.inventory)
            local updatedInventoryContents  = {}
    
            local finished                  = false
    
            for index, content in pairs (decodedInventoryContents) do
    
                if content.type ~= "weapon" then
                    
                    if SharedItems[content.item] then -- We are re-modifying important data on existing items if there were changes from items table.
                        content.weight         = SharedItems[content.item].weight
                        content.label          = SharedItems[content.item].label
                        content.remove         = SharedItems[content.item].remove
                        content.stackable      = SharedItems[content.item].stackable
                        content.droppable      = SharedItems[content.item].droppable
                        content.action         = SharedItems[content.item].action
                        content.closeInventory = SharedItems[content.item].closeInventory
                    end
                end
    
                table.insert(updatedInventoryContents, content)
    
                if next(decodedInventoryContents, index) == nil then
                    finished = true
                end
            end
    
            while not finished do
                Wait(150)
            end
    
            inventoryData.inventory = updatedInventoryContents

        else
            inventoryData.inventory = json.decode(res.inventory)
        end

        TriggerClientEvent('tpz_inventory:updatePlayerInventoryContents', _source, inventoryData, true, true)

    end)

end

function saveInventoryContents(source, remove)
    local _source          = source
    local xPlayer          = TPZ.GetPlayer(_source)

    local inventoryData    = PlayerInventory[_source].inventory

    local Parameters = { 
        ['identifier']      = xPlayer.getIdentifier(),
        ['charidentifier']  = xPlayer.getCharacterIdentifier(),
        ['inventory']       = json.encode(inventoryData), 
        ['inventory_slots'] = json.encode(PlayerInventory[_source].slots),
    }

    Citizen.CreateThread(function()
        exports.ghmattimysql:execute("UPDATE `characters` SET `inventory` = @inventory, `inventory_slots` = @inventory_slots WHERE `identifier` = @identifier AND `charidentifier` = @charidentifier", Parameters)
    end)

    if remove then
        PlayerInventory[_source] = nil
    end

end

-----------------------------------------------------------
--[[ Events  ]]--
-----------------------------------------------------------

RegisterServerEvent("tpz_inventory:server:set_slot")
AddEventHandler("tpz_inventory:server:set_slot", function(slot, item)
    local _source = source
    PlayerInventory[_source].slots[slot] = item
end)

local usableItemsList = {}

-----------------------------------------------------------
--[[ Base Events  ]]--
-----------------------------------------------------------

AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    usableItemsList = nil
end)


-----------------------------------------------------------
--[[ General Events  ]]--
-----------------------------------------------------------

RegisterServerEvent("tpz_inventory:removeUsableItem")
AddEventHandler("tpz_inventory:removeUsableItem", function(itemId, id, item, label)
    local _source       = source
    removeItem(_source, item, 1, tonumber(itemId))
end)

RegisterServerEvent("tpz_inventory:useItem")
AddEventHandler("tpz_inventory:useItem", function(itemId, id, item, label, weight, durability, metadata)
	local _source       = source
    local inventoryData = PlayerInventory[_source].inventory

    if SharedItems[item] == nil then
        print("The following item {" .. item .. "} does not exist.")
        return
    end

    if usableItemsList[item] then

        local arguments = { 
            source     = _source, 

            name       = item, 
            item       = item,
            itemId     = itemId, 
            id         = id, 
            label      = label, 
            weight     = weight, 
            durability = durability, 
            metadata   = metadata
            
        }

        usableItemsList[item](arguments)

    else
       -- print("The following item {" .. item .. "} has not been registered as usable item.")
    end
end)

-----------------------------------------------------------
--[[ Functions  ]]--
-----------------------------------------------------------

function registerUsableItem(name, script, cb)
	usableItemsList[name] = cb

	if Config.Debug then
		print("Callback for the following item {" .. name .. "} has been successfully registered from the following script: " .. script)
	end
end

-- Should be called when restarting a script which contains registered usable items.
function unRegisterUsableItem(name)

    if usableItemsList[name] then

        usableItemsList[name] = nil

        if Config.Debug then
            print("The following item {" .. name .. "} has been successfully un-registered.")
        end

    else
		print("The following item {" .. name .. "} has not been registered to remove it from the item registrations list.")
    end

end
---------------------------------------------------------------
--[[ Local Functions ]]--
---------------------------------------------------------------

local CheckWeaponForSerialNumber = function (weaponName)
    
    for _, name in pairs (SharedWeapons.NoSerialNumberWeapons) do
        if weaponName == name then return true end
    end

    return false
end

---------------------------------------------------------------
--[[ Functions ]]--
---------------------------------------------------------------

function getWeight(source)
    local inventory = PlayerInventory[source].inventory
    local finished  = false

    local totalWeight = 0

    if next(inventory) == nil or #inventory <= 0 then
        return totalWeight
    end
    
    if GetTableLength(inventory) > 0 then

        for index, content in pairs (inventory) do

            if content.quantity > 0 then -- In case of bugged item quantity we check if quantity is more than 0.
                totalWeight = totalWeight + (content.quantity * content.weight)
            end

        end

    end

    return totalWeight
end

function canCarryWeight(source, totalWeight)

    local TPZ                = exports.tpz_core:getCoreAPI()
    local maxInventoryWeight = TPZ.GetPlayer(source).getInventoryWeightCapacity()
    local currentWeight      = getWeight(source)

    if (currentWeight + totalWeight) > maxInventoryWeight then 
        return false
    else 
        return true
    end
end

function canCarryItem(source, item, quantity)
    
    if SharedItems[item] then
        local itemWeight         = SharedItems[item].weight * quantity

        local maxInventoryWeight = Config.InventoryMaxWeight
        local currentWeight      = getWeight(source)
    
        if (currentWeight + itemWeight) > maxInventoryWeight then 
            return false 
        else 
            return true 
        end
        
    else
        print(string.format(Locales['ERROR_ITEM_DOES_NOT_EXIST_CONFIG'], item))
        return false
    end
end

function getItemWeight(item)

    if SharedItems[item] then

        return SharedItems[item].weight
    else
        print(string.format(Locales['ERROR_ITEM_DOES_NOT_EXIST_CONFIG'], item))
        return 0.0
    end
end

function doesPlayerHaveWeapon(source, item, itemId)
    local inventory     = PlayerInventory[source].inventory
    local finished      = false
    local totalQuantity = 0

    if next(inventory) == nil or #inventory <= 0 then
        return totalQuantity
    end

    local inventoryLength = GetTableLength(inventory)

    if inventoryLength > 0 then

        for index, content in pairs (inventory) do

            if content.type == 'weapon' and content.item == item and content.itemId == itemId then
                return true
            end

        end

    end

    return false
end

function getItemQuantity(source, item)

    local inventory     = PlayerInventory[source].inventory
    local finished      = false
    local totalQuantity = 0

    if next(inventory) == nil or #inventory <= 0 then
        return totalQuantity
    end

    local itemData = SharedItems[item]
    
    if itemData then

        local inventoryLength = GetTableLength(inventory)

        if inventoryLength > 0 then

            for index, content in pairs (inventory) do

                if content.item == item then
        
                    if tonumber(itemData.stackable) == 0 then 
                        totalQuantity = totalQuantity + 1
                    end
        
                    if tonumber(itemData.stackable) == 1 then 
                        totalQuantity = content.quantity
                    end
                end
        
                if next(inventory, index) == nil then
                    finished = true
                end
        
            end
    
        else
            finished = true
        end

        while not finished do
            Wait(10)
        end
    end

    return tonumber(totalQuantity)
end

function addItem(source, item, quantity, metadata, itemId, preventRefresh)
    local _source   = source
    local inventory = PlayerInventory[_source].inventory

    local finished  = false
    local exist     = false

    if SharedItems[item] then

        if canCarryItem(_source, item, quantity) then

            local itemData = SharedItems[item]
    
            if not metadata then
                metadata = {}
            end

            if metadata.description == nil then
                metadata.description = itemData.description
            end

            if metadata.durability == nil then
                metadata.durability = 100
            end

            if Config.HideDurabilityFromItems[item] then
                metadata.durability = -1
            end

            if metadata.itemId then
                itemId = metadata.itemId
            end
  
            if tonumber(itemData.stackable) == 0 then

                for i = 1, tonumber(quantity) do
                    
                    if itemId == nil then

                        local hours, minutes, seconds = os.date('%H'), os.date('%M'), os.date('%S')
                        
                        local generatedItemId = tonumber(hours) .. tonumber(minutes) .. tonumber(seconds) .. math.random(1, 9).. math.random(1, 9).. math.random(1, 9)
                        
                        itemId = generatedItemId
                    end

                    local ItemParameters = {
                        item = item, 
                        itemId = itemId,
                        quantity = 1,
                        label = itemData.label, 
                        weight = tonumber(itemData.weight), 
                        remove = tonumber(itemData.remove), 
                        type = "item", 
                        description = metadata.description, 
                        metadata = metadata,
                        action = itemData.action,
                        stackable = itemData.stackable,
                        droppable = itemData.droppable,
                        closeInventory = itemData.closeInventory,
                    }

                    table.insert(PlayerInventory[_source].inventory, ItemParameters)

                    itemId = nil
                end

                if not preventRefresh then
                    Wait(250)
                    TriggerClientEvent('tpz_inventory:updatePlayerInventoryContents', _source, PlayerInventory[_source], true, false)
                end

            else

                local inventoryLength = GetTableLength(inventory)

                if inventoryLength > 0 then
                    for index, content in pairs (inventory) do

                        if tostring(content.item) == tostring(item) then
    
                            content.quantity = content.quantity + quantity
    
                            finished = true
                            exist    = true
                        end
    
                        if next(inventory, index) == nil then
                            finished = true
                        end
    
                    end
                else
                    finished = true
                    exist = false
                end

                while not finished do
                    Wait(50)
                end


                if not exist then

                    local ItemParameters = {
                        --id = tonumber(itemData.id), 
                        item = item, 
                        itemId = 0,
                        quantity = tonumber(quantity),
                        label = itemData.label, 
                        weight = tonumber(itemData.weight), 
                        remove = tonumber(itemData.remove), 
                        type = "item", 
                        description = metadata.description, 
                        metadata = metadata,
                        action = itemData.action,
                        stackable = 1,
                        droppable = itemData.droppable,
                        closeInventory = itemData.closeInventory,
                    }
    
                    table.insert(PlayerInventory[_source].inventory, ItemParameters)

                    if not preventRefresh then
                        TriggerClientEvent('tpz_inventory:updatePlayerInventoryContents', _source, PlayerInventory[_source], true, false)
                    end

                else
                    if not preventRefresh then
                        TriggerClientEvent('tpz_inventory:updatePlayerInventoryContents', _source, PlayerInventory[_source], true, false)
                    end

                end

            end
            
        else
           TriggerClientEvent('tpz_core:sendRightTipNotification', _source, Locales['CANNOT_CARRY_ITEM'], 3000)
        end
    else
        print(string.format(Locales['ERROR_ITEM_DOES_NOT_EXIST_CONFIG'], item))
    end
end

function removeItem(source, item, quantity, itemId, preventRefresh)
    local _source   = source
    local exist     = false
    local count     = 0

    if SharedItems[item] then

        local inventory = PlayerInventory[_source].inventory
        local itemData  = SharedItems[item]

        local shouldLoopForRemoval = true

        local inventoryLength = GetTableLength(inventory)

        if inventoryLength > 0 then

            for index, content in pairs (inventory) do 

                if content.item == item then
    
                    if tonumber(itemData.stackable) == 0 then -- If the item is not stackable, we check if we want to remove a specific item with its itemId, otherwise we remove the first item if itemId is null.
    
                        if itemId and tonumber(content.itemId) == tonumber(itemId) then
    
                            table.remove(inventory, index)
                            
                            exist = true
                            shouldLoopForRemoval = false
                        end
                        
                        if not itemId then
                            shouldLoopForRemoval = true
                            exist = true
                        end
                    end
    
     
                    if tonumber(itemData.stackable) == 1 then -- If the item is stackable, we remove the quantity from that item.
    
                        content.quantity = content.quantity - quantity
     
                        if content.quantity <= 0 then
                            table.remove(inventory, index)
                        end
                        
                        exist = true
                        shouldLoopForRemoval = false
     
                    end
    
                end
    
            end
            
        end

        if exist then

            -- shouldLoopForRemoval is required for item which are not stackables and not checking for specific itemId,
            -- when removing an item from the loop, the index id is changing, that way we cannot remove all the required quantity
            -- and we creating a separate loop which checks and breaks it after every 1 until it reaches the max quantity.
            if shouldLoopForRemoval then

                while count ~= tonumber(quantity) do
                    Wait(50)

                    for _index, _content in pairs (inventory) do 
                        if _content.item == item and tonumber(itemData.stackable) == 0 and not itemId then
                            table.remove(inventory, _index)
                            count = count + 1
                            break
                        end

                    end
                end
    
            end

            if not preventRefresh then
                TriggerClientEvent('tpz_inventory:updatePlayerInventoryContents', _source, PlayerInventory[_source], true, false)
            end
            
        else
            print(string.format(Locales['WARN_ITEM_DOES_NOT_EXIST_INV'], item))
        end

    else
        print(string.format(Locales['ERROR_ITEM_DOES_NOT_EXIST_CONFIG'], item))
    end
end

function removeItemById(source, itemId, preventRefresh)
    local _source   = source
    local exist     = false

    local inventory = PlayerInventory[_source].inventory
    local inventoryLength = GetTableLength(inventory)

    if inventoryLength > 0 then

        for index, content in pairs (inventory) do 

            if itemId and tostring(content.itemId) == tostring(itemId) then

                table.remove(inventory, index)
                
                exist = true
            end
                
        end

        if exist then

            if not preventRefresh then
                TriggerClientEvent('tpz_inventory:updatePlayerInventoryContents', _source, PlayerInventory[_source], true, false)
            end
            
        else
            print(string.format(Locales['WARN_ITEM_DOES_NOT_EXIST_INV'], itemId))
        end

    else
        print(string.format(Locales['ERROR_ITEM_DOES_NOT_EXIST_CONFIG'], itemId))
    end
end

function addWeapon(source, weaponName, weaponItemId, metadata)
    local _source   = source

    if SharedWeapons.Weapons[string.upper(weaponName)] then

        local WeaponData = SharedWeapons.Weapons[string.upper(weaponName)]

        if canCarryWeapon(_source, weaponName) then

            if not metadata then
                metadata = {}
            end

            if metadata.description == nil then
                metadata.description = WeaponData.description
            end

            if metadata.durability == nil then
                metadata.durability = 100
            end

            if metadata.ammo == nil then
                metadata.ammo       = 0
            end

            if metadata.ammoType == nil then
                metadata.ammoType = nil
            end

            if metadata.components == nil then
                metadata.components = {} 
            end

            if metadata.dirtLevel == nil then
                metadata.dirtLevel  = 0.0
            end

            if weaponItemId == nil or weaponItemId == '' or weaponItemId == ' ' then
      
                local hours, minutes, seconds = os.date('%H'), os.date('%M'), os.date('%S')
                
                weaponItemId = "unknown-".. tonumber(hours) .. tonumber(minutes) .. tonumber(seconds)  .. math.random(1, 9).. math.random(1, 9).. math.random(1, 9)
            end

           -- local requiresNoSerialNumber = CheckWeaponForSerialNumber(string.upper(weaponName))

            --if not requiresNoSerialNumber then
            --    weaponItemId = 'N/A'
           -- end

            local ItemParameters = {
                id             = 0, 
                item           = string.lower(weaponName), 
                itemId         = weaponItemId,
                quantity       = 1,
                label          = WeaponData.label, 
                weight         = WeaponData.weight, 
                remove         = 0, 
                type           = "weapon", 
                metadata       = metadata,
                action         = "weapon",
                stackable      = 0,
                droppable      = 1,
                closeInventory = 1,
            }

            table.insert(PlayerInventory[_source].inventory, ItemParameters)
            TriggerClientEvent('tpz_inventory:updatePlayerInventoryContents', _source, PlayerInventory[_source], true, false)
       
        else
            TriggerClientEvent('tpz_core:sendRightTipNotification', _source, Locales['CANNOT_CARRY_WEAPON'], 3000)
        end

    end
end

function removeWeapon(source, weapon, weaponId)
    local _source   = source
    local exist     = false

    local _weapon   = weapon
    local inventory = PlayerInventory[_source].inventory
    
    local shouldLoopForRemoval = true

    if inventory and GetTableLength(inventory) > 0 then

        for index, content in pairs (inventory) do 

            if content.type == "weapon" then

                if string.upper(content.item) == string.upper(_weapon) then

                    if tostring(content.itemId) == tostring(weaponId) then
        
                        table.remove(inventory, index)
                        exist = true
                        shouldLoopForRemoval = false
                    end

                    if not weaponId then
                        exist = true
                        shouldLoopForRemoval = true
                    end
                end
    
            end

        end

    end

    if exist then

        -- shouldLoopForRemoval is required when weaponId is null, it loops through the player inventory to find the first
        -- result for removing it from the player inventory, otherwise the weapon would never be removed without it.
        if shouldLoopForRemoval then

            for _index, _content in pairs (inventory) do 

                if string.upper(_content.item) == string.upper(_weapon) and content.type == 'weapon' and not weaponId then
                    table.remove(inventory, _index)
                    break
                end

            end

        end

        TriggerClientEvent('tpz_inventory:updatePlayerInventoryContents', _source, PlayerInventory[_source], true, false)
    else
        print(string.format(Locales['WARN_WEAPON_DOES_NOT_EXIST_INV'], _weapon))
    end

end

function removeWeaponById(source, weaponId)
    local _source   = source
    local exist     = false

    local inventory = PlayerInventory[_source].inventory
    
    if inventory and GetTableLength(inventory) > 0 then

        for index, content in pairs (inventory) do 

            if content.type == "weapon" then

                if tostring(content.itemId) == tostring(weaponId) then
        
                    table.remove(inventory, index)
                    exist = true
                end
    
            end

        end

    end

    if exist then
        TriggerClientEvent('tpz_inventory:updatePlayerInventoryContents', _source, PlayerInventory[_source], true, false)
    else
        print(string.format(Locales['WARN_WEAPON_DOES_NOT_EXIST_INV'], weaponId))
    end

end

function canCarryWeapon(source, weaponName)
    local _source       = source

    if SharedWeapons.Weapons[string.upper(weaponName)] then

        local WeaponData = SharedWeapons.Weapons[string.upper(weaponName)]

        local maxInventoryWeight = Config.InventoryMaxWeight
        local currentWeight      = getWeight(_source)
    
        if (currentWeight + WeaponData.weight) > maxInventoryWeight then return false else return true end

    else
        print(string.format(Locales['ERROR_WEAPON_DOES_NOT_EXIST'], weaponName))
        return false
    end

end

-----------------------------------------------------------
--[[ Container Functions  ]]--
-----------------------------------------------------------

function addContainerItem(containerId, item, itemId, quantity, metadata)

    local inventory = Containers[containerId].inventory
    
    local finished  = false
    local exist     = false

    if SharedItems[item] then

        local itemData = SharedItems[item]
    
        if not metadata then
            metadata = {}
        end

        if metadata.description == nil then
            metadata.description = itemData.description
        end

        if metadata.durability == nil then
            metadata.durability = 100
        end

        if tonumber(itemData.stackable) == 0 then

            if itemId == nil then

                local hours, minutes, seconds = os.date('%H'), os.date('%M'), os.date('%S')

                itemId = tonumber(hours) .. tonumber(minutes) .. tonumber(seconds)  .. math.random(1, 9).. math.random(1, 9).. math.random(1, 9)
            end

            for i = 1, tonumber(quantity) do

                local ItemParameters = {
                    --id = tonumber(itemData.id), 
                    item = item, 
                    itemId = itemId,
                    quantity = 1,
                    label = itemData.label, 
                    weight = tonumber(itemData.weight), 
                    remove = tonumber(itemData.remove), 
                    type = "item", 
                    metadata = metadata,
                    action = itemData.action,
                    stackable = itemData.stackable,
                    droppable = itemData.droppable,
                    closeInventory = itemData.closeInventory,
                }

                table.insert(Containers[containerId].inventory, ItemParameters)
            end

        else

            local inventoryLength = GetTableLength(inventory)

            if inventoryLength > 0 then
        
                for index, content in pairs (inventory) do

                    if tostring(content.item) == tostring(item) then
    
                        content.quantity = content.quantity + quantity
    
                        finished = true
                        exist    = true
                    end
    
                    if next(inventory, index) == nil then
                        finished = true
                    end
    
                end
            else
                finished = true
            end

            while not finished do
                Wait(50)
            end

            if not exist then

                local ItemParameters = {
                    --id = tonumber(itemData.id), 
                    item = item, 
                    itemId = 0,
                    quantity = tonumber(quantity),
                    label = itemData.label, 
                    weight = tonumber(itemData.weight), 
                    remove = tonumber(itemData.remove), 
                    type = "item", 
                    description = description, 
                    metadata = metadata,
                    action = itemData.action,
                    stackable = 1,
                    droppable = itemData.droppable,
                    closeInventory = itemData.closeInventory,
                }

                table.insert(Containers[containerId].inventory, ItemParameters)

            end

        end


    else
        print(string.format(Locales['ERROR_ITEM_DOES_NOT_EXIST_CONFIG'], item))
    end
end

function removeContainerItem(containerId, item, quantity, itemId)
    local finished  = false
    local exist     = false
    local count     = 0

    if SharedItems[item] then

        local inventory = Containers[containerId].inventory
        local itemData  = SharedItems[item]

        local shouldLoopForRemoval = true

        local inventoryLength = GetTableLength(inventory)

        if inventoryLength > 0 then

            for index, content in pairs (inventory) do 

                if content.item == item then
    
                    if tonumber(itemData.stackable) == 0 then -- If the item is not stackable, we check if we want to remove a specific item with its itemId, otherwise we remove the first item if itemId is null.
    
                        if itemId and tonumber(content.itemId) == tonumber(itemId) then
    
                            table.remove(inventory, index)
                            exist = true
                            shouldLoopForRemoval = false
                        end
                        
                        if not itemId then
                            shouldLoopForRemoval = true
                            exist = true
                        end
                    end
    
     
                    if tonumber(itemData.stackable) == 1 then -- If the item is stackable, we remove the quantity from that item.
    
                        content.quantity = content.quantity - quantity
     
                        if content.quantity <= 0 then
                            table.remove(inventory, index)
                        end
                        
                        exist = true
                        shouldLoopForRemoval = false
     
                    end
    
                end
    
                if next(inventory, index) == nil then
                    finished = true
                end
            end
        else
            finished = true
        end

        while not finished do
            Wait(50)
        end

        if exist then

            -- shouldLoopForRemoval is required for item which are not stackables and not checking for specific itemId,
            -- when removing an item from the loop, the index id is changing, that way we cannot remove all the required quantity
            -- and we creating a separate loop which checks and breaks it after every 1 until it reaches the max quantity.
            if shouldLoopForRemoval then

                while count ~= tonumber(quantity) do
                    Wait(50)

                    for _index, _content in pairs (inventory) do 
                        if _content.item == item and tonumber(itemData.stackable) == 0 and not itemId then
                            table.remove(inventory, _index)
                            count = count + 1
                            break
                        end

                    end
                end
    
            end

        end

    else
        print(string.format(Locales['ERROR_ITEM_DOES_NOT_EXIST_CONFIG'], item))
    end
end

function canCarryContainerItem(containerId, item, quantity)
    
    if SharedItems[item] then

        local inventory = Containers[containerId]

        local itemWeight         = SharedItems[item].weight * quantity

        local maxInventoryWeight = inventory.maxWeight
        local currentWeight      = getContainerWeight(containerId)
    
        if (currentWeight + itemWeight) > maxInventoryWeight then return false else return true end
    else
        print(string.format(Locales['ERROR_ITEM_DOES_NOT_EXIST_CONFIG'], item))
        return false
    end
end

function addContainerWeapon(containerId, weaponName, weaponItemId, metadata)

    if SharedWeapons.Weapons[string.upper(weaponName)] then

        local WeaponData = SharedWeapons.Weapons[string.upper(weaponName)]

        if not metadata then
            metadata = {}
        end

        if metadata.description == nil then
            metadata.description = WeaponData.description
        end

        if metadata.durability == nil then
            metadata.durability = 100
        end

        if weaponItemId == nil or weaponItemId == '' or weaponItemId == ' ' then
   
            local hours, minutes, seconds = os.date('%H'), os.date('%M'), os.date('%S')
            
            weaponItemId = "unknown-" .. tonumber(hours) .. tonumber(minutes) .. tonumber(seconds) .. math.random(1, 9).. math.random(1, 9).. math.random(1, 9)
        end

        local ItemParameters = {
           -- id             = 0, 
            item           = string.lower(weaponName), 
            itemId         = weaponItemId,
            quantity       = 1,
            label          = WeaponData.label, 
            weight         = WeaponData.weight, 
            remove         = 0, 
            type           = "weapon", 
            metadata       = metadata,
            action         = "weapon",
            stackable      = 0,
            droppable      = 1,
            closeInventory = 1,
        }

        table.insert(Containers[containerId].inventory, ItemParameters)

    end
end

function removeContainerWeapon(containerId, weapon, weaponId)

    local exist     = false

    local _weapon   = weapon
    local inventory = Containers[containerId].inventory

    if inventory and GetTableLength(inventory) > 0 then

        for index, content in pairs (inventory) do 

            if content.type == "weapon" and tonumber(content.itemId) == tonumber(weaponId) then
    
                table.remove(inventory, index)
                exist = true
            end
    
        end

    end

    if not exist then
        print(string.format(Locales['WARN_WEAPON_DOES_NOT_EXIST_INV'], _weapon))
    end

end

function canCarryContainerWeapon(containerId, weaponName)
  
    if SharedWeapons.Weapons[string.upper(weaponName)] then

        local WeaponData = SharedWeapons.Weapons[string.upper(weaponName)]

        local inventory          = Containers[containerId]

        local maxInventoryWeight = inventory.maxWeight
        local currentWeight      = getContainerWeight(containerId)
    
        if (currentWeight + WeaponData.weight) > maxInventoryWeight then return false else return true end

    else
        print(string.format(Locales['ERROR_WEAPON_DOES_NOT_EXIST'], weaponName))
        return false
    end

end

function getContainerWeight(containerId)
    local inventory   = Containers[containerId].inventory
    local totalWeight = 0

    if next(inventory) == nil or #inventory <= 0 then
        return totalWeight
    end
    
    if inventory and GetTableLength(inventory) > 0 then

        for index, content in pairs (inventory) do

            if content.quantity > 0 then -- In case of bugged item quantity we check if quantity is more than 0.
                totalWeight = totalWeight + (content.quantity * content.weight)
            end
    
        end

    end

    return totalWeight
end

function getContainerItemQuantity(containerId, item)

    local inventory     = Containers[containerId].inventory
    local totalQuantity = 0

    if next(inventory) == nil or #inventory <= 0 then
        return totalQuantity
    end

    local itemData  = SharedItems[item]
    
    if itemData then

        if inventory and GetTableLength(inventory) > 0 then

            for index, content in pairs (inventory) do

                if content.item == item then
        
                    if tonumber(itemData.stackable) == 0 then 
                        totalQuantity = totalQuantity + 1
                    end
        
                    if tonumber(itemData.stackable) == 1 then 
                        totalQuantity = content.quantity
                    end
                end

            end

        end

    end

    return tonumber(totalQuantity)
end

-- @GetTableLength returns the length of a table.
function GetTableLength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

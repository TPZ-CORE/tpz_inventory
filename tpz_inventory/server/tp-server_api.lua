exports('getInventoryAPI', function()
    local self = {}

    self.registerUsableItem = function(name, script, cb) 
        registerUsableItem(name, script, cb)
    end

    self.unRegisterUsableItem = function(name) 
        unRegisterUsableItem(name)
    end


    -- containers

    self.getContainerInventoryContents = function (containerId)

        if Containers[containerId] == nil then
            local emptyTable = {}

            print("container id : " .. containerId .. " does not exist.")
            return emptyTable
        end

        return Containers[containerId].inventory
    end

    self.getContainerWeight = function(containerId)
        return getContainerWeight(containerId)
    end

    self.getContainerItemQuantity = function(containerId, item)
        return getContainerItemQuantity(containerId, item)
    end

    self.canCarryContainerItem = function(containerId, item, quantity)
        return canCarryContainerItem(containerId, item, quantity)
    end

    self.addContainerItem = function(containerId, item, quantity, itemId, metadata)
        addContainerItem(containerId, item, itemId, quantity, metadata)
    end

    self.removeContainerItem = function(containerId, item, quantity, itemId)
        removeContainerItem(containerId, item, quantity, itemId)
    end

    self.canCarryContainerWeapon = function(containerId, weaponName)
        return canCarryContainerWeapon(containerId, weaponName)
    end

    self.addContainerWeapon = function(containerId, weaponName, itemId, metadata)
        addContainerWeapon(containerId, weaponName, itemId, metadata)
    end

    self.removeContainerWeapon = function(containerId, weaponName, itemId)
        removeContainerWeapon(containerId, weaponName, itemId)
    end

    -- end of containers

    self.getInventoryContents = function(source)
        return PlayerInventory[source].inventory
    end
    
    self.getInventoryTotalWeight = function(source)
        return getWeight(source)
    end

    self.getInventoryMaxWeight = function()
        return Config.InventoryMaxWeight
    end

    self.getItemQuantity = function(source, item)
        return getItemQuantity(source, item)
    end

    self.getItemWeight = function(item)
        return getItemWeight(item)
    end

    self.getWeaponWeight = function(weaponName)

        if SharedWeapons.Weapons[string.upper(weaponName)] then

            local WeaponData = SharedWeapons.Weapons[string.upper(weaponName)]

            return WeaponData.weight
        else
            print(string.format(Locales['ERROR_WEAPON_DOES_NOT_EXIST'], weaponName))
            return 0.0
        end

    end

    self.canCarryWeight = function(source, totalWeight)
        return canCarryWeight(source, totalWeight)
    end

    self.canCarryItem = function(source, item, quantity)
        return canCarryItem(source, item, quantity)
    end

    self.addItem = function(source, item, quantity, metadata)
        addItem(source, item, quantity, metadata)
    end

    self.removeItem = function(source, item, quantity, itemId)
        removeItem(source, item, quantity, itemId)
    end

    self.removeItemById = function(source, itemId)
        removeItemById(source, itemId)
    end

    self.getItemData = function(item)

        if SharedItems[item] then
            return SharedItems[item]
        else
            print(string.format(Locales['ERROR_ITEM_DOES_NOT_EXIST_CONFIG'], item))
            return nil
        end

    end

    self.getItemLabel = function(item)

        if SharedItems[item] then
            return SharedItems[item].label
        else
            print(string.format(Locales['ERROR_ITEM_DOES_NOT_EXIST_CONFIG'], item))
            return nil
        end
    end

    self.isItemStackable = function (item)
        if SharedItems[item] then
            return SharedItems[item].stackable

        else
            print(string.format(Locales['ERROR_ITEM_DOES_NOT_EXIST_CONFIG'], item))
            return nil
        end

    end

    self.isItemRemovable = function (item)
        if SharedItems[item] then
            return SharedItems[item].remove

        else
            print(string.format(Locales['ERROR_ITEM_DOES_NOT_EXIST_CONFIG'], item))
            return nil
        end

    end

    self.addItemDurability = function(source, item, durability, itemId)
        local _source           = source
        local exist             = false
        local currentDurability = 100

        if SharedItems[item] then

            local inventory = PlayerInventory[_source].inventory

            for index, content in pairs (inventory) do
    
                if content.item == item and tonumber(content.itemId) == tonumber(itemId) then
                    currentDurability = tonumber(content.metadata.durability) + durability

                    if currentDurability >= 100 then
                        content.metadata.durability = 100
                    end

                    exist = true
                end
       
            end
    
            if exist then

                TriggerClientEvent('tpz_inventory:updatePlayerInventoryContents', _source, PlayerInventory[_source], false, false)
            else
                print(string.format(Locales['WARN_ITEM_DOES_NOT_EXIST_INV'], item))
            end

        else
            print(string.format(Locales['ERROR_ITEM_DOES_NOT_EXIST_CONFIG'], item))
        end
    end

    self.removeItemDurability = function(source, item, durability, itemId, remove)
        local _source = source
        local exist   = false

        if SharedItems[item] then

            local inventory = PlayerInventory[_source].inventory

            for index, content in pairs (inventory) do
    
                if content.item == item and tonumber(content.itemId) == tonumber(itemId) then
                    content.metadata.durability = tonumber(content.metadata.durability) - durability

                    if content.metadata.durability <= 0 and remove then
                        removeItem(_source, item, 1, tonumber(itemId))
                    end

                    exist = true
                end

                if content.item == item and itemId == nil then

                    content.metadata.durability = tonumber(content.metadata.durability) - durability

                    if content.metadata.durability <= 0 and remove then
                        removeItem(_source, item, 1, tonumber(itemId))
                    end

                    exist = true
                end

            end
    
            if exist then

                TriggerClientEvent('tpz_inventory:updatePlayerInventoryContents', _source, PlayerInventory[_source], false, false)
            else
                print(string.format(Locales['WARN_ITEM_DOES_NOT_EXIST_INV'], item))
            end

        else
            print(string.format(Locales['ERROR_ITEM_DOES_NOT_EXIST_CONFIG'], item))
        end
    end

    self.getItemDurability = function(source, item, itemId)

        local _source           = source
        local exist             = false
        local currentDurability = 100

        if SharedItems[item] then

            local inventory = PlayerInventory[_source].inventory

            for index, content in pairs (inventory) do
    
                if content.item == item and tonumber(content.itemId) == tonumber(itemId) then
                    currentDurability = content.metadata.durability
                    exist = true
                end
            end
    
            if exist then
                return currentDurability

            else
                print(string.format(Locales['WARN_ITEM_DOES_NOT_EXIST_INV'], item))
                return nil
            end

        else
            print(string.format(Locales['ERROR_ITEM_DOES_NOT_EXIST_CONFIG'], item))
            return nil
        end

    end

    self.getItemMetadata = function(source, item, itemId)

        local _source           = source
        local exist             = false
        local currentMetadata   = {}

        if SharedItems[item] then

            local inventory = PlayerInventory[_source].inventory

            for index, content in pairs (inventory) do
    
                if content.item == item and tonumber(content.itemId) == tonumber(itemId) then
                    currentMetadata = content.metadata
                    exist = true
                end
       
            end
    
            if exist then
                return currentMetadata

            else
                print(string.format(Locales['WARN_ITEM_DOES_NOT_EXIST_INV'], item))
                return nil
            end

        else
            print(string.format(Locales['ERROR_ITEM_DOES_NOT_EXIST_CONFIG'], item))
            return nil
        end

    end

    self.addItemMetadata = function(source, item, itemId, metadata)

        local _source           = source
        local exist             = false

        if SharedItems[item] then

            local inventory = PlayerInventory[_source].inventory

            for index, content in pairs (inventory) do
    
                if content.item == item and tonumber(content.itemId) == tonumber(itemId) then
                    table.insert(content.metadata, metadata)
                    exist = true
                end
       
            end
    
            if not exist then
                print(string.format(Locales['WARN_ITEM_DOES_NOT_EXIST_INV'], item))
            end

        else
            print(string.format(Locales['ERROR_ITEM_DOES_NOT_EXIST_CONFIG'], item))
        end

    end

    -- Weapons API Functions

    self.getWeaponLabel = function(weaponName)

        if SharedWeapons.Weapons[string.upper(weaponName)] == nil then
            return weaponName
        end

        return SharedWeapons.Weapons[string.upper(weaponName)].label
    end

    self.canCarryWeapon = function(source, weaponName)
        return canCarryWeapon(source, weaponName)
    end

    self.doesPlayerHaveWeapon = function(source, item, itemId)
        return doesPlayerHaveWeapon(source, item, itemId)
    end

    self.addWeapon = function(source, weaponName, weaponItemId, metadata)
        addWeapon(source, weaponName, weaponItemId, metadata)
    end

    self.removeWeapon = function(source, weapon, weaponId)
        removeWeapon(source, weapon, weaponId)
    end

    self.removeWeaponById = function(source, weaponId)
        removeWeaponById(source, weaponId)
    end

    self.addWeaponDurability = function(source, weaponName, value, weaponId)
        local _source = source
        local exist   = false

        if SharedWeapons.Weapons[string.upper(weaponName)] then
            
            local inventory = PlayerInventory[_source].inventory

            for index, content in pairs (inventory) do
        
                if content.type == 'weapon' and content.itemId == weaponId then

                    content.metadata.durability = content.metadata.durability + tonumber(value)

                    if content.metadata.durability >= 100 then
                        content.metadata.durability = 100 
                    end

                    exist = true
                end

            end

            if exist then
                TriggerClientEvent('tpz_inventory:updatePlayerInventoryContents', _source, PlayerInventory[_source], false, false)
            else
                print(string.format(Locales['WARN_WEAPON_DOES_NOT_EXIST_INV'], weaponName))
            end

        else
            print(string.format(Locales['ERROR_WEAPON_DOES_NOT_EXIST'], weaponName))
        end
    
    end

    self.removeWeaponDurability = function(source, weaponName, value, weaponId)
        local _source = source
        local exist   = false

        if SharedWeapons.Weapons[string.upper(weaponName)] then
            
            local inventory = PlayerInventory[_source].inventory

            for index, content in pairs (inventory) do
        
                if content.type == 'weapon' and content.itemId == weaponId then

                    content.metadata.durability = content.metadata.durability - tonumber(value)

                    if content.metadata.durability <= 0 then
                        content.metadata.durability = 0 
                    end

                    exist = true
                end

            end

            if exist then
                TriggerClientEvent('tpz_inventory:updatePlayerInventoryContents', _source, PlayerInventory[_source], false, false)
            else
                print(string.format(Locales['WARN_WEAPON_DOES_NOT_EXIST_INV'], weaponName))
            end

        else
            print(string.format(Locales['ERROR_WEAPON_DOES_NOT_EXIST'], weaponName))
        end
    
    end

    self.getWeaponMetadata = function(source, weaponName, weaponId)

        local _source           = source
        local exist             = false
        local currentMetadata   = {}

        if SharedWeapons.Weapons[string.upper(weaponName)] then

            local inventory = PlayerInventory[_source].inventory

            for index, content in pairs (inventory) do
        
                if content.type == 'weapon' and content.itemId == weaponId then
                    currentMetadata = content.metadata
                    exist = true
                end
       
            end
    
            if exist then
                return currentMetadata

            else
                print(string.format(Locales['WARN_WEAPON_DOES_NOT_EXIST_INV'], item))
                return nil
            end

        else
            print(string.format(Locales['ERROR_WEAPON_DOES_NOT_EXIST'], item))
            return nil
        end

    end


    -- OTHER

    self.saveInventoryContents = function(source)
        saveInventoryContents(source)
    end

    self.clearInventoryContents = function(source)
        local _source = source

        PlayerInventory[_source].inventory = nil
        PlayerInventory[_source].inventory = {}

        saveInventoryContents(_source)

        TriggerClientEvent('tpz_inventory:updatePlayerInventoryContents', _source, PlayerInventory[_source], true, false)
    end

    self.getSharedItems = function()
        return SharedItems
    end

    self.getSharedWeapons = function()
        return SharedWeapons.Weapons
    end

    self.closeInventory = function(source)
        TriggerClientEvent('tpz_inventory:closePlayerInventory', source)
    end

    return self
end)

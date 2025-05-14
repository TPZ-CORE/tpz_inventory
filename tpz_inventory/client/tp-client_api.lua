exports('getInventoryAPI', function()
    local self = {}

    -- returns boolean.
    self.loadedInventoryContents = function()
        return GetPlayerData().HasLoadedContents
    end

    -- returns table.
    self.getInventoryContents = function()
        return GetPlayerData().Inventory
    end

    -- returns boolean.
    self.isInventoryActive = function()
        return GetPlayerData().IsInventoryOpen
    end

    -- returns boolean.
    self.isSecondaryInventoryActive = function()
        return GetPlayerData().IsSecondaryInventoryOpen
    end

    self.getPlayerData = function()
        return GetPlayerData()
    end

    self.closeInventory = function()
        ClosePlayerInventory()
    end

    self.openInventoryContainerById = function(containerId, header, isTarget, disable)
        openInventoryContainerById(containerId, header, isTarget, disable)
    end

    -- returns the weapon_registrations.lua file shared weapons list related to weapons and ammo.
    self.getSharedWeapons = function()
        return SharedWeapons
    end

    self.getItemData = function(item)

        if SharedItems[item] then
            return SharedItems[item]
        else
            print(string.format(Locales['ERROR_ITEM_DOES_NOT_EXIST_CONFIG'], item))
            return nil
        end

    end
    
    return self
end)

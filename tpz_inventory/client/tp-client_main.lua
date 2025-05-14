
local PlayerData = {
    IsReady                  = false,
    HasLoadedContents        = false,
    IsInventoryOpen          = false,
    HasShortcutsActive       = false,
    IsSecondaryInventoryOpen = false,
    IsPickingUp              = false,
    Inventory                = {},
}

-----------------------------------------------------------
--[[ Functions  ]]--
-----------------------------------------------------------


function GetPlayerData()
    return PlayerData
end

-----------------------------------------------------------
--[[ Events  ]]--
-----------------------------------------------------------

-- @tpz_core:isPlayerReady : After selecting a character, we request the player inventory contents.
AddEventHandler("tpz_core:isPlayerReady", function(newChar)
    Wait(2000)

    -- If devmode is enabled, we are not running the following code since it already does.
    if Config.DevMode then
        return
    end

    TriggerServerEvent("tpz_inventory:requestPlayerInventoryContents", newChar)
    PlayerData.IsReady = true

    CreatePrompts()

    TriggerServerEvent("tpz_inventory:startEatablesTimeRemoval")
    TriggerServerEvent("tpz_inventory:registerChatSuggestions")
end)

-- @tpz_inventory:updatePlayerInventoryContents : Updates the inventory contents after selecting a character or after inventory updates.
RegisterNetEvent('tpz_inventory:updatePlayerInventoryContents')
AddEventHandler("tpz_inventory:updatePlayerInventoryContents", function(data, refresh, first)
    PlayerData.Inventory         = data.inventory
    PlayerData.HasLoadedContents = true

    if refresh and PlayerData.IsInventoryOpen and not PlayerData.IsSecondaryInventoryOpen then -- When updating the player contents, we check if player inventory is active to refresh the inventory.
        RefreshPlayerInventory()
    end

    if first then
        print("Successfully loaded all player inventory contents.")
    end

end)


-- @tpz_inventory:closePlayerInventory : When triggered, the player inventory will be set as false when active and close the NUI.
RegisterNetEvent('tpz_inventory:closePlayerInventory')
AddEventHandler("tpz_inventory:closePlayerInventory", function()
    ClosePlayerInventory()
end)

-----------------------------------------------------------
--[[ Threads  ]]--
-----------------------------------------------------------

-- If Config.DevMode is enabled, we request the player inventory contents when resource restarts.

if Config.DevMode then
        
    Citizen.CreateThread(function()
        CreatePrompts()
        
        SetNuiFocus(false, false)

        Wait(1000)
        TriggerServerEvent("tpz_inventory:requestPlayerInventoryContents", 0)
        PlayerData.IsReady = true

        TriggerServerEvent("tpz_inventory:startEatablesTimeRemoval")
        TriggerServerEvent("tpz_inventory:registerChatSuggestions")

    end)
end


Citizen.CreateThread(function()
    while true do

        Wait(0)

        if IsControlJustReleased(1, Config.ActionKeys.OpenInventory) and PlayerData.IsReady and PlayerData.HasLoadedContents then

            local player = PlayerPedId()

            if not PlayerData.IsInventoryOpen and IsPedHogtied(player) ~= 1 and not IsPedCuffed(player) then

                OpenPlayerInventory()
                Wait(1000)
            end
            
        end

    end
    
end)


Citizen.CreateThread(function()
    while true do

        Wait(1000)

        if PlayerData.IsInventoryOpen and Config.DisableDeathInventory then
            sleep = true

            if IsPedDeadOrDying(PlayerPedId(), false) then
                ClosePlayerInventory()
            end

        end

    end
    
end)


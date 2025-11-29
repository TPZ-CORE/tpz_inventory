
local PlayerData = {
    IsReady                  = false,
    HasLoadedContents        = false,
    IsInventoryOpen          = false,
    HasShortcutsActive       = false,
    IsSecondaryInventoryOpen = false,
    IsPlayerInventoryOpen    = false,
    PlayerInventoryId        = 0,
    PlayerInventoryRetrieveDataEvent = "",
    IsPickingUp              = false,
    Inventory                = {},
    Slots                    = {},
    InventoryMaxWeight       = 0,
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

    local data = exports.tpz_core:getCoreAPI().GetPlayerClientData()

    if data == nil then
        return
    end

    PlayerData.InventoryMaxWeight = data.inventoryMaxWeight

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
    PlayerData.Slots             = data.slots
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

        local data = exports.tpz_core:getCoreAPI().GetPlayerClientData()

        if data == nil then
            return
        end

        PlayerData.InventoryMaxWeight = data.inventoryMaxWeight

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

-- PUSH TO TALK.
CreateThread(function()
    repeat Wait(5000) until PlayerData.IsReady 
    local IS_NUI_FOCUSED = false

    while true do
        local sleep = 0

        if not PlayerData.IsInventoryOpen then

            if IS_NUI_FOCUSED then
                SetNuiFocusKeepInput(false)
                IS_NUI_FOCUSED = false
            end

            sleep = 1000

            goto END
        end

        if PlayerData.IsInventoryOpen then


            if not IS_NUI_FOCUSED then
                SetNuiFocusKeepInput(true)
                IS_NUI_FOCUSED = true
            end

            DisableAllControlActions(0)
            EnableControlAction(0, `INPUT_PUSH_TO_TALK`, true)
        end

        ::END::
        Wait(sleep)
    end
end)

CreateThread(function()
    repeat Wait(5000) until PlayerData.IsReady 
    local IS_NUI_FOCUSED = false

    while true do
        Wait(1)
        DisableControlAction(0, 0x07CE1E61, true)
        DisableControlAction(0, 0xF84FA74F, true)
        DisableControlAction(0, 0xD8F73058, true)
        DisableControlAction(0, 0xAC4BD4F1, true)
    end

end)

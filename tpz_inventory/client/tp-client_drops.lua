local TPZ = exports.tpz_core:getCoreAPI()

local DroppedItems = {}


-- (!) The created objects are client-side in order to not cause any syncing issues, 
-- the objects and their data are updating in real time for all the connected players, including the objects.

-----------------------------------------------------------
--[[ Base Events  ]]--
-----------------------------------------------------------

-- @onResourceStop : We remove all the spawned objects within player distance when the resource stops.
AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    local droppedItemsList = DroppedItems

    -- We check first the size of the dropped items table, if the list is not empty, then we run the following code to remove all the objects.
    if TPZ.GetTableLength(droppedItemsList) > 0 then

        for index, droppedData in pairs (droppedItemsList) do

            if droppedData.object then
                DeleteEntity(droppedData.object)
                SetEntityAsNoLongerNeeded(droppedData.object)
            end

            DroppedItems[droppedData.dropId] = nil

        end
    end

end)

-----------------------------------------------------------
--[[ Events  ]]--
-----------------------------------------------------------

-- @tpz_inventory:updateDroppedItemsList : The following event is triggered only once to receive all dropped items when character is selected.
RegisterNetEvent('tpz_inventory:updateDroppedItemsList')
AddEventHandler("tpz_inventory:updateDroppedItemsList", function(data)
    DroppedItems = data
end)

-- @tpz_inventory:onDroppedItemUpdate : The following event is triggered on dropped items change (PICKUP, DROP).
RegisterNetEvent('tpz_inventory:onDroppedItemUpdate')
AddEventHandler("tpz_inventory:onDroppedItemUpdate", function(cb)

    if cb.actionType == "INSERT" then
        
        DroppedItems[cb.dropId] = {}
        DroppedItems[cb.dropId] = cb.data

    elseif cb.actionType == "REMOVE" then

        if DroppedItems[cb.dropId].object then
            DeleteEntity(DroppedItems[cb.dropId].object)
            SetEntityAsNoLongerNeeded(DroppedItems[cb.dropId].object)
        end

        DroppedItems[cb.dropId] = nil
    end
end)


RegisterNetEvent('tpz_inventory:isPlayerPickingUp')
AddEventHandler("tpz_inventory:isPlayerPickingUp", function(cb)
    local PlayerData  = GetPlayerData()
    PlayerData.IsPickingUp = cb
end)

-----------------------------------------------------------
--[[ Functions  ]]--
-----------------------------------------------------------

PlayPickupAnimation = function()
    local dict = "amb_work@world_human_box_pickup@1@male_a@stand_exit_withprop"
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(10)
    end
    TaskPlayAnim(PlayerPedId(), dict, "exit_front", 1.0, 8.0, -1, 1, 0, false, false, false)
    Wait(1200)
    PlaySoundFrontend("CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", true, 1)
    Wait(1000)
    ClearPedTasks(PlayerPedId())
    RemoveAnimDict(dict)
end

-----------------------------------------------------------
--[[ Threads  ]]--
-----------------------------------------------------------

-- The following thread is for loading / unloading dropped items when close to the player location.
Citizen.CreateThread(function()
    while true do

        local player = PlayerPedId()
        local sleep  = 1500

        if TPZ.GetTableLength(DroppedItems) <= 0 then
            goto END
        end

        for index, droppedData in pairs (DroppedItems) do
    
            local coordsDroppedObject = vector3(droppedData.coords.x, droppedData.coords.y, droppedData.coords.z)
            local distance = #(GetEntityCoords(player) - coordsDroppedObject)

            if droppedData.object and distance > Config.Droppables.RenderDistance then
                DeleteEntity(droppedData.object)
                SetEntityAsNoLongerNeeded(droppedData.object)
    
                droppedData.object = nil
            end
    
            if droppedData.object == nil and distance <= Config.Droppables.RenderDistance then

                local model       = Config.Droppables.Types[droppedData.type]
                local objectModel = GetHashKey(model)
    
                RequestModel(objectModel)
        
                while not HasModelLoaded(objectModel) do Citizen.Wait(0) end
    
                droppedData.object = CreateObject(objectModel, droppedData.coords.x, droppedData.coords.y, droppedData.coords.z, false, false)
                Citizen.InvokeNative(0x58A850EAEE20FAA3, droppedData.object)              -- PlaceObjectOnGroundProperly
                Citizen.InvokeNative(0xDC19C288082E586E, droppedData.object, true, false) -- SetEntityAsMissionEntity
                Citizen.InvokeNative(0x7D9EFB7AD6B19754, droppedData.object, true)        -- FreezeEntityPosition
                Citizen.InvokeNative(0x7DFB49BCDB73089A, droppedData.object, true)        -- SetPickupLight
                Citizen.InvokeNative(0xF66F820909453B8C, droppedData.object, false, true) -- SetEntityCollision
    
            end
    
        end

        ::END::
        Wait(sleep)
    end

end)

-- The following thread is checking the distance between the player and the rendered object to display the prompt action.
Citizen.CreateThread(function()
    
    while true do

        local player = PlayerPedId()
        local sleep  = 1500

        local PlayerData  = GetPlayerData()

        if PlayerData.IsPickingUp or IsEntityDead(player) or IsPedOnMount(player) or IsPedInAnyVehicle(playerPed, false) or IsPedSwimming(player) or IsPedLassoed(player) then
            goto END
        end

        if TPZ.GetTableLength(DroppedItems) > 0 then

            local coords = GetEntityCoords(player)
            
            for index, droppedData in pairs (DroppedItems) do

                if droppedData.object then

                    local droppedCoords       = GetEntityCoords(droppedData.object)

                    local coordsDroppedObject = vector3(droppedCoords.x, droppedCoords.y, droppedCoords.z)
                    local distance = #(coords - coordsDroppedObject)

                    if distance <= Config.Droppables.ActionDistance then
                        sleep = 0
    
                        local droppedDisplay = "X" .. droppedData.quantity .. " " .. droppedData.label

                        if droppedData.type == 'money' or droppedData.type == 'gold' or droppedData.type == 'blackmoney' then
                            droppedDisplay = droppedData.quantity .. " " .. droppedData.label
                        end

                        local label = CreateVarString(10, 'LITERAL_STRING', droppedDisplay)
                        PromptSetActiveGroupThisFrame(Prompts, label)

                        for i, prompt in pairs (PromptsList) do
    
                            if prompt.action == "droppables" then
                                PromptSetEnabled(prompt.prompt, 1)
                            else
                                PromptSetEnabled(prompt.prompt, 0)
                            end
                            
                            if PromptHasHoldModeCompleted(prompt.prompt) then

                                if prompt.type == "PICKUP_DROPPABLES" then

                                    local foundPlayer    = false
                                    local nearestPlayers = GetNearestPlayers(Config.Droppables.ActionDistance + 1.0)
                                
                                    for _, player in pairs(nearestPlayers) do
                                        if player ~= PlayerId() then
                                            foundPlayer = true
                                        end
                                    end

                                    Wait(250)
                                    if not foundPlayer then
                                        PlayerData.IsPickingUp = true
                                        PlayPickupAnimation()

                                        if droppedData.type == "item" then
                                            TriggerServerEvent("tpz_inventory:onItemPickup", droppedData)

                                        elseif droppedData.type == "weapon" then
                                            TriggerServerEvent("tpz_inventory:onWeaponPickup", droppedData)

                                        elseif droppedData.type == "money" or droppedData.type == "blackmoney" or droppedData.type == "gold" then

                                            TriggerServerEvent("tpz_inventory:onMoneyPickup", droppedData.type, droppedData)
                                        end
                                    else
                                        TriggerEvent('tpz_core:sendRightTipNotification', Locales['PLAYER_NEAR'], 3000)
                                    end
                                end
    
                                Wait(2000)
                            end
    
                        end
                        
                    end

                end

            end

        end

        ::END::
        Wait(sleep)

    end
end)

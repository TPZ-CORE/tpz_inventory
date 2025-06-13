

local TPZ = exports.tpz_core:getCoreAPI()

local ConnectedPlayers  = {}

-----------------------------------------------------------
--[[ General Events  ]]--
-----------------------------------------------------------

RegisterServerEvent("tpz_inventory:requestPlayerInventoryContents")
AddEventHandler("tpz_inventory:requestPlayerInventoryContents", function(newChar)
    local _source = source

    while not TPZ.GetPlayer(_source).loaded() do
        Wait(1000)
    end

    local xPlayer        = TPZ.GetPlayer(_source)

    local identifier     = xPlayer.getIdentifier()
    local charIdentifier = xPlayer.getCharacterIdentifier()

    Wait(1250)
    LoadPlayerInventoryContents(_source, identifier, charIdentifier, newChar)
    
    ConnectedPlayers[_source] = true
end)

RegisterServerEvent("tpz_inventory:startEatablesTimeRemoval")
AddEventHandler("tpz_inventory:startEatablesTimeRemoval", function()
    local _source = source

    if not Config.Eatables.Enabled then 
        return
    end

    Citizen.CreateThread(function()
        while true do
            Wait(60000 * Config.Eatables.DurabilityRemovalTimer)
    
            if GetPlayerName(_source) == nil or PlayerInventory[_source] == nil then
                break
            end

            local inventoryData = PlayerInventory[_source].inventory
            local updated, refresh  = false, false

            local inventoryLength = GetTableLength(inventoryData)

            if inventoryLength > 0 then

                for index, content in pairs (inventoryData) do

                    local ItemData = Config.Eatables.Items[content.item]

                    if ItemData and tonumber(content.stackable) == 0 then

                        if content.metadata.durability > 0 then

                            local removeValue = tonumber(ItemData.removeValue[1])

                            if ItemData.removeValue[2] then
                                local randomRemoveValue = math.random(ItemData.removeValue[1], ItemData.removeValue[2])
                                removeValue = tonumber(randomRemoveValue)
                            end
    
                            content.metadata.durability = tonumber(content.metadata.durability) - removeValue
    
                        end

                        if content.metadata.durability <= 0 then

                            content.metadata.durability = 0 
    
                            removeItemById(_source, content.itemId, true) -- true : preventing inv refresh so we can refresh it only once below.

                            if ItemData.newItem then

                                if canCarryItem(_source, ItemData.newItem, 1) then
                                    addItem(_source, ItemData.newItem, 1, nil, nil, true) -- true : preventing inv refresh so we can refresh it only once below.
                                end
                            end

                            refresh = true
    
                        end
                       
                        updated = true

                    end
    
                end

            end

            if updated then
                TriggerClientEvent('tpz_inventory:updatePlayerInventoryContents', _source, PlayerInventory[_source], refresh, false)
            end

        end

    end)

end)


AddEventHandler('playerDropped', function (reason)
    local _source = source

    if ConnectedPlayers[_source] then
        saveInventoryContents(_source, true)
        ConnectedPlayers[_source] = nil
    end

end)

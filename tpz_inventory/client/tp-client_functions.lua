Prompts           = GetRandomIntInRange(0, 0xffffff)
PromptsList       = {}

CreatePrompts = function()

    for index, tprompt in pairs (Config.PromptKeys) do

        local str = tprompt.label
        local keyPress = tprompt.key
    
        local _prompt = PromptRegisterBegin()
        PromptSetControlAction(_prompt, keyPress)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(_prompt, str)
        PromptSetEnabled(_prompt, 1)
        PromptSetVisible(_prompt, 1)
        PromptSetStandardMode(_prompt, 1)
        PromptSetHoldMode(_prompt, 1000)
        PromptSetGroup(_prompt, Prompts)
        Citizen.InvokeNative(0xC5F428EE08FA7F2C, _prompt, true)
        PromptRegisterEnd(_prompt)
    
        table.insert(PromptsList, {prompt = _prompt, type = index, action = tprompt.action})
    end

end

---------------------------------------------------------------
-- General Functions
---------------------------------------------------------------

function GetNearestPlayers(distance)
	local closestDistance = distance
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed, true, true)
	local closestPlayers = {}

	for _, player in pairs(GetActivePlayers()) do
		local target = GetPlayerPed(player)

		if target ~= playerPed then
			local targetCoords = GetEntityCoords(target, true, true)
			local distance = #(targetCoords - coords)

			if distance < closestDistance then
				table.insert(closestPlayers, player)
			end
		end
	end
	return closestPlayers
end

function Anim(actor, dict, body, duration, flags, introtiming, exittiming)
	Citizen.CreateThread(function()
		RequestAnimDict(dict)
		local dur = duration or -1
		local flag = flags or 1
		local intro = tonumber(introtiming) or 1.0
		local exit = tonumber(exittiming) or 1.0
		timeout = 5
		while (not HasAnimDictLoaded(dict) and timeout>0) do
			timeout = timeout-1
			if timeout == 0 then 
				print("Animation Failed to Load")
			end
			Citizen.Wait(300)
		end
		TaskPlayAnim(actor, dict, body, intro, exit, dur, flag --[[1 for repeat--]], 1, false, false, false, 0, true)
	end)
end

function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

function LoadAnimDict(dict)
    if HasAnimDictLoaded(dict) then return end

    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
		print("1")
        Wait(10)
    end
end

function LoadModel(inputModel)
    local model = joaat(inputModel)
 
    RequestModel(model)
 
    while not HasModelLoaded(model) do RequestModel(model)
        Citizen.Wait(10)
    end
end


function StartsWith(String,Start)
	return string.sub(String,1,string.len(Start))==Start
end
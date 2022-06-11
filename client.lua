Citizen.CreateThread(function()
    local dict = "random@mugging3"
    
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end
    local handsup = false
	while true do
		Citizen.Wait(3)
		if IsControlJustPressed(1, 323) then
            if not handsup then
                TaskPlayAnim(PlayerPedId(), dict, "handsup_standing_base", 8.0, 8.0, -1, 50, 0, false, false, false)
                handsup = true
                TriggerServerEvent('stormydormy:server:toggleHandsup', true)
            else
                TriggerServerEvent('stormydormy:server:toggleHandsup', false)
                handsup = false
                ClearPedSecondaryTask(PlayerPedId())
            end
        end

        if handsup then
            if not IsEntityPlayingAnim(PlayerPedId(), dict, "handsup_standing_base", 3) then
                TaskPlayAnim(PlayerPedId(), dict, "handsup_standing_base", 8.0, 8.0, -1, 50, 1, false, false, false)
            end
        end
    end
end)

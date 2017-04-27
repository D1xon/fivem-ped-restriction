local pedsrestrict = 
{
	"S_M_M_MovAlien_01",
	"S_M_M_MovSpace_01",
	"U_M_Y_RSRanger_01",
	"U_M_Y_Zombie_01",
}


function restrictpeds()
	local ped = GetPlayerPed(-1)
	local outfit = GetEntityModel(ped)
	
	for i = 1, #pedsrestrict, 1 do
		local restricted = GetHashKey(pedsrestrict[i])
		if outfit == restricted then
			local newped = GetHashKey("a_m_y_hipster_01")
			RequestModel(newped)
			while not HasModelLoaded(newped) do
				Citizen.Wait()
			end
			SetPlayerModel(PlayerId(), newped)
			SetModelAsNoLongerNeeded(newped)
			TriggerEvent("chatMessage", "[System]", { 255,0,0}, "Trying to spawn restricted model.")
		end
	end
end

Citizen.CreateThread(function()
	while true do
	
		local ped = GetPlayerPed(-1)
		if DoesEntityExist(ped) then
			restrictpeds()
		end
		Citizen.Wait(0)
	end
end)


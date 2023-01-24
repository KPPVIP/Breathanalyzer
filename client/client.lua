ESX = nil
local shown = false
local alkotester = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)



RegisterNetEvent('breathanalyzer:alkotestchecken')
AddEventHandler('breathanalyzer:alkotestchecken', function(cop)

local status = 0
local ped = GetPlayerPed(-1)
local person = GetPlayerServerId(closestPlayer)
					SendNUIMessage({
						action = "open",
					})
					Wait(2000)
TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5.0,'alkotester', 0.025)

TriggerEvent('esx_status:getStatus', 'drunk', function(status)
				 drunk = status.val
Wait(5000)
end)

local nextCop = ESX.Game.GetClosestPlayer()
showResultofTest()

SendNUIMessage({
	action = "open",
})
					
Wait(5000)
end)

function startTest()
local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
		if closestPlayer ~= -1 and closestDistance <= 2.0 then
			local cop = GetPlayerPed(-1)
				ESX.ShowNotification("Gerät wird initialisiert")	
				TriggerEvent('breathanalyzer:toggledevice') 
				
					SendNUIMessage({
						action = "open",
					})
					local ergebnis = 0.00
					SendNUIMessage({
						ergebnis
					})
						Wait(3500)

				TriggerServerEvent('breathanalyzer:alkotest', GetPlayerServerId(closestPlayer)) 
				local playerPed = PlayerPedId()
				local lib, anim = 'amb@code_human_wander_drinking_fat@beer@male@base', 'static'
					for i=1, 3 do
						Citizen.Wait(250)
							ESX.Streaming.RequestAnimDict(lib, function()
							TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
						end)
					end	
			else ESX.ShowNotification("Es ist keine Person in der Nähe") 
		end
end

RegisterNetEvent('breathanalyzer:startTest')
AddEventHandler('breathanalyzer:startTest', function(source)

startTest()

end)

RegisterNetEvent('breathanalyzer:alkotestzeigen')
AddEventHandler('breathanalyzer:alkotestzeigen', function( wert )
SendNUIMessage({
result = wert
})
SendNUIMessage({
mgprol = "mg/l" 
})			 			 
	Wait(4000)
SendNUIMessage({
action = "close",
})
	
end)


---------------   Uncomment following lines to enable usage of the device via command ----------------

--RegisterCommand('alkotest', function(source, args, rawCommand)
--startTest()
--end)
--TriggerEvent('chat:addSuggestion', '/alkotest', 'Benutze diesen Command für einen Alkovortest')

------------------------------------------------------------------------------------------------------

function showResultofTest()

local nextCop = ESX.Game.GetClosestPlayer()
TriggerServerEvent('breathanalyzer:alkotestergebis', GetPlayerServerId(nextCop), drunk)

end




RegisterNetEvent('breathanalyzer:toggledevice')
AddEventHandler('breathanalyzer:toggledevice', function()
	if alkotester == nil then
		alkotester = CreateObject(GetHashKey("prop_inhaler_01"), 0, 0, 0, true, true, true) 
		AttachEntityToEntity(alkotester, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.1, 0.03, 0.03, 90.0, 180.0, 270.0, true, true, false, true, 1, true) 	
	elseif alkotester ~= nil then 
        DeleteEntity(alkotester)
        alkotester = nil
	end
end)



RegisterNetEvent('breathanalyzer:alkotestergebisanzeigen')
AddEventHandler('breathanalyzer:alkotestergebisanzeigen', function(drunk)

local wert = 0
if drunk == 0 then wert = 0.00


-- You can change this if you want custom settings. For example, the alcoholic bar has 1.000.000 ticks at maximum. 
-- In my settings, a bottle vine adds 600.000 ticks to that bar. That equals a result of 0.60mg/l - 1.2 Promille


elseif drunk <= 50000 and drunk > 1 then wert = 0.05 --0.1 Promille
elseif drunk <= 100000 and drunk > 50000 then wert = 0.10 --0.2 Promille
elseif drunk <= 150000 and drunk > 100000 then wert = 0.15 --0.3 Promille
elseif drunk <= 200000 and drunk > 150000 then wert = 0.20 --0.4 Promille
elseif drunk <= 250000 and drunk > 200000 then wert = 0.25 --0.5 Promille
elseif drunk <= 300000 and drunk > 250000 then wert = 0.30 --0.6 Promille
elseif drunk <= 350000 and drunk > 300000 then wert = 0.35 --0.7 Promille
elseif drunk <= 400000 and drunk > 350000 then wert = 0.40 --0.8 Promille
elseif drunk <= 450000 and drunk > 400000 then wert = 0.45 --0.9 Promille
elseif drunk <= 500000 and drunk > 450000 then wert = 0.50 --1.0 Promille
elseif drunk <= 550000 and drunk > 500000 then wert = 0.55 --1.1 Promille
elseif drunk <= 600000 and drunk > 550000 then wert = 0.60 --1.2 Promille
elseif drunk <= 650000 and drunk > 600000 then wert = 0.65 --1.3 Promille
elseif drunk <= 700000 and drunk > 650000 then wert = 0.70 --1.4 Promille
elseif drunk <= 750000 and drunk > 700000 then wert = 0.75 --1.5 Promille
elseif drunk <= 800000 and drunk > 750000 then wert = 0.80 --1.6 Promille
elseif drunk <= 850000 and drunk > 800000 then wert = 0.85 --1.7 Promille
elseif drunk <= 900000 and drunk > 850000 then wert = 0.85 --1.8 Promille
elseif drunk <= 950000 and drunk > 900000 then wert = 0.90 --1.9 Promille
elseif drunk > 900000 then wert = 1.00 --2.00 Promille

end

Wait(4000)

	SendNUIMessage({
		action = "open",
	})				
	SendNUIMessage({
		result = wert
	})
	SendNUIMessage({
		mgprol = "mg/l" 
	 })					
	
local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	if closestDistance ~= -1 and closestDistance <= 3.0 then		
		TriggerServerEvent('breathanalyzer:showResult', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), wert)
	end
		Wait(7500)
			local ergebnis = 0.00

			SendNUIMessage({
				action = "close",
			})
				local playerPed = GetPlayerPed(-1)
	
TriggerEvent('breathanalyzer:toggledevice')
                
end)



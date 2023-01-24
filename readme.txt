------------------------
REQUIREMENTS:

esx_optionalneeds
esx_status
------------------------
REQUIREMENTS for SOUND:

InteractSound_SV

put the file "alkotester.ogg" into direction: resources\InteractSound_SV\client\html\sounds and add it to the fxmanifest.lua


------------------------

##########################################################################################################################
For integration to esx_policejob for example, just add a F5 or F6 Menu Button and insert following in the menu



elseif action == 'alkotest' then   --this line must be written to esx_policejob

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
##########################################################################################################################			


This script was made with love by ErwinAT#2917 <3 

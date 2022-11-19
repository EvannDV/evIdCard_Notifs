ESX = nil

local PlayerData = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)  
	PlayerData.job = job  
	Citizen.Wait(5000) 
end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
    end
    if ESX.IsPlayerLoaded() then

		ESX.PlayerData = ESX.GetPlayerData()

    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
    ESX.PlayerData.job2 = job2
end)


RegisterCommand("ShowMyIdCard", function(source, args, rawcommand)
  local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
  if closestPlayer ~= -1 and closestDistance <= 3.0 then
    TriggerServerEvent('show', GetPlayerServerId(closestPlayer))
  else
    ESX.ShowNotification("[~r~Problème~s~] Aucun joueur à proximité")
  end 
end, false)

RegisterCommand("SeeMyIdCard", function(source, args, rawcommand)
  TriggerServerEvent("idCardMe")
end, false)


RegisterCommand("evId", function(source, args, rawcommand)
  IdCardMe()
end, false)


function IdCardMe()



  local evIdCard = RageUI.CreateMenu("Id","Que veux tu faire ?")

  RageUI.Visible(evIdCard, not RageUI.Visible(evIdCard))

  while evIdCard do
      
      Citizen.Wait(0)

      RageUI.IsVisible(evIdCard,true,true,true,function()
      
          


          RageUI.ButtonWithStyle("Regarde sa carte d'id", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
              if Selected then
                TriggerServerEvent("idCardMe")
                RageUI.CloseAll()    
              end
          end)

          RageUI.ButtonWithStyle("Montrer sa carte d'id", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
            if Selected then
              local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
              if closestPlayer ~= -1 and closestDistance <= 3.0 then
                TriggerServerEvent('show', GetPlayerServerId(closestPlayer))
              else
                RageUI.Popup({message = "[~r~Problème~s~] Aucun joueur à proximité"})
              end 
              RageUI.CloseAll()    
            end
        end)






      

      end, function()
      end)

      if not RageUI.Visible(evIdCard) then
          evIdCard=RMenu:DeleteType("evIdCard", true)
      end

  end

end






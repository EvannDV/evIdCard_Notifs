ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)




RegisterServerEvent("idCardMe")
AddEventHandler("idCardMe", function()
    local source = source
    local playerD = GetPlayerName(source)

	MySQL.Async.fetchAll('SELECT * FROM users WHERE name=@a', {['@a'] = playerD}, function(data)
        print("ok")
        FirstName = data[1].firstname
        LastName = data[1].lastname
        Birth = data[1].dateofbirth
        Sex = data[1].sex
        Taille = data[1].height
		TriggerClientEvent('esx:showNotification', source, "Nom : ~y~"..FirstName.."~s~ Prénom : ~y~"..LastName.."~s~ Naissance : ~y~"..Birth.."~s~ Sexe : ~y~"..Sex.."~s~ Taille : ~y~"..Taille.."~s~")
	end)

end)


RegisterServerEvent('show')
AddEventHandler('show', function(target)


  local source = source
  local PlayerE = ESX.GetPlayerFromId(source)
  local TargetE = ESX.GetPlayerFromId(target)
  local playerD = GetPlayerName(source)

	MySQL.Async.fetchAll('SELECT * FROM users WHERE name=@a', {['@a'] = playerD}, function(data)
        print("ok2")
        FirstName = data[1].firstname
        LastName = data[1].lastname
        Birth = data[1].dateofbirth
        Sex = data[1].sex
        Taille = data[1].height
		TriggerClientEvent('esx:showNotification', target, "Nom : ~y~"..FirstName.."~s~ Prénom : ~y~"..LastName.."~s~ Naissance : ~y~"..Birth.."~s~ Sexe : ~y~"..Sex.."~s~ Taille : ~y~"..Taille.."~s~")
	end)

  
  		TriggerClientEvent('esx:showNotification', PlayerE.source, "Vous venez de monter votre carte d'id")
end)
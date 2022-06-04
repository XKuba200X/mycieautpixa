ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterUsableItem('washkit', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('washkit', 1)
    TriggerClientEvent('kuba200:washcar', source)
end)

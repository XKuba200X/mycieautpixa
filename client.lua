ESX                = nil

TriggerEvent('scrap:getSharedObject', function(obj) ESX = obj end)

------------------ Anti D**PER nie dotykać ----------------------------------------------------------
-----------------------------------------------------------------------------------------------------
RegisterNetEvent("loadRes-tgiann-antiDump")
AddEventHandler("loadRes-tgiann-antiDump", function(data)
    print(data)
end)
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------

ESX.RegisterUsableItem('washkit', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('washkit', 1)
    TriggerClientEvent('kuba200:washcar', source)
end)
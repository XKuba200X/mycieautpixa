ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(900)
    end
end)


RegisterNetEvent('kuba200:washcar')
AddEventHandler('kuba200:washcar', function(source)
    local playerPed = PlayerPedId()
    local vehicle   = ESX.Game.GetVehicleInDirection()
    local coords    = GetEntityCoords(playerPed)

    if IsPedSittingInAnyVehicle(playerPed) then
        exports['pnpNotify']:Alert("Informacja", "Musisz wyjść z pojazdu", 5000, 'info')
        return
    end

    if DoesEntityExist(vehicle) then
        ExecuteCommand('me Myje samochód.')
        isBusy = true
        TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_MAID_CLEAN', 0, true)
        Citizen.CreateThread(function()
            Citizen.Wait(10000)

            SetVehicleDirtLevel(vehicle, 0)
            ClearPedTasksImmediately(playerPed)
            exports['pnpNotify']:Alert("Informacja", "Umyłeś pojazd własnoręcznie", 5000, 'info')
            isBusy = false
        end)
    else
        exports['pnpNotify']:Alert("Informacja", "Brak pojazdów w pobliżu", 5000, 'info')
    end
end)

RegisterCommand('umyjpojazdtest', function ()
     TriggerEvent('kuba200:washcar')
end)

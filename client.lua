local QBCore = exports['qb-core']:GetCoreObject()
--[[
GET_VEHICLE_WINDOW_TINT
0x0EE21293DAD47C95
0x13D53892
// GetVehicleWindowTint
int GET_VEHICLE_WINDOW_TINT(Vehicle vehicle);
]]

--4 = Stock - Legal
--5 = Limo - Legal
--3 = Light Smoke - Illegal
--2 = Dark Smoke - Illegal
--1 = Pure Black - Illegal
--6 = Green - Legal


AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    local player = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function()
    local player = QBCore.Functions.GetPlayerData()
end)    

RegisterCommand('tint', function(source, args)
    TriggerEvent('CheckTint')
end, false)

RegisterNetEvent('CheckTint')
AddEventHandler('CheckTint', function()
    local player = QBCore.Functions.GetPlayerData()
    local distanceToCheck = 5.0
    local ped = PlayerPedId()
    if player.job.name == "police" and player.job.onduty then

    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
        local playerPos = GetEntityCoords( ped, 1 )
        local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( ped, 0.0, distanceToCheck, 0.0 )
        local vehicle = GetVehicleInDirection( playerPos, inFrontOfPlayer )
            if ( DoesEntityExist( vehicle ) ) then 
              SetEntityAsMissionEntity( vehicle, true, true )
               if GetVehicleWindowTint( vehicle ) == 6 then
                   QBCore.Functions.Notify('The tint is Legal!', 'success')
                elseif GetVehicleWindowTint( vehicle ) == 5 then
                   QBCore.Functions.Notify('The tint is Legal!', 'success')
                elseif GetVehicleWindowTint( vehicle ) == 4 then
                   QBCore.Functions.Notify('The tint is Legal!', 'success')
                elseif GetVehicleWindowTint( vehicle ) == 3 then
                   QBCore.Functions.Notify('The tint is Legal!', 'success')
                elseif GetVehicleWindowTint( vehicle ) == 2 then
                   QBCore.Functions.Notify('The tint is not legal!', 'error')
                elseif GetVehicleWindowTint( vehicle ) == 1 then
                   QBCore.Functions.Notify('The tint is not legal!', 'error')
                elseif GetVehicleWindowTint( vehicle ) == 0 then
                   QBCore.Functions.Notify('The tint is Legal!', 'success')
                elseif GetVehicleWindowTint( vehicle ) == -1 then
                   QBCore.Functions.Notify('The tint is Legal!', 'success')
              end
            else
             QBCore.Functions.Notify('You must be near and facing a vehicle for this to work', 'error')  
           end
       end
   else
    QBCore.Functions.Notify('You must be on duty LEO to do this!', 'error')
   end
end)

function GetVehicleInDirection( coordFrom, coordTo )
    local rayHandle = CastRayPointToPoint( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed( -1 ), 0 )
    local _, _, _, _, vehicle = GetRaycastResult( rayHandle )
    return vehicle
end

function ShowInfo(text)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandThefeedPostTicker(false, false)
end
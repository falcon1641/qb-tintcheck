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

RegisterCommand('tint', function(source, args)
    TriggerEvent('CheckTint')
end, false)

RegisterNetEvent('CheckTint')
AddEventHandler('CheckTint', function()
    local distanceToCheck = 5.0
    local ped = PlayerPedId()

    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
        local playerPos = GetEntityCoords( ped, 1 )
        local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( ped, 0.0, distanceToCheck, 0.0 )
        local vehicle = GetVehicleInDirection( playerPos, inFrontOfPlayer )

        if ( DoesEntityExist( vehicle ) ) then 
            SetEntityAsMissionEntity( vehicle, true, true )
            if GetVehicleWindowTint( vehicle ) == 6 then
                ShowInfo("Legal Tint")
            elseif GetVehicleWindowTint( vehicle ) == 5 then
                ShowInfo("Legal Tint")
            elseif GetVehicleWindowTint( vehicle ) == 4 then
                ShowInfo("Legal Tint")
            elseif GetVehicleWindowTint( vehicle ) == 3 then
                ShowInfo("Illegal Tint")
            elseif GetVehicleWindowTint( vehicle ) == 2 then
                ShowInfo("Illegal Tint")
            elseif GetVehicleWindowTint( vehicle ) == 1 then
                ShowInfo("Illegal Tint")
            elseif GetVehicleWindowTint( vehicle ) == 0 then
                ShowInfo("Legal Tint")
            elseif GetVehicleWindowTint( vehicle ) == -1 then
                ShowInfo("Legal Tint")
            end
        end
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
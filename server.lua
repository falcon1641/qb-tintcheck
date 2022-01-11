local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("tintchecker", function(source)
    local _src = source
    TriggerClientEvent("CheckTint", _src)
end)

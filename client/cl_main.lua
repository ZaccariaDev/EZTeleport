ESX = exports["es_extended"]:getSharedObject()

local teleports = {}
local locale
local config

RegisterNetEvent('EZTeleport:receiveTeleports')
AddEventHandler('EZTeleport:receiveTeleports', function(tpData, lang, cfg)
    teleports = tpData
    locale = lang
    config = cfg
end)

RegisterNetEvent('EZTeleport:teleportPlayer')
AddEventHandler('EZTeleport:teleportPlayer', function(coords, message)
    local playerPed = PlayerPedId()
    
    DoScreenFadeOut(1000)
    Citizen.Wait(1000)
    SetEntityCoords(playerPed, coords.x, coords.y, coords.z, false, false, false, true)
    DoScreenFadeIn(1000)
    if message ~= nil then
        ESX.ShowNotification(message)
    end
end)

Citizen.CreateThread(function()
    TriggerServerEvent('EZTeleport:requestTeleports')
    while true do
        Citizen.Wait(0)
        if locale and config then
            for _, teleport in pairs(teleports) do
                local playerPed = PlayerPedId()
                local playerCoords = GetEntityCoords(playerPed)
                local tpCoords = vector3(teleport.tpPos.x, teleport.tpPos.y, teleport.tpPos.z)
                local distance = #(playerCoords - tpCoords)
                
                if distance < config.distance then
                    DrawMarker(teleport.tpMarker, teleport.tpPos.x, teleport.tpPos.y, teleport.tpPos.z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, config.scale, config.scale, config.scale, teleport.tpColor.r, teleport.tpColor.g, teleport.tpColor.b, config.opacity, false, true, 2, false, nil, nil, false)
                    if distance < 1.5 then
                        if tostring(teleport.textOnMarker) ~= "Error: Text not defined" then
                            DrawText3D(teleport.tpPos.x, teleport.tpPos.y, teleport.tpPos.z, teleport.textOnMarker)
                        end
                        if IsControlJustReleased(0, 38) then -- E key
                            TriggerServerEvent('EZTeleport:attemptTeleport', teleport.name)
                        end
                    end
                end
            end
        end
    end
end)

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
end

ESX = exports["es_extended"]:getSharedObject()
DoScreenFadeIn(100)
Citizen.CreateThread(function()
    while true do
        Wait(0)
        local playerPed = PlayerPedId()
        local playerPos = GetEntityCoords(playerPed)
        local playerJob = ESX.GetPlayerData().job  -- Adaptez cette ligne selon votre système de jobs

        for _, tp in pairs(Config.Teleports) do
            -- Gérer le marqueur de départ
            handleTeleportPoint(tp, playerPos, playerPed, playerJob)

            -- Si le teleport est bidirectionnel, gérer aussi le point de destination comme un point de départ
            if tp.biDirectional then
                local reverseTp = {
                    tpPos = tp.Destination,
                    Destination = tp.tpPos,
                    tpMarker = tp.tpMarker,
                    tpColor = tp.tpColor,
                    textOnMarker = tp.textOnDestination or "Retour",
                    requiredItem = tp.requiredItem,
                    requiredJob = tp.requiredJob,
                    requiredGrade = tp.requiredGrade
                }
                handleTeleportPoint(reverseTp, playerPos, playerPed, playerJob)
            end
        end
    end
end)

function handleTeleportPoint(tp, playerPos, playerPed, playerJob)
    local dist = #(playerPos - vector3(tp.tpPos.x, tp.tpPos.y, tp.tpPos.z))
    if dist < Config.Defaults.distance then
        DrawMarker(tp.tpMarker or Config.Defaults.MarkerType, tp.tpPos.x, tp.tpPos.y, tp.tpPos.z - 1.0, 0, 0, 0, 0, 0, 0, Config.Defaults.scale, Config.Defaults.scale, Config.Defaults.scale, tp.tpColor.r, tp.tpColor.g, tp.tpColor.b, Config.Defaults.Opacity, false, true, 2, nil, nil, false)
        if tp.textOnMarker then
            DrawText3D(tp.tpPos.x, tp.tpPos.y, tp.tpPos.z + 1.5, tp.textOnMarker)
        end

        if dist < 1.5 and IsControlJustReleased(0, 51) then  -- vérifier si E est pressée
            -- Vérifie si les conditions de job et de grade sont remplies
            if not tp.requiredJob or (playerJob.name == tp.requiredJob and (not tp.requiredGrade or playerJob.grade >= tp.requiredGrade)) then
                -- Si un item est requis, vérifie la possession de cet item
                if tp.requiredItem then
                    HasItem(tp.requiredItem, function(hasItem)
                        if hasItem then
                            DoTeleport(playerPed, tp.Destination, tp.textOnMarker)
                        else
                            -- Ajouter ici la notification pour l'item manquant à la prochaine maj
                        end
                    end)
                else
                    DoTeleport(playerPed, tp.Destination, tp.textOnMarker)
                end
            else
                -- Ajouter ici la notification pour les conditions de job non remplies à la prochaine maj
            end
        end
    end
end

function DoTeleport(ped, destination, from)
    local fadeDuration = 1000  -- Durée du fondu en millisecondes
    DoScreenFadeOut(fadeDuration)
    while not IsScreenFadedOut() do
        Wait(0)
    end
    SetEntityCoords(ped, destination.x, destination.y, destination.z, false, false, false, true)
    Wait(500)  -- Ce délai peut être ajusté selon l'effet désiré, en dessous de 500 ms, on voit la fin de la téléportation se faire
    DoScreenFadeIn(fadeDuration)
    while not IsScreenFadedIn() do
        Wait(0)
    end
    if Config.LogsActive then
        print(from)
        TriggerServerEvent('logTeleport', GetPlayerName(PlayerId()), from)
    end
end

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

function DisplayHelpText(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function HasItem(itemName, callback)
    if Config.Framework == 'esx' then
        -- Utilisation de ESX pour vérifier si l'item est dans l'inventaire du joueur
        local inventory = ESX.GetPlayerData().inventory
        local item = GetItemFromInventory(inventory, itemName)
        callback(item and item.count > 0)

    elseif Config.Framework == 'ox' then
        -- Utilisation de OX pour vérifier si l'item est dans l'inventaire du joueur
        local count = exports.ox_inventory:Search('count', itemName)
        callback(count and count > 0)

    else
        print("Framework non configuré ou inconnu dans Config.lua")
        callback(false)
    end
end

-- Fonction utilitaire pour chercher un item dans l'inventaire ESX
function GetItemFromInventory(inventory, itemName)
    for _, item in pairs(inventory) do
        if item.name == itemName then
            return item
        end
    end
    return nil
end
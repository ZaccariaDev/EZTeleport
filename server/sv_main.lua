ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('EZTeleport:requestTeleports')
AddEventHandler('EZTeleport:requestTeleports', function()
    local _source = source
    local locale = Config.Locale
    local tpData = {}
    local configData = {
        distance = Config.Defaults.distance,
        scale = Config.Defaults.scale,
        opacity = Config.Defaults.Opacity
    }

    for _, tp in pairs(Config.Teleports) do
        if not tp.nom or not tp.tpPos or not tp.Destination then
            print((Config.Locales[locale]['error_missing_fields']):format(tp.nom or "Unknown"))
        else
            local tpNom = tp.nom
            
            -- Ajouter le point de départ
            table.insert(tpData, {
                name = tpNom,
                tpPos = tp.tpPos,
                textOnMarker = Config.Locales[locale]['teleport_' .. tpNom .. '_marker'] or "Error: Text not defined",
                tpMarker = tp.tpMarker or Config.Defaults.MarkerType,
                tpColor = tp.tpColor or Config.Defaults.MarkerColor,
                destination = tp.Destination
            })

            -- Ajouter le point de destination si bi-directionnel
            if tp.biDirectional then
                table.insert(tpData, {
                    name = tpNom .. "_return",
                    tpPos = tp.Destination,
                    textOnMarker = Config.Locales[locale]['teleport_' .. tpNom .. '_destination'] or "Error: Text not defined",
                    tpMarker = tp.tpMarker or Config.Defaults.MarkerType,
                    tpColor = tp.tpColor or Config.Defaults.MarkerColor,
                    destination = tp.tpPos
                })
            end
        end
    end

    TriggerClientEvent('EZTeleport:receiveTeleports', _source, tpData, locale, configData)
end)

RegisterServerEvent('EZTeleport:attemptTeleport')
AddEventHandler('EZTeleport:attemptTeleport', function(teleportName)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local locale = Config.Locale
    local teleport = nil
    local isReturn = false

    for _, tp in pairs(Config.Teleports) do
        if tp.nom == teleportName then
            teleport = tp
            break
        elseif tp.nom .. "_return" == teleportName then
            teleport = tp
            isReturn = true
            break
        end
    end

    if teleport then
        local hasAccess = true
        if teleport.requiredJob and xPlayer.job.name ~= teleport.requiredJob then
            hasAccess = false
        end
        if teleport.requiredItem then
            local item = xPlayer.getInventoryItem(teleport.requiredItem)
            if not item or item.count <= 0 then
                hasAccess = false
            end
        end

        local destination = isReturn and teleport.tpPos or teleport.Destination

        if hasAccess then
            local message = isReturn and Config.Locales[locale]['teleport_' .. teleport.nom .. '_return_message'] or Config.Locales[locale]['teleport_' .. teleport.nom .. '_message']
            local destinationName = isReturn and Config.Locales[locale]['teleport_' .. teleport.nom .. '_marker'] or Config.Locales[locale]['teleport_' .. teleport.nom .. '_destination']
            TriggerClientEvent('EZTeleport:teleportPlayer', _source, destination, message)
            if Config.LogsActive then
                sendToDiscord(Config.Locales[locale]['discord_log_title'], string.format(Config.Locales[locale]['discord_log_message'], GetPlayerName(_source), destinationName), Config.EmbedColor)
            end
            TriggerClientEvent('esx:showNotification', _source, Config.Locales[locale]['teleport_success'])
        else
            TriggerClientEvent('esx:showNotification', _source, Config.Locales[locale]['no_access'])
        end
    else
        print((Config.Locales[locale]['error_teleport_not_found']):format(teleportName))
    end
end)

function sendToDiscord(name, message, color)
    local connect = {
        {
            ["color"] = color,
            ["title"] = "**" .. name .. "**",
            ["description"] = message,
            ["footer"] = {
                ["text"] = Config.Locales[Config.Locale]['discord_log_footer'],
            },
        }
    }
    PerformHttpRequest(Config.DiscordWebhook, function(err, text, headers) end, 'POST', json.encode({username = "EZTeleport", embeds = connect, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
end

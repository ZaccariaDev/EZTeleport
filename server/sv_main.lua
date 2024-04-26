RegisterServerEvent('logTeleport')
AddEventHandler('logTeleport', function(playerName, from, to)
    if Config.LogsActive then
        PerformHttpRequest(Config.DiscordWebhook, function(err, text, headers) end, 'POST', json.encode({
            username = "Server Logs",
            embeds = {{
                title = "Téléportation Effectuée",
                description = playerName .. " s'est téléporté.",
                fields = {
                    { name = "Depuis", value = from, inline = true }
                },
                color = Config.EmbedColor
            }},
            avatar_url = "https://cdn.discordapp.com/attachments/1230216137120415855/1233352222826434724/logo_EZTeleports.png"
        }), { ['Content-Type'] = 'application/json' })
    end
end)
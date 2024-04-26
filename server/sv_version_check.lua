local versionUrl = 'https://raw.githubusercontent.com/ZaccariaDev/EZTeleport/main/VERSION'

CreateThread(function()
    Wait(5000) 
    local currentVersion = Config.Version
    local versionCheck = PerformHttpRequest(versionUrl, function(err, response, headers)
        if currentVersion ~= response then
            print('^1[EZTeleports] Une nouvelle version est disponible: ' .. response .. '. Vous utilisez la version ' .. currentVersion .. '.^7')
        end
    end, 'GET')
end)
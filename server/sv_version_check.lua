local versionUrl = "https://raw.githubusercontent.com/ZaccariaDev/EZTeleport/main/VERSION"

local function checkVersion()
    local currentVersion = Config.Version
    print('^3[EZTeleports] Vérification de la version...^7')
    PerformHttpRequest(versionUrl, function(err, response, headers)
        if response then
            local onlineVersion = response:gsub("%s+", "") -- Suppression des espaces et des retours à la ligne
            if currentVersion ~= onlineVersion then
                print('^1[EZTeleports] Une nouvelle version est disponible: ' .. onlineVersion .. '. Vous utilisez la version ' .. currentVersion .. '.^7')
            else
                print('^2[EZTeleports] Vous utilisez la dernière version: ' .. currentVersion .. '.^7')
            end
        else
            print('^1[EZTeleports] Erreur lors de la vérification de la version.^7')
        end
    end, 'GET')
end

-- Vérification de la version au démarrage du mod
AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        checkVersion()
    end
end)

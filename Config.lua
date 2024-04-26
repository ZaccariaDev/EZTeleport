Config = {}

Config.LogsActive = true
Config.DiscordWebhook = "https://discord.com/api/webhooks/XXXXXXXXXXXXXXXXXXXXX/XXXXXXXXXXXXXXXXXXXXX" --https://support.discord.com/hc/fr/articles/228383668-Introduction-aux-Webhooks
Config.EmbedColor = 15258703 -- Couleur de l'embed en décimal https://www.mathsisfun.com/hexadecimal-decimal-colors.html

Config.Framework = 'esx'  -- Changez cette valeur en 'ox' ou 'esx' selon ce que vous utilisez

-- Paramètres par défaut pour les marqueurs de téléportation
Config.Defaults = {
    MarkerType = 1,
    MarkerColor = { r = 255, g = 255, b = 255 },
    Opacity = 255,
    distance = 10.0,  -- Distance à laquelle le marqueur devient visible
    scale = 1.5,      -- Échelle du marqueur
}


-- Liste des points de téléportation
Config.Teleports = {
    {
        --exemple 1
        nom = "hopital", --un nom, juste pour savoir de quoi ça parle [Pas obligatoire]
        textOnMarker = "aller à l'hopital", --texte qui sera affiché sur le marqueur de téléportation [Pas obligatoire]
        requiredItem = "jumelles",   -- Nom de l'item requis pour utiliser ce point de téléportation [nom de l'objet ou false]
        requiredJob = "postier", -- ici on met le nom du métier pour réstreindre le droit de téléportation [Pas obligatoire]
        requiredGrade = 0, -- Si vous souhaitez restreindre le tp à un grade précis, si ce param est inclus alors requiredJob est obligatoire [Pas obligatoire]
        tpPos = {x = -75.345, y = -818.452, z = 326.176},  -- Position du point de téléportation (position de départ) cet exemple est composé de coords aléatoires [Obligatoire]
        Destination = {x = -70.345, y = -821.452, z = 326.176},  -- Position de destination après la téléportation [Obligatoire]
        tpMarker = 27,  -- Type de marqueur à afficher (27 est un marqueur d'halo circulaire par défaut, les autres marqueurs sont dispos ici https://docs.fivem.net/docs/game-references/markers/) [Pas obligatoire]
        tpColor = {r = 0, g = 255, b = 255},  -- Couleur du marqueur en RGB [Pas obligatoire]
        biDirectional = true, --si biDirectionnel, la destination permet de faire repartir le joueur à la tpPos [Pas obligatoire]
        textOnDestination = "sortir de l'hopital" ----texte qui sera affiché sur le marqueur de téléportation [Pas obligatoire, ignoré si biDirectional = false]
    },
    {
        --exemple 2
        requiredItem = "pass_admin",   
        tpPos = {x = 425.130, y = -979.558, z = 30.710},
        Destination = {x = 425.130, y = -983.558, z = 30.710},
        tpMarker = 27,
        tpColor = {r = 255, g = 0, b = 0}
    }
    -- Ajoutez plus de points selon le même modèle
}


-----NE PAS MODIFIER-----
Config.Version = '1.0.0'
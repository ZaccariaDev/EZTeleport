fx_version 'cerulean'
game 'gta5'

author 'TheGameBoy_95 - Assistance https://discord.gg/jUS8cjsH68'
description 'EZTeleports - Permet aux administrateurs de créer des points de téléportation personnalisés sur leur serveur. Facile à configurer et à utiliser. | EZTeleports - Allows administrators to create custom teleportation points on their server. Easy to set up and use.'
version '1.1.0'

client_scripts {
    'client/cl_main.lua',
}

server_scripts {
    'lang/locales.lua',
    'server/Config.lua',
    'server/sv_main.lua',
    'server/sv_version_check.lua'
}

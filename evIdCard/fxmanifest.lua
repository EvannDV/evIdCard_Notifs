fx_version 'adamant'

game 'gta5'



-- RageUI V2

client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua"
}

client_scripts {
    "cl_main.lua",
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server.lua',
}


ui_page 'nui/nui.html'

files {
    'nui/nui.html',
    'nui/style.css',
    'nui/script.js',
    'nui/images/*',
}
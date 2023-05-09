fx_version 'adamant'

game 'gta5'
name 'ruxo_menu'
version '1.0'
description 'Ruxo menu Beta'


shared_scripts{
    "@es_extended/imports.lua"
} 

client_scripts {
    'config/vehicles.lua',
    'client/client.lua',
} 

server_scripts {
    '@mysql-async/lib/MySQL.lua',	
    'server/server.lua',

} 

dependencies {
	'es_extended'
}


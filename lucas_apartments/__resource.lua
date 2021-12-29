fx_version 'adamant'

game 'gta5'

author 'LucasL.#1024'
version '1.0'

client_scripts {
	"client/apart_client.lua",
	"client/GUI.lua"
}

server_scripts {
	"@mysql-async/lib/MySQL.lua",
	"server/apart_server.lua",
}
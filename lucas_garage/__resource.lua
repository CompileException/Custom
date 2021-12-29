server_scripts {
  '@async/async.lua',
  '@mysql-async/lib/MySQL.lua',
  'server/main.lua',
  'config.lua'
}

client_scripts {
  'client/main.lua',
  'config.lua'
}

dependency 'es_extended'

ui_page('html/ui.html')

files {
	'html/ui.html',
	'html/ui.js',
	'html/*.png',
	'html/flecca.png',
	'html/car.png',
}
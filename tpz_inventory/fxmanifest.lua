fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'Nosmakos'
description 'TPZ-CORE - Inventory'
version '1.0.1'

ui_page 'html/index.html'

shared_scripts { 'config.lua', 'locales.lua', 'item_registrations.lua', 'weapon_registrations.lua' }
client_scripts { '@tpz_core/client/modules/dataview/client.lua', 'client/*.lua' }
server_scripts { 'server/*.lua' }

files { 'html/**/*' }

dependency { 'tpz_core' }


lua54 'yes'

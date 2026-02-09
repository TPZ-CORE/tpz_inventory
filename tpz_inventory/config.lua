Config = {}

Config.DevMode = false
Config.Debug   = false
    
Config.ActionKeys = {
    OpenInventory = 0xC1989F95 -- Default is (I) key.
}

Config.PromptKeys     = {
    ['PICKUP_DROPPABLES'] = { key = 0xF84FA74F, label = "Pickup", action = "droppables" }
}

---------------------------------------------------------------
--[[ General Settings ]]--
---------------------------------------------------------------

-- Set to true if you are using tpz_admin.
Config.tpz_admin = true

-- Set to true if you want to use a database table for handling all items instead of configuration.
-- The database table is `items`.
Config.UseDatabaseItems  = false

Config.DisplayMoney      = true
Config.DisplayBlackMoney = false
Config.DisplayGold       = true

Config.InventoryDefaultWeight = 40 -- Default is 40KG to carry on the player's inventory.
Config.InventoryWeightLabel   = "KG"

-- What would be the distance to check for near players to trade?
Config.NearPlayersTradeDistance = 2.5

-- Prevent players opening the inventory while being dead / unconcious?
Config.DisableDeathInventory   = true

Config.Droppables = {
    
    DropCooldown   = 4, -- How often can a player drop items, weapons or money? this prevents netbug dups by adding cooldown.
    RemoveAfter    = 30, -- Remove a dropped item after x minutes (30 minutes as default).

    RenderDistance = 25, -- The render distance to spawn a dropped object when being close to the object coords. 
    ActionDistance = 1.5, -- The action distance between the player and a dropped object to display the pickup prompt.
    
    Types = {
        ['money']      = "p_moneybag02x",
        ['blackmoney'] = "p_moneybag02x",
        ['gold']       = "s_pickup_goldbar01x",
        ['item']       = 'p_cottonbox01x',
        ['weapon']     = 'p_cottonbox01x',
    },

}

-- The time is in minutes, every x minutes, all the items in the player inventory which are eatables (food), will be losing durability to become spoiled.
Config.Eatables = {
    Enabled = true,

    -- Set to false if you dont want the food to expire while placed on storage containers.
    RemoveDurabilityOnContainers = true,

    -- If @RemoveDurabilityOnContainers is true, below you can allowlist specific containers by their id
    -- for preventing durability removal (for example saloon storages).
    AllowlistedContainers = {
        [0] = true,
    },

    -- how often should the system save the containers (storages) that are removing durability from food every x minutes?
    -- this skips the @AllowlistedContainers container storages or the ones that are allowlisted through API.
    -- (!) THIS DOESNT MEAN THE CONTAINERS ARE NOT SAVED, THEY ARE SAVED ON USE, BUT WHEN NOT BEING OPENED, WE HAVE TO SAVE THEM IF THEY REMOVE DURABILITY
    -- FROM THE ITEMS AND THOSE STORAGES HAVENT BEEN OPENED.
    SaveContainerUpdatesEvery = 10, -- time in minutes
	
	-- @removeTime : he time in minutes, every 3 minutes by default we removing (X%) durability (3 minutes = 5 hours for an item to be removed when removeValue equals to 1) 
    Items = {
        ['consumable_bread']             = { removeValue = { 0, 1 }, newItem = false, removeTime = 3 },
        ['consumable_banana']            = { removeValue = { 0, 1 }, newItem = false, removeTime = 3 },
        ['consumable_avocado']           = { removeValue = { 0, 1 }, newItem = false, removeTime = 3 },
        ['consumable_olives']            = { removeValue = { 0, 1 }, newItem = false, removeTime = 3 },
        ['consumable_orange']            = { removeValue = { 0, 1 }, newItem = false, removeTime = 3 },
        ['consumable_peach']             = { removeValue = { 0, 1 }, newItem = false, removeTime = 3 },
        ['consumable_pear']              = { removeValue = { 0, 1 }, newItem = false, removeTime = 3 },
        ['consumable_strawberry']        = { removeValue = { 0, 1 }, newItem = false, removeTime = 3 },
        ['consumable_melon']             = { removeValue = { 0, 1 }, newItem = false, removeTime = 3 },
        ['consumable_grapes']            = { removeValue = { 0, 1 }, newItem = false, removeTime = 3 },
        ['consumable_tomato']            = { removeValue = { 0, 1 }, newItem = false, removeTime = 3 },


        ['fish_meat']                    = { removeValue = { 2, 3 }, newItem = false },

        ['meat']                         = { removeValue = { 3, 3 }, newItem = "spoiled_meat", removeTime = 3 },
        ['bison_meat']                   = { removeValue = { 3, 3 }, newItem = "spoiled_bison_meat", removeTime = 3 },
        ['biggame']                      = { removeValue = { 3, 3 }, newItem = "spoiled_biggame_meat", removeTime = 3 },
        ['birdmeat']                     = { removeValue = { 3, 3 }, newItem = false, removeTime = 3 },

        ['consumable_meat_cooked']       = { removeValue = { 2, 3 }, newItem = "spoiled_meat", removeTime = 3 },
        ['consumable_bison_cooked']      = { removeValue = { 2, 3 }, newItem = "spoiled_bison_meat", removeTime = 3 },
        ['consumable_biggame_cooked']    = { removeValue = { 2, 3 }, newItem = "spoiled_biggame_meat", removeTime = 3 },

        -- FISH MODELS (TPZ FISHING)

        ['a_c_fishbluegil_01_ms']        = { removeValue = { 2, 3 }, newItem = false, removeTime = 3 },
        ['a_c_fishbluegil_01_sm']        = { removeValue = { 2, 3 }, newItem = false, removeTime = 3 },
        ['a_c_fishbullheadcat_01_ms']    = { removeValue = { 2, 3 }, newItem = false, removeTime = 3 },
        ['a_c_fishbullheadcat_01_sm']    = { removeValue = { 2, 3 }, newItem = false, removeTime = 3 },
        ['a_c_fishchainpickerel_01_ms']  = { removeValue = { 2, 3 }, newItem = false, removeTime = 3 },
        ['a_c_fishchainpickerel_01_sm']  = { removeValue = { 2, 3 }, newItem = false, removeTime = 3 },
        ['a_c_fishchannelcatfish_01_lg'] = { removeValue = { 2, 3 }, newItem = false, removeTime = 3 },
        ['a_c_fishchannelcatfish_01_xl'] = { removeValue = { 2, 3 }, newItem = false, removeTime = 3 },
        ['a_c_fishlakesturgeon_01_lg']   = { removeValue = { 2, 3 }, newItem = false, removeTime = 3 },
        ['a_c_fishlargemouthbass_01_lg'] = { removeValue = { 2, 3 }, newItem = false, removeTime = 3 },
        ['a_c_fishlargemouthbass_01_ms'] = { removeValue = { 2, 3 }, newItem = false, removeTime = 3 },
        ['a_c_fishlongnosegar_01_lg']    = { removeValue = { 2, 3 }, newItem = false, removeTime = 3 },
        ['a_c_fishmuskie_01_lg']         = { removeValue = { 2, 3 }, newItem = false, removeTime = 3 },
        ['a_c_fishnorthernpike_01_lg']   = { removeValue = { 2, 3 }, newItem = false, removeTime = 3 },
        ['a_c_fishperch_01_ms']          = { removeValue = { 2, 3 }, newItem = false, removeTime = 3 },
        ['a_c_fishperch_01_sm']          = { removeValue = { 2, 3 }, newItem = false, removeTime = 3 },
        ['a_c_fishrainbowtrout_01_lg']   = { removeValue = { 2, 3 }, newItem = false, removeTime = 3 },
        ['a_c_fishrainbowtrout_01_ms']   = { removeValue = { 2, 3 }, newItem = false, removeTime = 3 },
        ['a_c_fishredfinpickerel_01_ms'] = { removeValue = { 2, 3 }, newItem = false, removeTime = 3 },
        ['a_c_fishredfinpickerel_01_sm'] = { removeValue = { 2, 3 }, newItem = false, removeTime = 3 },
        ['a_c_fishrockbass_01_ms']       = { removeValue = { 2, 3 }, newItem = false, removeTime = 3 },
        ['a_c_fishrockbass_01_sm']       = { removeValue = { 2, 3 }, newItem = false, removeTime = 3 },
        ['a_c_fishsalmonsockeye_01_lg']  = { removeValue = { 2, 3 }, newItem = false, removeTime = 3 },
        ['a_c_fishsalmonsockeye_01_ml']  = { removeValue = { 2, 3 }, newItem = false, removeTime = 3 },
        ['a_c_fishsalmonsockeye_01_ms']  = { removeValue = { 2, 3 }, newItem = false, removeTime = 3 },
        ['a_c_fishsmallmouthbass_01_lg'] = { removeValue = { 2, 3 }, newItem = false, removeTime = 3 },
        ['a_c_fishsmallmouthbass_01_ms'] = { removeValue = { 2, 3 }, newItem = false, removeTime = 3 },

    },
}

-- The specified option is to hide the durability progress from items that are are separated 
-- due to their metadata and their durability will not be decreased for any reason.
-- (for example, warehouses keys contain metadata but will never be destroyed)
Config.HideDurabilityFromItems = {
    ['crafting_book']            = true,
    ['job_application_document'] = true,
    ['warehousekeys']            = true,
}

---------------------------------------------------------------
--[[ Commands ]]--
---------------------------------------------------------------

Config.Commands = {

    ['additem'] = { 

        Suggestion = "Perform this command to add items on the selected user.",

        Webhook = { 
            Enabled = false, 
            Url = "", 
            Color = 10038562,
        },
        
        Groups  = { 'admin', 'mod' },
        DiscordRoles  = { 670899926783361024 },
    },

            
    ['addweapon'] = { 

        Suggestion = "Perform this command to add weapons on the selected user.",

        Webhook = { 
            Enabled = false, 
            Url = "", 
            Color = 10038562,
        },
        
        Groups  = { 'admin', 'mod' },
        DiscordRoles  = { 670899926783361024 },
    },

    ['clearinventory'] = { 

        Suggestion = "Perform this command to clear all the inventory contents on the selected user.",

        Webhook = { 
            Enabled = false, 
            Url = "", 
            Color = 10038562,
        },
        
        Groups  = { 'admin', 'mod' },
        DiscordRoles  = { 670899926783361024 },
    },

	
    ['openinventory'] = { 

        Suggestion = "Perform this command to open the inventory contents of the selected user.",

        Webhook = { 
            Enabled = false, 
            Url = "", 
            Color = 10038562,
        },
        
        Groups  = { 'admin', 'mod' },
        DiscordRoles  = { 670899926783361024 },
    },
	
}

---------------------------------------------------------------
--[[ Webhooks ]]--
---------------------------------------------------------------

Config.Webhooks = {
    
    ['DEVTOOLS_INJECTION_CHEAT'] = { -- Warnings and Logs about players who used or atleast tried to use devtools injection.
        Enabled = true, 
        Url = "https://discord.com/api/webhooks/1332421489600888912/uKjOemMADazb0hjIcRBedNsl8j2jo3iwGruESf9OCmY3Z9_bIJfaG63-zaZLqn3DTiqS", 
        Color = 10038562,
    },

    ['DROPPED_ITEMS'] = { 

        Enabled = true, 
        Url = "https://discord.com/api/webhooks/1176842911283945473/3uVJ5W2a3rkPs1rK-yTYPx9JxGPU5B-sYMJ9KnGuI4ZUkr-y-d8vKIEqkrOr3g5dyVGq", 
        Color = 10038562,
        
    },

}

-----------------------------------------------------------
--[[ Notification Functions ]]--
-----------------------------------------------------------

-- @param source : The source always null when called from client.
-- @param source : The source (0) is called from txadmin.
-- @param source : The source if not null and not (0), is a player object.

-- @param type   : returns "error", "success", "info"
-- @param duration : the notification duration in milliseconds
function SendCommandNotification(source, message, type, duration) -- ONLY RELATED TO COMMANDS.

	if not duration then
		duration = 3000
	end

    if source == nil then -- CLIENT SIDE
        TriggerEvent('tpz_core:sendBottomTipNotification', message, duration)

    elseif source == 0 then -- CONSOLE - NO DURATION SUPPORT OR TYPE.
        print(message:gsub("~e~", '^1') .. '^0')

    elseif source and source ~= 0 then -- PLAYER OBJECT
        TriggerClientEvent('tpz_core:sendBottomTipNotification', source, message, duration)
    end
  
end




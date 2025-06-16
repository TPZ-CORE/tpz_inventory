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

-- Set to true if you want to use a database table for handling all items instead of configuration.
-- The database table is `items`.
Config.UseDatabaseItems  = false

Config.DisplayMoney      = true
Config.DisplayBlackMoney = false
Config.DisplayGold       = true

Config.InventoryMaxWeight      = 40 -- Default is 40KG to carry on the player's inventory.
Config.InventoryMaxWeightLabel = "40KG"

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
    DurabilityRemovalTimer = 3, -- The time in minutes, every 3 minutes by default we removing (X%) durability (3 minutes = 5 hours for an item to be removed when removeValue equals to 1)

    Items = {
        ['consumable_bread']             = { removeValue = { 0, 1 }, newItem = false },
        ['consumable_banana']            = { removeValue = { 0, 1 }, newItem = false },
        ['consumable_avocado']           = { removeValue = { 0, 1 }, newItem = false },
        ['consumable_olives']            = { removeValue = { 0, 1 }, newItem = false },
        ['consumable_orange']            = { removeValue = { 0, 1 }, newItem = false },
        ['consumable_peach']             = { removeValue = { 0, 1 }, newItem = false },
        ['consumable_pear']              = { removeValue = { 0, 1 }, newItem = false },
        ['consumable_strawberry']        = { removeValue = { 0, 1 }, newItem = false },
        ['consumable_melon']             = { removeValue = { 0, 1 }, newItem = false },
        ['consumable_grapes']            = { removeValue = { 0, 1 }, newItem = false },
        ['consumable_tomato']            = { removeValue = { 0, 1 }, newItem = false },


        ['fish_meat']                    = { removeValue = { 2, 3 }, newItem = false },

        ['meat']                         = { removeValue = { 3, 3 }, newItem = "spoiled_meat" },
        ['bison_meat']                   = { removeValue = { 3, 3 }, newItem = "spoiled_bison_meat" },
        ['biggame']                      = { removeValue = { 3, 3 }, newItem = "spoiled_biggame_meat" },
        ['birdmeat']                     = { removeValue = { 3, 3 }, newItem = false },

        ['consumable_meat_cooked']       = { removeValue = { 2, 3 }, newItem = "spoiled_meat" },
        ['consumable_bison_cooked']      = { removeValue = { 2, 3 }, newItem = "spoiled_bison_meat" },
        ['consumable_biggame_cooked']    = { removeValue = { 2, 3 }, newItem = "spoiled_biggame_meat" },

        -- FISH MODELS (TPZ FISHING)

        ['a_c_fishbluegil_01_ms']        = { removeValue = { 2, 3 }, newItem = false },
        ['a_c_fishbluegil_01_sm']        = { removeValue = { 2, 3 }, newItem = false },
        ['a_c_fishbullheadcat_01_ms']    = { removeValue = { 2, 3 }, newItem = false },
        ['a_c_fishbullheadcat_01_sm']    = { removeValue = { 2, 3 }, newItem = false },
        ['a_c_fishchainpickerel_01_ms']  = { removeValue = { 2, 3 }, newItem = false },
        ['a_c_fishchainpickerel_01_sm']  = { removeValue = { 2, 3 }, newItem = false },
        ['a_c_fishchannelcatfish_01_lg'] = { removeValue = { 2, 3 }, newItem = false },
        ['a_c_fishchannelcatfish_01_xl'] = { removeValue = { 2, 3 }, newItem = false },
        ['a_c_fishlakesturgeon_01_lg']   = { removeValue = { 2, 3 }, newItem = false },
        ['a_c_fishlargemouthbass_01_lg'] = { removeValue = { 2, 3 }, newItem = false },
        ['a_c_fishlargemouthbass_01_ms'] = { removeValue = { 2, 3 }, newItem = false },
        ['a_c_fishlongnosegar_01_lg']    = { removeValue = { 2, 3 }, newItem = false },
        ['a_c_fishmuskie_01_lg']         = { removeValue = { 2, 3 }, newItem = false },
        ['a_c_fishnorthernpike_01_lg']   = { removeValue = { 2, 3 }, newItem = false },
        ['a_c_fishperch_01_ms']          = { removeValue = { 2, 3 }, newItem = false },
        ['a_c_fishperch_01_sm']          = { removeValue = { 2, 3 }, newItem = false },
        ['a_c_fishrainbowtrout_01_lg']   = { removeValue = { 2, 3 }, newItem = false },
        ['a_c_fishrainbowtrout_01_ms']   = { removeValue = { 2, 3 }, newItem = false },
        ['a_c_fishredfinpickerel_01_ms'] = { removeValue = { 2, 3 }, newItem = false },
        ['a_c_fishredfinpickerel_01_sm'] = { removeValue = { 2, 3 }, newItem = false },
        ['a_c_fishrockbass_01_ms']       = { removeValue = { 2, 3 }, newItem = false },
        ['a_c_fishrockbass_01_sm']       = { removeValue = { 2, 3 }, newItem = false },
        ['a_c_fishsalmonsockeye_01_lg']  = { removeValue = { 2, 3 }, newItem = false },
        ['a_c_fishsalmonsockeye_01_ml']  = { removeValue = { 2, 3 }, newItem = false },
        ['a_c_fishsalmonsockeye_01_ms']  = { removeValue = { 2, 3 }, newItem = false },
        ['a_c_fishsmallmouthbass_01_lg'] = { removeValue = { 2, 3 }, newItem = false },
        ['a_c_fishsmallmouthbass_01_ms'] = { removeValue = { 2, 3 }, newItem = false },

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

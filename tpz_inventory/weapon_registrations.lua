SharedWeapons = {}

SharedWeapons = {

  Options = {

    -- Set to false if you are not going to use lanterns, lanterns are using a system for their durability removal while holding.
    UsingLanterns = true,

  },

  Weapons = {
    ['WEAPON_LASSO']                       = { label = 'Lasso',                        description = 'nothing', weight = 1.0, displayDurability = true,  removeDurabilityValue = { 5 },    removeDurabilityChance = 100 },
    ['WEAPON_LASSO_REINFORCED']            = { label = 'Reinforced Lasso',             description = 'nothing', weight = 1.5, displayDurability = true,  removeDurabilityValue = { 3 },    removeDurabilityChance = 100 },

    ['WEAPON_FISHINGROD']                  = { label = 'Fishing Rod',                  description = 'nothing', weight = 3.0, displayDurability = true,  removeDurabilityValue = { 2 },    removeDurabilityChance = 100 },

    ['WEAPON_MELEE_KNIFE']                 = { label = 'Knife',                        description = 'nothing', weight = 0.5, displayDurability = true,  removeDurabilityValue = { 3 },    removeDurabilityChance = 100 },
    ['WEAPON_MELEE_KNIFE_RUSTIC']          = { label = 'Knife Rustic',                 description = 'nothing', weight = 0.5, displayDurability = true,  removeDurabilityValue = { 3 },    removeDurabilityChance = 100 },
    ['WEAPON_MELEE_KNIFE_HORROR']          = { label = 'Knife Horror',                 description = 'nothing', weight = 0.5, displayDurability = true,  removeDurabilityValue = { 3 },    removeDurabilityChance = 100 },
    ['WEAPON_MELEE_KNIFE_CIVIL_WAR']       = { label = 'Knife Civil War',              description = 'nothing', weight = 0.3, displayDurability = true,  removeDurabilityValue = { 3 },    removeDurabilityChance = 100 },
    ['WEAPON_MELEE_KNIFE_JAWBONE']         = { label = 'Knife Jawbone',                description = 'nothing', weight = 0.5, displayDurability = true,  removeDurabilityValue = { 3 },    removeDurabilityChance = 100 },
    ['WEAPON_MELEE_KNIFE_MINER']           = { label = 'Knife Miner',                  description = 'nothing', weight = 0.5, displayDurability = true,  removeDurabilityValue = { 3 },    removeDurabilityChance = 100 },
    ['WEAPON_MELEE_KNIFE_TRADER']          = { label = 'Knife Trader',                 description = 'nothing', weight = 0.5, displayDurability = true,  removeDurabilityValue = { 3 },    removeDurabilityChance = 100 },
    ['WEAPON_MELEE_KNIFE_VAMPIRE']         = { label = 'Knife Vampire',                description = 'nothing', weight = 0.5, displayDurability = true,  removeDurabilityValue = { 3 },    removeDurabilityChance = 100 },

    ['WEAPON_MELEE_CLEAVER']               = { label = 'Cleaver',                      description = 'nothing', weight = 1.0, displayDurability = false, removeDurabilityValue = false,    removeDurabilityChance = 0 },

    ['WEAPON_MELEE_HATCHET']               = { label = 'Hatchet',                      description = 'nothing', weight = 1.0, displayDurability = false, removeDurabilityValue = false,    removeDurabilityChance = 0 },
    ['WEAPON_MELEE_HATCHET_DOUBLE_BIT']    = { label = 'Hatchet Double Bit',           description = 'nothing', weight = 1.0, displayDurability = false, removeDurabilityValue = false,    removeDurabilityChance = 0 },
    ['WEAPON_MELEE_HATCHET_HEWING']        = { label = 'Hatchet Hewing',               description = 'nothing', weight = 1.0, displayDurability = false, removeDurabilityValue = false,    removeDurabilityChance = 0 },
    ['WEAPON_MELEE_HATCHET_HUNTER']        = { label = 'Hatchet Hunter',               description = 'nothing', weight = 1.0, displayDurability = false, removeDurabilityValue = false,    removeDurabilityChance = 0 },
    ['WEAPON_MELEE_HATCHET_VIKING']        = { label = 'Hatchet Viking',               description = 'nothing', weight = 1.0, displayDurability = false, removeDurabilityValue = false,    removeDurabilityChance = 0 },

    ['WEAPON_THROWN_TOMAHAWK']             = { label = 'Tomahawk',                     description = 'nothing', weight = 1.0, displayDurability = false, removeDurabilityValue = false,    removeDurabilityChance = 0 },
    ['WEAPON_THROWN_TOMAHAWK_ANCIENT']     = { label = 'Tomahawk Ancient',             description = 'nothing', weight = 1.0, displayDurability = false, removeDurabilityValue = false,    removeDurabilityChance = 0 },

    ['WEAPON_THROWN_THROWING_KNIVES']      = { label = 'Throwing Knives',              description = 'nothing', weight = 1.0, displayDurability = false, removeDurabilityValue = false,    removeDurabilityChance = 0 },

    ['WEAPON_MELEE_MACHETE']               = { label = 'Machete',                      description = 'nothing', weight = 1.0, displayDurability = true,  removeDurabilityValue = { 3 },    removeDurabilityChance = 100 },
    ['WEAPON_MELEE_MACHETE_COLLECTOR']     = { label = 'Machete Collector',            description = 'nothing', weight = 1.0, displayDurability = true,  removeDurabilityValue = { 3 },    removeDurabilityChance = 100 },
    ['WEAPON_MACHETE_HORROR']              = { label = 'Machete Horror',               description = 'nothing', weight = 1.0, displayDurability = true,  removeDurabilityValue = { 3 },    removeDurabilityChance = 100 },

    ['WEAPON_MELEE_HAMMER']                = { label = 'Hammer',                       description = 'nothing', weight = 1.0, displayDurability = true,  removeDurabilityValue = { 3 },    removeDurabilityChance = 100 },

    ['WEAPON_BOW']                         = { label = 'Bow',                          description = 'nothing', weight = 2.0, displayDurability = true,  removeDurabilityValue = { 1 },    removeDurabilityChance = 50 },
    ['WEAPON_BOW_IMPROVED']                = { label = 'Improved Bow',                 description = 'nothing', weight = 5.0, displayDurability = true,  removeDurabilityValue = { 1 },    removeDurabilityChance = 30 },
    
    ['WEAPON_PISTOL_SEMIAUTO']             = { label = 'Pistol Semi-Auto',             description = 'nothing', weight = 2.0, displayDurability = true,  removeDurabilityValue = { 0, 1 }, removeDurabilityChance = 50 },
    ['WEAPON_PISTOL_MAUSER']               = { label = 'Pistol Mauser',                description = 'nothing', weight = 2.0, displayDurability = true,  removeDurabilityValue = { 0, 1 }, removeDurabilityChance = 50 },
    ['WEAPON_PISTOL_VOLCANIC']             = { label = 'Pistol Volcanic',              description = 'nothing', weight = 2.0, displayDurability = true,  removeDurabilityValue = { 0, 1 }, removeDurabilityChance = 50 },
    ['WEAPON_PISTOL_M1899']                = { label = 'Pistol M1899',                 description = 'nothing', weight = 2.0, displayDurability = true,  removeDurabilityValue = { 0, 1 }, removeDurabilityChance = 50 },

    ['WEAPON_REVOLVER_SCHOFIELD']          = { label = 'Revolver Schofield',           description = 'nothing', weight = 1.0, displayDurability = true,  removeDurabilityValue = { 0, 1 }, removeDurabilityChance = 50 },
    ['WEAPON_REVOLVER_NAVY']               = { label = 'Revolver Navy',                description = 'nothing', weight = 1.0, displayDurability = true,  removeDurabilityValue = { 0, 1 }, removeDurabilityChance = 50 },
    ['WEAPON_REVOLVER_NAVY_CROSSOVER']     = { label = 'Revolver Navy Crossover',      description = 'nothing', weight = 1.0, displayDurability = true,  removeDurabilityValue = { 0, 1 }, removeDurabilityChance = 50 },
    ['WEAPON_REVOLVER_LEMAT']              = { label = 'Revolver Lemat',               description = 'nothing', weight = 1.0, displayDurability = true,  removeDurabilityValue = { 0, 1 }, removeDurabilityChance = 50 },
    ['WEAPON_REVOLVER_DOUBLEACTION']       = { label = 'Revolver Double Action',       description = 'nothing', weight = 1.0, displayDurability = true,  removeDurabilityValue = { 0, 1 }, removeDurabilityChance = 50 },
    ['WEAPON_REVOLVER_CATTLEMAN']          = { label = 'Revolver Cattleman',           description = 'nothing', weight = 1.0, displayDurability = true,  removeDurabilityValue = { 0, 1 }, removeDurabilityChance = 50 },
    ['WEAPON_REVOLVER_CATTLEMAN_MEXICAN']  = { label = 'Revolver Cattleman Mexican',   description = 'nothing', weight = 1.0, displayDurability = true,  removeDurabilityValue = { 0, 1 }, removeDurabilityChance = 50 },

    ['WEAPON_RIFLE_VARMINT']               = { label = 'Varmint Rifle',                description = 'nothing', weight = 3.3, displayDurability = true,  removeDurabilityValue = { 0, 1 }, removeDurabilityChance = 50 },

    ['WEAPON_REPEATER_WINCHESTER']         = { label = 'Winchester Repeater',          description = 'nothing', weight = 10.5, displayDurability = true, removeDurabilityValue = { 0, 1 }, removeDurabilityChance = 50 },
    ['WEAPON_REPEATER_HENRY']              = { label = 'Henry Repeater',               description = 'nothing', weight = 10.5, displayDurability = true, removeDurabilityValue = { 0, 1 }, removeDurabilityChance = 50 },
    ['WEAPON_REPEATER_EVANS']              = { label = 'Evans Repeater',               description = 'nothing', weight = 10.5, displayDurability = true, removeDurabilityValue = { 0, 1 }, removeDurabilityChance = 50 },
    ['WEAPON_REPEATER_CARBINE']            = { label = 'Carbine Repeater',             description = 'nothing', weight = 10.5, displayDurability = true, removeDurabilityValue = { 0, 1 }, removeDurabilityChance = 50 },

    ['WEAPON_SNIPERRIFLE_ROLLINGBLOCK']    = { label = 'Rolling Block Rifle',          description = 'nothing', weight = 8.0, displayDurability = true,  removeDurabilityValue = { 1, 2 }, removeDurabilityChance = 70 },
    ['WEAPON_SNIPERRIFLE_CARCANO']         = { label = 'Carcano Rifle',                description = 'nothing', weight = 8.0, displayDurability = true,  removeDurabilityValue = { 1, 2 }, removeDurabilityChance = 70 },
    ['WEAPON_RIFLE_SPRINGFIELD']           = { label = 'Springfield Rifle',            description = 'nothing', weight = 4.0, displayDurability = true,  removeDurabilityValue = { 0, 1 }, removeDurabilityChance = 50 },
    ['WEAPON_RIFLE_ELEPHANT']              = { label = 'Elephant Rifle',               description = 'nothing', weight = 4.0, displayDurability = true,  removeDurabilityValue = { 0, 1 }, removeDurabilityChance = 50 },
    ['WEAPON_RIFLE_BOLTACTION']            = { label = 'Bolt Action Rifle',            description = 'nothing', weight = 4.0, displayDurability = true,  removeDurabilityValue = { 0, 1 }, removeDurabilityChance = 50 },
    
    ['WEAPON_SHOTGUN_SEMIAUTO']            = { label = 'Semi-Auto Shotgun',            description = 'nothing', weight = 3.2, displayDurability = true,  removeDurabilityValue = { 1, 2 }, removeDurabilityChance = 30 },
    ['WEAPON_SHOTGUN_SAWEDOFF']            = { label = 'Sawed-Off Shotgun',            description = 'nothing', weight = 3.2, displayDurability = true,  removeDurabilityValue = { 1, 2 }, removeDurabilityChance = 30 },
    ['WEAPON_SHOTGUN_REPEATING']           = { label = 'Repeating Shotgun',            description = 'nothing', weight = 3.2, displayDurability = true,  removeDurabilityValue = { 1, 2 }, removeDurabilityChance = 30 },
    ['WEAPON_SHOTGUN_DOUBLEBARREL_EXOTIC'] = { label = 'Double Barrel Exotic Shotgun', description = 'nothing', weight = 3.2, displayDurability = true,  removeDurabilityValue = { 1, 2 }, removeDurabilityChance = 30 },
    ['WEAPON_SHOTGUN_PUMP']                = { label = 'Pump Shotgun',                 description = 'nothing', weight = 3.2, displayDurability = true,  removeDurabilityValue = { 1, 2 }, removeDurabilityChance = 30 },
    ['WEAPON_SHOTGUN_DOUBLEBARREL']        = { label = 'Double Barrel Shotgun',        description = 'nothing', weight = 3.2, displayDurability = true,  removeDurabilityValue = { 1, 2 }, removeDurabilityChance = 30 },

    ['WEAPON_KIT_CAMERA']                  = { label = 'Camera',                       description = 'nothing', weight = 0.7, displayDurability = false, removeDurabilityValue = false, removeDurabilityChance = 0 },
    ['WEAPON_KIT_CAMERA_ADVANCED']         = { label = 'Advanced Camera',              description = 'nothing', weight = 1.0, displayDurability = false, removeDurabilityValue = false, removeDurabilityChance = 0 },

    ['WEAPON_KIT_BINOCULARS']              = { label = 'Binoculars',                   description = 'nothing', weight = 0.75, displayDurability = false, removeDurabilityValue = false, removeDurabilityChance = 0 },
    ['WEAPON_KIT_BINOCULARS_IMPROVED']     = { label = 'Improved Binoculars',          description = 'nothing', weight = 0.8,  displayDurability = false, removeDurabilityValue = false,  removeDurabilityChance = 0 },

    ['WEAPON_THROWN_POISONBOTTLE']         = { label = 'Poison Bottle',                description = 'nothing', weight = 0.5, displayDurability = false, removeDurabilityValue = false,  removeDurabilityChance = 0 },
    ['WEAPON_THROWN_DYNAMITE']             = { label = 'Dynamite',                     description = 'nothing', weight = 1.0, displayDurability = false, removeDurabilityValue = false,  removeDurabilityChance = 0 },
    ['WEAPON_THROWN_MOLOTOV']              = { label = 'Molotov',                      description = 'nothing', weight = 1.0, displayDurability = false, removeDurabilityValue = false,  removeDurabilityChance = 0 },

    --['WEAPON_MOONSHINEJUG_MP']             = { label = 'Moonshine Jug',                description = 'nothing', weight = 1.0, displayDurability = false, removeDurabilityValue = false,  removeDurabilityChance = 0 },

    ['WEAPON_THROWN_BOLAS']                = { label = 'Bolas',                        description = 'nothing', weight = 1.0, displayDurability = false, removeDurabilityValue = false,  removeDurabilityChance = 0 },
    ['WEAPON_THROWN_BOLAS_HAWKMOTH']       = { label = 'Bolas Hawkmoth',               description = 'nothing', weight = 1.0, displayDurability = false, removeDurabilityValue = false,  removeDurabilityChance = 0 },
    ['WEAPON_THROWN_BOLAS_IRONSPIKED']     = { label = 'Bolas Ironspiked',             description = 'nothing', weight = 1.0, displayDurability = false, removeDurabilityValue = false,  removeDurabilityChance = 0 },
    ['WEAPON_THROWN_BOLAS_INTERTWINED']    = { label = 'Bolas Intertwined',            description = 'nothing', weight = 1.0, displayDurability = false, removeDurabilityValue = false,  removeDurabilityChance = 0 },

    -- Torches and Lanterns are having @removeDurabilityDelay instead of @removeDurabilityChance because their durability is decreased while holding.
    ['WEAPON_MELEE_TORCH']                 = { label = 'Torch',                        description = 'nothing', weight = 1.0, displayDurability = true,  removeDurabilityValue = { 1 },  removeDurabilityDelay = 10 },
    ['WEAPON_MELEE_LANTERN']               = { label = 'Lantern',                      description = 'nothing', weight = 1.0, displayDurability = true,  removeDurabilityValue = { 1 },  removeDurabilityDelay = 12 },
    ['WEAPON_MELEE_DAVY_LANTERN']          = { label = 'Davy Lantern',                 description = 'nothing', weight = 1.0, displayDurability = true,  removeDurabilityValue = { 1 },  removeDurabilityDelay = 12 },
    ['WEAPON_MELEE_LANTERN_HALLOWEEN']     = { label = 'Halloween Lantern',            description = 'nothing', weight = 1.0, displayDurability = true,  removeDurabilityValue = { 1 },  removeDurabilityDelay = 12 },
    --['WEAPON_MELEE_LANTERN_ELECTRIC']    = { label = 'Electric Lantern',             description = 'nothing', weight = 1.0, displayDurability = false, removeDurabilityValue = false,  removeDurabilityChance = 0 },

    -- check?
    ['WEAPON_KIT_METAL_DETECTOR']          = { label = 'Metal Detector',               description = 'nothing', weight = 2.3, displayDurability = false, removeDurabilityValue = false,  removeDurabilityChance = 0 },

  },
  
  Ammo = {
    ['AMMO_PISTOL']                      = {item = "ammopistolnormal",       maxAmmo = 100, label = 'Pistol Ammo' },
    ['AMMO_PISTOL_EXPRESS']              = {item = "ammopistolexpress",      maxAmmo = 100, label = 'Pistol Ammo Express' },
    ['AMMO_PISTOL_EXPRESS_EXPLOSIVE']    = {item = "ammopistolexplosive",    maxAmmo = 100, label = 'Pistol Ammo Explosives' },
    ['AMMO_PISTOL_HIGH_VELOCITY']        = {item = "ammopistolvelocity",     maxAmmo = 100, label = 'Pistol Ammo H* Velocity' },
    ['AMMO_PISTOL_SPLIT_POINT']          = {item = "ammopistolsplitpoint",   maxAmmo = 100, label = 'Pistol Ammo Split Point' },

    ['AMMO_REPEATER']                    = {item = "ammorepeaternormal",     maxAmmo = 70, label = 'Repeater Ammo' },
    ['AMMO_REPEATER_EXPRESS']            = {item = "ammorepeaterexpress",    maxAmmo = 70, label = 'Repeater Ammo Express' },
    ['AMMO_REPEATER_EXPRESS_EXPLOSIVE']  = {item = "ammorepeaterexplosive",  maxAmmo = 70, label = 'Repeater Ammo Explosives' },
    ['AMMO_REPEATER_HIGH_VELOCITY']      = {item = "ammorepeatervelocity",   maxAmmo = 70, label = 'Repeater Ammo H* Velocity' },
    ['AMMO_REPEATER_SPLIT_POINT']        = {item = "ammorepeatersplitpoint", maxAmmo = 70, label = 'Repeater Ammo Split Point' },

    ['AMMO_REVOLVER']                    = {item = "ammorevolvernormal",     maxAmmo = 200, label = 'Revolver Ammo' },
    ['AMMO_REVOLVER_EXPRESS']            = {item = "ammorevolverexpress",    maxAmmo = 10, label = 'Revolver Ammo Express' },
    ['AMMO_REVOLVER_EXPRESS_EXPLOSIVE']  = {item = "ammorevolverexplosive",  maxAmmo = 10, label = 'Revolver Ammo Explosives' },
    ['AMMO_REVOLVER_HIGH_VELOCITY']      = {item = "ammorevolvervelocity",   maxAmmo = 10, label = 'Revolver Ammo H* Velocity' },
    ['AMMO_REVOLVER_SPLIT_POINT']        = {item = "ammorevolversplitpoint", maxAmmo = 10, label = 'Revolver Ammo Split Point' },

    ['AMMO_RIFLE']                       = {item = "ammoriflenormal",        maxAmmo = 100, label = 'Rifle Ammo' },     
    ['AMMO_RIFLE_ELEPHANT']              = {item = "ammoelephant",           maxAmmo = 20, label = 'Rifle Ammo Elephant' },  
    ['AMMO_RIFLE_EXPRESS']               = {item = "ammorifleexpress",       maxAmmo = 90, label = 'Rifle Ammo Express' },  
    ['AMMO_RIFLE_EXPRESS_EXPLOSIVE']     = {item = "ammorifleexplosive",     maxAmmo = 10, label = 'Rifle Ammo Explosives' },  
    ['AMMO_RIFLE_HIGH_VELOCITY']         = {item = "ammoriflevelocity",      maxAmmo = 90, label = 'Rifle Ammo H* Velocity' },  
    ['AMMO_RIFLE_SPLIT_POINT']           = {item = "ammoriflesplitpoint",    maxAmmo = 90, label = 'Rifle Ammo Split Point' },

    ['AMMO_22']                          = {item = "", maxAmmo = 80, label = '22 Ammo' },
    ['AMMO_22_TRANQUILIZER']             = {item = "", maxAmmo = 80, label = '22 Ammo Tranquilizer' },

    ['AMMO_SHOTGUN']                     = {item = "ammoshotgunnormal",      maxAmmo = 80, label = 'Shotgun Ammo' },
    ['AMMO_SHOTGUN_BUCKSHOT_INCENDIARY'] = {item = "ammoshotgunincendiary",  maxAmmo = 80, label = 'Shotgun Ammo Buckshot Incendiary' },
    ['AMMO_SHOTGUN_EXPRESS_EXPLOSIVE']   = {item = "ammoshotgunexplosive",   maxAmmo = 80, label = 'Shotgun Ammo Explosives' },
    ['AMMO_SHOTGUN_SLUG']                = {item = "ammoshotgunslug",        maxAmmo = 80, label = 'Shotgun Ammo Slug' },
    
    ['AMMO_ARROW']                       = {item = "ammoarrownormal",        maxAmmo = 40, label = 'Arrows' },
    ['AMMO_ARROW_DYNAMITE']              = {item = "ammoarrowdynamite",      maxAmmo = 12, label = 'Dynamite Arrows' },
    ['AMMO_ARROW_FIRE']                  = {item = "ammoarrowfire",          maxAmmo = 12, label = 'Fire Arrows' },
    ['AMMO_ARROW_IMPROVED']              = {item = "ammoarrowimproved",      maxAmmo = 12, label = 'Arrows Improved' },
    ['AMMO_ARROW_SMALL_GAME']            = {item = "ammoarrowsmallgame",     maxAmmo = 12, label = 'Arrows Small'},
    ['AMMO_ARROW_POISON']                = {item = "ammoarrowpoison",        maxAmmo = 12, label = 'Poisoned Arrows'},

    -- WE HAVE REMOVED THROWN KNIVES, MOLOTOV, BOLAS, .. BY HAVING AMMUNITION SUPPORT, THOSE WILL BE ONLY 1 WEAPON TYPE WITH 1 AMMO DUE TO SERIAL NUMBERS.
    -- EACH WEAPON TYPE WILL BE SHOWN SEPARATELY AND USED SEPARATELY.
  },

  AmmoTypes = { 
    ["416676503"]   = {"AMMO_PISTOL","AMMO_PISTOL_EXPRESS","AMMO_PISTOL_EXPRESS_EXPLOSIVE","AMMO_PISTOL_HIGH_VELOCITY","AMMO_PISTOL_SPLIT_POINT"},
    ["-594562071"]  = {"AMMO_REPEATER","AMMO_REPEATER_EXPRESS","AMMO_REPEATER_EXPRESS_EXPLOSIVE","AMMO_REPEATER_HIGH_VELOCITY","AMMO_REPEATER_SPLIT_POINT"},
    ["-1101297303"] = {"AMMO_REVOLVER","AMMO_REVOLVER_EXPRESS","AMMO_REVOLVER_EXPRESS_EXPLOSIVE","AMMO_REVOLVER_HIGH_VELOCITY","AMMO_REVOLVER_SPLIT_POINT","AMMO_SHOTGUN","AMMO_SHOTGUN_BUCKSHOT_INCENDIARY","AMMO_SHOTGUN_EXPRESS_EXPLOSIVE","AMMO_SHOTGUN_SLUG"},
    ["970310034"]   = {"AMMO_RIFLE","AMMO_RIFLE_ELEPHANT","AMMO_RIFLE_EXPRESS","AMMO_RIFLE_EXPRESS_EXPLOSIVE","AMMO_RIFLE_HIGH_VELOCITY","AMMO_RIFLE_SPLIT_POINT","AMMO_22","AMMO_22_TRANQUILIZER"},
    ["-1212426201"] = {"AMMO_RIFLE","AMMO_RIFLE_EXPRESS","AMMO_RIFLE_EXPRESS_EXPLOSIVE","AMMO_RIFLE_HIGH_VELOCITY","AMMO_RIFLE_SPLIT_POINT"},
    ["860033945"]   = {"AMMO_SHOTGUN","AMMO_SHOTGUN_BUCKSHOT_INCENDIARY","AMMO_SHOTGUN_EXPRESS_EXPLOSIVE","AMMO_SHOTGUN_SLUG"},
    ["-1241684019"] = {"AMMO_ARROW","AMMO_ARROW_DYNAMITE","AMMO_ARROW_FIRE","AMMO_ARROW_IMPROVED","AMMO_ARROW_SMALL_GAME","AMMO_ARROW_POISON"},

    -- WE HAVE REMOVED THROWN KNIVES, MOLOTOV, BOLAS, .. BY HAVING AMMUNITION SUPPORT, THOSE WILL BE ONLY 1 WEAPON TYPE WITH 1 AMMO DUE TO SERIAL NUMBERS.
    -- EACH WEAPON TYPE WILL BE SHOWN SEPARATELY AND USED SEPARATELY.
    
  },

}

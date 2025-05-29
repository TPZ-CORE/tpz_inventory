SharedItems = {} -- DO NOT EDIT

-- @param label: the item label (name).
-- @param weight: the total item weight.
-- @param remove: [0] to not remove the item on usage | [1] to remove the item on usage.
-- @param description: the description of the item when hovering.

-- @param action: the correct description on action when right-clicking the item
-- Default Actions: 'USABLE', 'EATABLE', 'DRINKABLE', 'SMOKABLE', 'NONE'
-- (!) You can create your own action display, just make sure to add it on locales.js (javascript not lua).

-- @param stackable: [0] to make the item a non-stackable, (!) This is only for food or unique items such as keys, anything that contains metadata / durability | [1] to make the item stackable (does not contain metadata - ever).
-- @param droppable: [0] to not allow the specified item as droppable | [1] to allow the item to be dropped.
-- @param closeInventory [0] to not close the inventory on its use | [1] to close the inventory on its use.

SharedItems = {
    -- [ EATABLES ] --
    ['consumable_bread']  = {
        label = 'Bread Piece',
        weight = 0.1,
        remove = 0, 
        description = 'Eatable',
        action = 'EATABLE',   
        stackable = 0, 
        droppable = 1, 
        closeInventory = 1 
    },
    ['consumable_banana'] = {
        label = 'Banana',
        weight = 0.1,
        remove = 0,
        description = 'Fruit',
        action = 'EATABLE',
        stackable = 0,
        droppable = 1,
        closeInventory = 1
    },

    ['consumable_avocado'] = {
        label = 'Avocado',
        weight = 0.15,
        remove = 0,
        description = 'Fruit',
        action = 'EATABLE',
        stackable = 0,
        droppable = 1,
        closeInventory = 1
    },

    ['consumable_olives'] = {
        label = 'Olive',
        weight = 0.01,
        remove = 0,
        description = 'Fruit',
        action = 'EATABLE',
        stackable = 0,
        droppable = 1,
        closeInventory = 1
    },

    ['consumable_orange'] = {
        label = 'Orange',
        weight = 0.14,
        remove = 0,
        description = 'Fruit',
        action = 'EATABLE',
        stackable = 0,
        droppable = 1,
        closeInventory = 1
    },

    ['consumable_peach'] = {
        label = 'Peache',
        weight = 0.17,
        remove = 0,
        description = 'Fruit',
        action = 'EATABLE',
        stackable = 0,
        droppable = 1,
        closeInventory = 1
    },

    ['consumable_pear'] = {
        label = 'Pear',
        weight = 0.16,
        remove = 0,
        description = 'Fruit',
        action = 'EATABLE',
        stackable = 0,
        droppable = 1,
        closeInventory = 1
    },

    ['consumable_strawberry'] = {
        label = 'Strawberry',
        weight = 0.01,
        remove = 0,
        description = 'Fruit',
        action = 'EATABLE',
        stackable = 0,
        droppable = 1,
        closeInventory = 1
    },

    ['consumable_melon'] = {
        label = 'Melon Piece',
        weight = 0.15,
        remove = 0,
        description = 'Fruit',
        action = 'EATABLE',
        stackable = 0,
        droppable = 1,
        closeInventory = 1
    },

    ['consumable_grapes'] = {
        label = 'Grapes',
        weight = 0.01,
        remove = 0,
        description = 'Fruit',
        action = 'EATABLE',
        stackable = 0,
        droppable = 1,
        closeInventory = 1
    },

    ['consumable_apple'] = {
        label = 'Apple',
        weight = 0.1,
        remove = 0,
        description = 'Fruit',
        action = 'EATABLE',
        stackable = 0,
        droppable = 1,
        closeInventory = 1
    },

    -- replace inventory items from stackables to not if they change it again.
    ['fish_meat'] = {
        label = 'Fish Meat',
        weight = 0.2,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 0,
        droppable = 1,
        closeInventory = 1
    },

    ['meat'] = {
        label = 'Meat',
        weight = 0.3,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 0,
        droppable = 1,
        closeInventory = 1
    },

    ['bison_meat'] = {
        label = 'Bison Meat',
        weight = 0.4,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 0,
        droppable = 1,
        closeInventory = 1
    },

    ['biggame'] = {
        label = 'Big Game Meat',
        weight = 0.4,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 0,
        droppable = 1,
        closeInventory = 1
    },

    ['birdmeat'] = {
        label = 'Bird Meat',
        weight = 0.2,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 0,
        droppable = 1,
        closeInventory = 1
    },

    ['consumable_meat_cooked'] = {
        label = 'Cooked Meat',
        weight = 0.2,
        remove = 0,
        description = 'Eatable',
        action = 'EATABLE',
        stackable = 0,
        droppable = 1,
        closeInventory = 1
    },

    ['consumable_bison_cooked'] = {
        label = 'Cooked Bison Meat',
        weight = 0.3,
        remove = 0,
        description = 'Eatable',
        action = 'EATABLE',
        stackable = 0,
        droppable = 1,
        closeInventory = 1
    },

    ['consumable_biggame_cooked'] = {
        label = 'Cooked Big Game Meat',
        weight = 0.3,
        remove = 0,
        description = 'Eatable',
        action = 'EATABLE',
        stackable = 0,
        droppable = 1,
        closeInventory = 1
    },

    ['consumable_vegstew'] = {
        label = 'Vegetable Stew',
        weight = 0.5,
        remove = 0,
        description = 'Eatable',
        action = 'EATABLE',
        stackable = 0,
        droppable = 1,
        closeInventory = 1
    },

    ['spoiled_meat'] = {
        label = 'Spoiled Meat',
        weight = 0.1,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 1
    },

    ['spoiled_bison_meat'] = {
        label = 'Spoiled Bison Meat',
        weight = 0.2,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 1
    },

    ['spoiled_biggame_meat'] = {
        label = 'Spoiled Big Game Meat',
        weight = 0.2,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 1
    },

    ['minced_meat'] = {
        label = 'Minced Meat',
        weight = 0.5,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 1
    },

-- [ VEG & FRUITS - NOT EATABLES ]
    ['consumable_tomato'] = {
        label = 'Tomato',
        weight = 0.1,
        remove = 0,
        description = 'Fruit',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 1
    },

    ['cocoa'] = {
        label = 'Cocoa',
        weight = 0.01,
        remove = 0,
        description = 'Fruit',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 1
    },

    ['crows_garlic'] = {
        label = 'Crows Garlic',
        weight = 0.05,
        remove = 0,
        description = 'Vegetable',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['parasol_mushroom'] = {
        label = 'Parasol Mushroom',
        weight = 0.05,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['wild_carrot'] = {
        label = 'Wild Carrot',
        weight = 0.1,
        remove = 0,
        description = 'Vegetable',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['potato'] = {
        label = 'Potatoes',
        weight = 0.3,
        remove = 0,
        description = 'Vegetable',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['corn'] = {
        label = 'Corn',
        weight = 0.1,
        remove = 0,
        description = 'Vegetable',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    -- [ DRINKABLES ]
    ['consumable_water_bottle'] = {
        label = 'Water Bottle',
        weight = 0.5,
        remove = 0,
        description = 'Drinkables',
        action = 'DRINKABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 1
    },

    ['consumable_coffee'] = {
        label = 'Coffee',
        weight = 0.3,
        remove = 0,
        description = 'Drinkables',
        action = 'DRINKABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 1
    },

    ['consumable_beer'] = {
        label = 'Beer',
        weight = 0.2,
        remove = 0,
        description = 'Drinkables',
        action = 'DRINKABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 1
    },

    ['consumable_champagne'] = {
        label = 'Champagne',
        weight = 1.2,
        remove = 0,
        description = 'Drinkables',
        action = 'DRINKABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 1
    },

    ['consumable_wine'] = {
        label = 'Wine',
        weight = 1.2,
        remove = 0,
        description = 'Drinkables',
        action = 'DRINKABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 1
    },

    ['consumable_rum'] = {
        label = 'Rum',
        weight = 1.2,
        remove = 0,
        description = 'Drinkables',
        action = 'DRINKABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 1
    },

    ['consumable_scotch_whiskey'] = {
        label = 'Scotch Whiskey',
        weight = 1.2,
        remove = 0,
        description = 'Drinkables',
        action = 'DRINKABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 1
    },

    ['consumable_tenn_whiskey'] = {
        label = 'Tenn Whiskey',
        weight = 1.2,
        remove = 0,
        description = 'Drinkables',
        action = 'DRINKABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 1
    },

    ['consumable_whiskey'] = {
        label = 'Whiskey',
        weight = 1.2,
        remove = 0,
        description = 'Drinkables',
        action = 'DRINKABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 1
    },

    ['consumable_tequila'] = {
        label = 'Tequila',
        weight = 1.2,
        remove = 0,
        description = 'Drinkables',
        action = 'DRINKABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 1
    },

    ['consumable_vodka'] = {
        label = 'Vodka',
        weight = 1.2,
        remove = 0,
        description = 'Drinkables',
        action = 'DRINKABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 1
    },

    ['consumable_milk_bottle'] = {
        label = 'Milk Bottle',
        weight = 1.0,
        remove = 0,
        description = 'Drinkables',
        action = 'DRINKABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 1
    },

    ['consumable_antibiotics'] = {
        label = 'Antibiotics',
        weight = 0.01,
        remove = 0,
        description = 'Drinkables',
        action = 'DRINKABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 1
    },

-- [ ORES ]
    ['rock'] = {
        label = 'Rocks',
        weight = 0.1,
        remove = 0,
        description = 'Ores',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['coal'] = {
        label = 'Coal',
        weight = 0.05,
        remove = 0,
        description = 'Ores',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['copper'] = {
        label = 'Copper',
        weight = 0.2,
        remove = 0,
        description = 'Ores',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['salt'] = {
        label = 'Salt',
        weight = 0.01,
        remove = 0,
        description = 'Ores',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['clay'] = {
        label = 'Clay',
        weight = 0.05,
        remove = 0,
        description = 'Ores',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['iron'] = {
        label = 'Iron',
        weight = 0.2,
        remove = 0,
        description = 'Ores',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['silver'] = {
        label = 'Silver',
        weight = 0.3,
        remove = 0,
        description = 'Ores',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['steel'] = {
        label = 'Steel',
        weight = 0.3,
        remove = 0,
        description = 'Ores',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['goldnugget'] = {
        label = 'Gold Nuggets',
        weight = 0.1,
        remove = 0,
        description = 'Ores',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['platinum'] = {
        label = 'Platinum',
        weight = 0.3,
        remove = 0,
        description = 'Ores',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['diamond'] = {
        label = 'Diamonds',
        weight = 0.3,
        remove = 0,
        description = 'Ores',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['sulfur'] = {
        label = 'Sulfur',
        weight = 0.01,
        remove = 0,
        description = 'Ores',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['goldfragment'] = {
        label = 'Gold Fragments',
        weight = 0.1,
        remove = 0,
        description = 'Ores',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['metal'] = {
        label = 'Metal',
        weight = 0.4,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ironbar'] = {
        label = 'Iron Bar',
        weight = 2.0,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['goldbar'] = {
        label = 'Gold Bar',
        weight = 2.0,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    -- [ TOOLS ]
    ['pickaxe'] = {
        label = 'Pickaxe',
        weight = 5.0,
        remove = 0,
        description = 'Tools',
        action = 'USABLE',
        stackable = 0,
        droppable = 1,
        closeInventory = 1
    },

    ['shovel'] = {
        label = 'Shovel',
        weight = 5.0,
        remove = 0,
        description = 'Tools',
        action = 'USABLE',
        stackable = 0,
        droppable = 1,
        closeInventory = 1
    },

    ['hatchet'] = {
        label = 'Hatchet',
        weight = 5.0,
        remove = 0,
        description = 'Tools',
        action = 'USABLE',
        stackable = 0,
        droppable = 1,
        closeInventory = 1
    },

    ['hoe'] = {
        label = 'Garden Hoe',
        weight = 3.0,
        remove = 0,
        description = 'Tools',
        action = 'NONE',
        stackable = 0,
        droppable = 1,
        closeInventory = 1
    },

    ['goldpan'] = {
        label = 'Golden Pan',
        weight = 1.0,
        remove = 0,
        description = 'Tools',
        action = 'USABLE',
        stackable = 0,
        droppable = 1,
        closeInventory = 1
    },

    ['ironhammer'] = {
        label = 'Iron Hammer',
        weight = 1.0,
        remove = 0,
        description = 'Tools',
        action = 'NONE',
        stackable = 0,
        droppable = 1,
        closeInventory = 1
    },

    ['hammer'] = {
        label = 'Hammer',
        weight = 1.0,
        remove = 0,
        description = 'Tools',
        action = 'NONE',
        stackable = 0,
        droppable = 1,
        closeInventory = 1
    },

-- [AMMO]
    ['ammovarmint'] = {
        label = 'Varmint Ammo',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammovarminttranq'] = {
        label = 'Varmint Tranquilizer Ammo',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammoarrownormal'] = {
        label = 'Arrow Normal',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammoarrowdynamite'] = {
        label = 'Arrow Dynamite',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammoarrowfire'] = {
        label = 'Arrow Fire',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammoarrowimproved'] = {
        label = 'Arrow Improved',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammoarrowpoison'] = {
        label = 'Arrow Poison',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammoarrowsmallgame'] = {
        label = 'Arrow Small Game',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammopistolnormal'] = {
        label = 'Pistol Ammo',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammopistolexpress'] = {
        label = 'Pistol Ammo Express',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammopistolexplosive'] = {
        label = 'Pistol Ammo Explosives',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammopistolvelocity'] = {
        label = 'Pistol Ammo H* Velocity',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammopistolsplitpoint'] = {
        label = 'Pistol Ammo Split Point',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammorepeaternormal'] = {
        label = 'Repeater Ammo',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammorepeaterexpress'] = {
        label = 'Repeater Ammo Express',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammorepeaterexplosive'] = {
        label = 'Repeater Ammo Explosives',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammorepeatervelocity'] = {
        label = 'Repeater Ammo H* Velocity',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammorepeatersplitpoint'] = {
        label = 'Repeater Ammo Split Point',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammorevolvernormal'] = {
        label = 'Revolver Ammo',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammorevolverexpress'] = {
        label = 'Revolver Ammo Express',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammorevolverexplosive'] = {
        label = 'Revolver Ammo Explosives',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammorevolvervelocity'] = {
        label = 'Revolver Ammo H* Velocity',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammorevolversplitpoint'] = {
        label = 'Revolver Ammo Split Point',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammoriflenormal'] = {
        label = 'Rifle Ammo',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammoelephant'] = {
        label = 'Rifle Ammo Elephant',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammorifleexpress'] = {
        label = 'Rifle Ammo Express',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammorifleexplosive'] = {
        label = 'Rifle Ammo Explosives',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammoriflevelocity'] = {
        label = 'Rifle Ammo H* Velocity',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammoriflesplitpoint'] = {
        label = 'Rifle Ammo Split Point',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammoshotgunnormal'] = {
        label = 'Shotgun Ammo',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammoshotgunincendiary'] = {
        label = 'Shotgun Ammo Buckshot Incendiary',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammoshotgunexplosive'] = {
        label = 'Shotgun Ammo Explosives',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammoshotgunslug'] = {
        label = 'Shotgun Ammo Slug',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammoknives'] = {
        label = 'Throwing Knives',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammotomahawk'] = {
        label = 'Tomahawk',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammopoisonbottle'] = {
        label = 'Poisoned Bottle',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammodynamite'] = {
        label = 'Bolas Dynamite',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammovoldynamite'] = {
        label = 'Bolas Dynamite Volatile',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammomolotov'] = {
        label = 'Molotov',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ammovolmolotov'] = {
        label = 'Molotov Volatile',
        weight = 0.05,
        remove = 0,
        description = 'Ammunition',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['shellcasing'] = {
        label = 'Empty Shell Casing',
        weight = 0.2,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['pistolcartidgebox'] = {
        label = 'Pistol Cartidges Box',
        weight = 1.5,
        remove = 0,
        description = 'Ammunition',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['repeatercartidgebox'] = {
        label = 'Repeater Cartidges Box',
        weight = 3.0,
        remove = 0,
        description = 'Ammunition',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['revolvercartidgebox'] = {
        label = 'Revolver Cartidges Box',
        weight = 3.0,
        remove = 0,
        description = 'Ammunition',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['riflecartidgebox'] = {
        label = 'Rifle Cartidges Box',
        weight = 1.5,
        remove = 0,
        description = 'Ammunition',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['shotguncartidgebox'] = {
        label = 'Shotgun Cartidges Box',
        weight = 1.0,
        remove = 0,
        description = 'Ammunition',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    -- [OTHER]
    ['wooden_sticks'] = {
        label = 'Wooden Sticks',
        weight = 0.1,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['wooden_planks'] = {
        label = 'Wooden Planks',
        weight = 0.5,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['wood'] = {
        label = 'Wood Log',
        weight = 1.0,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    -- FISH BAITS
    ['p_baitBread01x'] = { 
        label = 'Bread Bait',                        
        weight = 0.01,  
        remove = 1, 
        description = 'Fishing Bait', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 1 
    },
    ['p_baitCorn01x'] = { 
        label = 'Corn Bait',                         
        weight = 0.01,  
        remove = 1, 
        description = 'Fishing Bait', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 1 
    },
    ['p_baitCheese01x'] = { 
        label = 'Cheese Bait',                       
        weight = 0.01,  
        remove = 1, 
        description = 'Fishing Bait', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 1 
    },
    ['p_baitWorm01x'] = { 
        label = 'Worm Bait',                       
        weight = 0.01,  
        remove = 1, 
        description = 'Fishing Bait', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 1 
    },

    ['p_baitCricket01x'] = { 
        label = 'Cricket Bait',                       
        weight = 0.01,  
        remove = 1, 
        description = 'Fishing Bait', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 1 
    },

    ['p_crawdad01x'] = { 
        label = 'Crawfish Bait',                       
        weight = 0.01,  
        remove = 1, 
        description = 'Fishing Bait', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 1 
    },

    ['p_finishedragonfly01x'] = { 
        label = 'Dragonfly Lure',                       
        weight = 0.01,  
        remove = 1, 
        description = 'Fishing Bait', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 1 
    },

    ['p_FinisdFishlure01x'] = { 
        label = 'Fish Lure',                       
        weight = 0.01,  
        remove = 1, 
        description = 'Fishing Bait', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 1 
    },

    ['p_finishdcrawd01x'] = { 
        label = 'Crawfish Lure',                       
        weight = 0.01,  
        remove = 1, 
        description = 'Fishing Bait', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 1 
    },

    ['p_finishedragonflylegendary01x'] = { 
        label = 'Legendary Dragonfly Lure',                       
        weight = 0.01,  
        remove = 1, 
        description = 'Fishing Bait', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 1 
    },

    ['p_finisdfishlurelegendary01x'] = { 
        label = 'Legendary Fish Lure',                       
        weight = 0.01,  
        remove = 1, 
        description = 'Fishing Bait', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 1 
    },

    ['p_finishdcrawdlegendary01x'] = { 
        label = 'Legendary Crawfish Lure',                       
        weight = 0.01,  
        remove = 1, 
        description = 'Fishing Bait', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 1 
    },

    ['p_lgoc_spinner_v4'] = { 
        label = 'Spinner V4',                       
        weight = 0.01,  
        remove = 1, 
        description = 'Fishing Bait', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 1 
    },

    ['p_lgoc_spinner_v6'] = { 
        label = 'Spinner V6',                       
        weight = 0.01,  
        remove = 1, 
        description = 'Fishing Bait', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 1 
    },

    -- FISH MODELS (FISHES BY DEFAULT ARE NOT USABLE ITEMS, THEY ARE MOSTLY REQUIRED FOR CRAFTING RECIPES, IF YOU WANT YOUR PLAYER TO EAT THEM, CHANGE THE ACTION TO EATABLE)
    ['a_c_fishbluegil_01_ms'] = { 
        label = 'Blue Gil (Medium)',                       
        weight = 0.5,  
        remove = 1, 
        description = 'Fish', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_fishbluegil_01_sm'] = { 
        label = 'Blue Gil (Small)',                       
        weight = 0.3,  
        remove = 1, 
        description = 'Fish', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_fishbullheadcat_01_ms'] = { 
        label = 'Bullhead Cat (Medium)',                       
        weight = 0.5,  
        remove = 1, 
        description = 'Fish', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_fishbullheadcat_01_sm'] = { 
        label = 'Bullhead Cat (Small)',                       
        weight = 0.3,  
        remove = 1, 
        description = 'Fish', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_fishchainpickerel_01_ms'] = { 
        label = 'Chain Pickerel (Medium)',                       
        weight = 0.5,  
        remove = 1, 
        description = 'Fish', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_fishchainpickerel_01_sm'] = { 
        label = 'Chain Pickerel (Small)',                       
        weight = 0.3,  
        remove = 1, 
        description = 'Fish', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_fishchannelcatfish_01_lg'] = { 
        label = 'Channel Catfish (Large)',                       
        weight = 1.0,  
        remove = 1, 
        description = 'Fish', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_fishchannelcatfish_01_xl'] = { 
        label = 'Channel Catfish (Extra Large)',                       
        weight = 2.0,  
        remove = 1, 
        description = 'Fish', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_fishlakesturgeon_01_lg'] = { 
        label = 'Lake Sturgeon (Large)',                       
        weight = 1.0,  
        remove = 1, 
        description = 'Fish', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_fishlargemouthbass_01_lg'] = { 
        label = 'Large Mouth Bass (Large)',                       
        weight = 1.0,  
        remove = 1, 
        description = 'Fish', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_fishlargemouthbass_01_ms'] = { 
        label = 'Large Mouth Bass (Medium)',                       
        weight = 0.5,  
        remove = 1, 
        description = 'Fish', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_fishlongnosegar_01_lg'] = { 
        label = 'Long Nose Gar (Large)',                       
        weight = 1.0,  
        remove = 1, 
        description = 'Fish', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_fishmuskie_01_lg'] = { 
        label = 'Muskie (Large)',                       
        weight = 1.0,  
        remove = 1, 
        description = 'Fish', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_fishnorthernpike_01_lg'] = { 
        label = 'Northern Pike (Large)',                       
        weight = 1.0,  
        remove = 1, 
        description = 'Fish', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_fishperch_01_ms'] = { 
        label = 'Perch (Medium)',                       
        weight = 0.5,  
        remove = 1, 
        description = 'Fish', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_fishperch_01_sm'] = { 
        label = 'Perch (Small)',                       
        weight = 0.3,  
        remove = 1, 
        description = 'Fish', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_fishrainbowtrout_01_lg'] = { 
        label = 'Rainbow Trout (Large)',                       
        weight = 1.0,  
        remove = 1, 
        description = 'Fish', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_fishrainbowtrout_01_ms'] = { 
        label = 'Rainbow Trout (Medium)',                       
        weight = 0.5,  
        remove = 1, 
        description = 'Fish', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_fishredfinpickerel_01_ms'] = { 
        label = 'Red Fin Pickerel (Medium)',                       
        weight = 0.5,  
        remove = 1, 
        description = 'Fish', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_fishredfinpickerel_01_sm'] = { 
        label = 'Red Fin Pickerel (Small)',                       
        weight = 0.3,  
        remove = 1, 
        description = 'Fish', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_fishrockbass_01_ms'] = { 
        label = 'Rock Bass (Medium)',                       
        weight = 0.5,  
        remove = 1, 
        description = 'Fish', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_fishrockbass_01_sm'] = { 
        label = 'Rock Bass (Small)',                       
        weight = 0.3,  
        remove = 1, 
        description = 'Fish', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_fishsalmonsockeye_01_lg'] = { 
        label = 'Salmon Sockeye (Large)',                       
        weight = 1.0,  
        remove = 1, 
        description = 'Fish', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_fishsalmonsockeye_01_ml'] = { 
        label = 'Salmon Sockeye (Medium-Large)',                       
        weight = 0.7,  
        remove = 1, 
        description = 'Fish', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_fishsalmonsockeye_01_ms'] = { 
        label = 'Salmon Sockeye (Medium)',                       
        weight = 0.5,  
        remove = 1, 
        description = 'Fish', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_fishsmallmouthbass_01_lg'] = { 
        label = 'Small Mouth Bass (Large)',                       
        weight = 1.0,  
        remove = 1, 
        description = 'Fish', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_fishsmallmouthbass_01_ms'] = { 
        label = 'Small Mouth Bass (Medium)',                       
        weight = 0.5,  
        remove = 1, 
        description = 'Fish', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    -- FARMING GENERAL ITEMS
    ['fertilizer'] = { 
        label = 'Fertilizer',                       
        weight = 1.0,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['wateringcan'] = { 
        label = 'Water Bucket',                       
        weight = 1.0,  
        remove = 0, 
        description = 'nothing', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['p_scarecrow01x'] = { 
        label = 'Scarecrow #1',                       
        weight = 1.0,  
        remove = 0, 
        description = 'nothing', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['p_scarecrow03x'] = { 
        label = 'Scarecrow #2',                       
        weight = 1.0,  
        remove = 0, 
        description = 'nothing', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['p_scarecrow04x'] = { 
        label = 'Scarecrow #4',                       
        weight = 1.0,  
        remove = 0, 
        description = 'nothing', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['p_scarecrow05x'] = { 
        label = 'Scarecrow #5',                       
        weight = 1.0,  
        remove = 0, 
        description = 'nothing', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['p_scarecrow06'] = { 
        label = 'Scarecrow #6',                       
        weight = 1.0,  
        remove = 0, 
        description = 'nothing', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    -- FARMING SEEDS

    ['seeds_tomato'] = { 
        label = 'Tomato Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['seeds_peach'] = { 
        label = 'Peach Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['seeds_apple'] = { 
        label = 'Apple Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['seeds_cocoa'] = { 
        label = 'Cocoa Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['seeds_potato'] = { 
        label = 'Potato Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['seeds_corn'] = { 
        label = 'Corn Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['seeds_yarrow'] = { 
        label = 'Yarrow Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['seeds_wintergreen_berry'] = { 
        label = 'Wintergreen Berry Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['seeds_wild_mint'] = { 
        label = 'Wild Mint Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['seeds_wild_carrot'] = { 
        label = 'Wild Carrot Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['seeds_red_sage'] = { 
        label = 'Red Sage Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['seeds_red_raspberry'] = { 
        label = 'Red Raspberry Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['seeds_prairie_poppy'] = { 
        label = 'Prairie Poppy Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['seeds_parasol_mushroom'] = { 
        label = 'Parasol Mushroom Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['seeds_oregano'] = { 
        label = 'Oregano Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['seeds_oleander_sage'] = { 
        label = 'Oleander Sage Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['seeds_milk_weed'] = { 
        label = 'Milk Weed Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['seeds_indian_tobacco'] = { 
        label = 'Indian Tobacco Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['seeds_tobacco'] = { 
        label = 'Tobacco Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['seeds_english_mace'] = { 
        label = 'English Mace Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['seeds_crows_garlic'] = { 
        label = 'Crows Garlic Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['seeds_creeking_thyme'] = { 
        label = 'Creeking Thyme Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['seeds_creekplum'] = { 
        label = 'Creekplum Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['seeds_choc_daisy'] = { 
        label = 'Choc Daisy Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['seeds_blood_flower'] = { 
        label = 'Blood Flower Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['seeds_black_currant'] = { 
        label = 'Black Currant Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['seeds_black_berry'] = { 
        label = 'Black Berry Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['seeds_hop'] = { 
        label = 'Hop Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['seeds_american_ginseng'] = { 
        label = 'American Ginseng Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['seeds_alaskan_ginseng'] = { 
        label = 'Alaskan Ginseng Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['seeds_sugarcane'] = { 
        label = 'Sugarcane Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['seeds_wheat'] = { 
        label = 'Wheat Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['seeds_cannabis'] = { 
        label = 'Cannabis Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['seeds_bitter_weed'] = { 
        label = 'Bitter Weed Seeds',                       
        weight = 0.01,  
        remove = 0, 
        description = 'Seeds', 
        action = 'USABLE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    -- BEEKEEPING
    ['apiary_bee_house_gk_1'] = {
        label = 'Apiary',
        weight = 10.0,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['insect_medicine'] = {
        label = 'Insects Medicine',
        weight = 0.1,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['pipepeace'] = {
        label = 'Pipe Of Peace',
        weight = 0.5,
        remove = 0,
        description = 'nothing',
        action = 'SMOKABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['empty_jar'] = {
        label = 'Empty Jar',
        weight = 0.25,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['basic_bees'] = {
        label = 'Basic Bees Jar',
        weight = 0.4,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['basic_hornets'] = {
        label = 'Basic Hornets Jar',
        weight = 0.4,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['basic_hornet_queen'] = {
        label = 'Basic Hornet Queen Jar',
        weight = 0.3,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['basic_queen'] = {
        label = 'Basic Bee Queen Jar',
        weight = 0.3,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['wild_bees'] = {
        label = 'Wild Bees Jar',
        weight = 0.4,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['wild_queen'] = {
        label = 'Wild Bee Queen Jar',
        weight = 0.3,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['mexican_hornets'] = {
        label = 'Mexican Hornets Jar',
        weight = 0.4,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['mexican_hornet_queen'] = {
        label = 'Mexican Hornet Queen Jar',
        weight = 0.3,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['small_honey_jar'] = {
        label = 'Small Honey Jar',
        weight = 0.25,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['honey'] = {
        label = 'Honey',
        weight = 1.25,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['honeycomb'] = {
        label = 'Honey Comb',
        weight = 0.1,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['beeswax'] = {
        label = 'Beeswax',
        weight = 0.1,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    -- ANIMALS RELATED
    ['feathers'] = {
        label = 'Feathers',
        weight = 0.01,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['heart_bear'] = {
        label = 'Bear Heart',
        weight = 1.0,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['heart_wolf'] = {
        label = 'Wolf Heart',
        weight = 0.3,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['pelt'] = {
        label = 'Animal Pelt',
        weight = 0.5,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['fur'] = {
        label = 'Animal Fur',
        weight = 0.2,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['fibers'] = {
        label = 'Animal Fibers',
        weight = 0.0,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['fabric'] = {
        label = 'Fabric',
        weight = 0.0,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['leather'] = {
        label = 'Leather',
        weight = 0.0,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['snake_skin'] = {
        label = 'Snake Skin',
        weight = 0.1,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['snake_poison'] = {
        label = 'Snake Poison',
        weight = 0.1,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    -- PASSPORTS
    ['identitycard'] = {
        label = 'Identity Card',
        weight = 0.0,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 0,
        droppable = 1,
        closeInventory = 0
    },
    -- MYDOG
    ['mydog_snacks'] = {
        label = 'Doggie Snacks',
        weight = 0.0,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['vetsyringe'] = {
        label = 'Dogs Syringe',
        weight = 0.1,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 1
    },

    ['mydog_whistle'] = {
        label = 'Dog Whistle',
        weight = 0.0,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    -- OTHER
    ['crafting_book'] = {
        label = 'Crafting Book',
        weight = 1.0,
        remove = 0,
        description = 'Crafting Recipes',
        action = 'USABLE',
        stackable = 0,
        droppable = 1,
        closeInventory = 0
    },

    ['campfire'] = {
        label = 'Campfire',
        weight = 2.0,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['tent'] = {
        label = 'Tent',
        weight = 5.0,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['blueprint_tent'] = {
        label = 'Blueprint Tent',
        weight = 0.1,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },
    ['bowl'] = {
        label = 'Bowl',
        weight = 0.1,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['emptybottle'] = {
        label = 'Empty Bottle',
        weight = 0.25,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['nails'] = {
        label = 'Nails',
        weight = 0.2,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['wrench'] = {
        label = 'Wrench',
        weight = 0.3,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['ironhorseshoe'] = {
        label = 'Iron Horse Shoe',
        weight = 0.7,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['silverhorseshoe'] = {
        label = 'Silved Horse Shoe',
        weight = 1.0,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['goldhorseshoe'] = {
        label = 'Iron Horse Shoe',
        weight = 1.0,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['weapon_screws'] = {
        label = 'Weapon Screw',
        weight = 0.01,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['weapon_spring'] = {
        label = 'Weapon Spring',
        weight = 0.01,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['weapon_trigger'] = {
        label = 'Weapon Trigger',
        weight = 0.01,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['p_ambpack01x'] = {
        label = 'Backpack',
        weight = 1.0,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['p_ambpack02x'] = {
        label = 'Backpack',
        weight = 1.0,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['p_ambpack04x'] = {
        label = 'Backpack',
        weight = 1.0,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['p_ambpack05x'] = {
        label = 'Backpack',
        weight = 1.0,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['p_bag01x'] = {
        label = 'Leather Handbag',
        weight = 1.0,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['p_cs_bagstrauss01x'] = {
        label = 'Handbag',
        weight = 1.0,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['p_cs_baganders01x'] = {
        label = 'Handbag',
        weight = 1.0,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['lock'] = {
        label = 'Master Lock',
        weight = 0.3,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['lockpick'] = {
        label = 'Lockpick Tool',
        weight = 0.1,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['hardlockpick'] = {
        label = 'Advanced Lockpick Tool',
        weight = 0.1,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['bigchest'] = {
        label = 'Big Chest',
        weight = 2.0,
        remove = 0,
        description = 'Storage Chest',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['handcuffs'] = { 
        label = 'Handcuffs', 
        weight = 0.5,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0 
    },

    ['handcuff_keys'] = {
        label = 'Handcuff Keys',
        weight = 0.1,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 0,
        droppable = 1,
        closeInventory = 0
    },

    ['detective_kit'] = { 
        label = "Detective's Kit",
        weight = 1.0,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 0,
        droppable = 1,
        closeInventory = 0 
    },
}

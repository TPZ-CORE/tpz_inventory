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

    ['butter'] = {
        label = 'Butter',
        weight = 0.01,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 1
    },

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
        action = 'USABLE', -- USABLE FOR HORSES
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
        action = 'USABLE', -- USABLE FOR HORSES
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['opium'] = {
        label = 'Opium',
        weight = 0.1,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['drug_mushroom'] = {
        label = 'Mushroom Drug',
        weight = 0.1,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['drug_joint'] = {
        label = 'Mushroom Drug',
        weight = 0.1,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['indian_tobacco'] = { 
        label = 'Indian Tobacco Leafs',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['tobacco'] = { 
        label = 'Tobacco Leafs',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['milk_weed'] = { 
        label = 'Milk Weed',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['alaskan_ginseng'] = { 
        label = 'Alaskan Ginseng',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['wild_mint'] = { 
        label = 'Wild Mint',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['creekplum'] = { 
        label = 'Creekplum',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['creeking_thyme'] = { 
        label = 'Creeking Thyme',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['oregano'] = { 
        label = 'Oregano',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['chanterelles'] = { 
        label = 'Chanterelles',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['agarita'] = { 
        label = 'Agarita',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['hummingbird_sage'] = { 
        label = 'Hummingbird Sage',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['prairie_poppy'] = { 
        label = 'Prairie Poppy',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['black_berry'] = { 
        label = 'Black Berry',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['violet_snowdrop'] = { 
        label = 'Violet Snowdrop',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['red_raspberry'] = { 
        label = 'Red Raspberry',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['yarrow'] = { 
        label = 'Yarrow',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['wild_rhubarb'] = { 
        label = 'Wild Rhubarb',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['english_mace'] = { 
        label = 'English Mace',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['bulrush'] = { 
        label = 'Bulrush',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['cardinal_flower'] = { 
        label = 'Cardinal Flower',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['wintergreen_berry'] = { 
        label = 'Wintergreen Berry',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['blood_flower'] = { 
        label = 'Blood Flower',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['rams_head'] = { 
        label = 'Rams Head',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['wisteria'] = { 
        label = 'Wisteria',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['red_sage'] = { 
        label = 'Red Sage',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['bay_bolete'] = { 
        label = 'Bay Bolete',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['evergreen_huckleberry'] = { 
        label = 'Evergreen Huckleberry',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['harrietum_officinalis'] = { 
        label = 'Harrietum Officinalis',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['bitter_weed'] = { 
        label = 'Bitter Weed',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['wild_feverfew'] = { 
        label = 'Wild Feverfew',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['parasol_mushroom'] = { 
        label = 'Parasol Mushroom',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['american_ginseng'] = { 
        label = 'American Ginseng',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['choc_daisy'] = { 
        label = 'Choc Daisy',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['oleander_sage'] = { 
        label = 'Oleander Sage',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['desert_sage'] = { 
        label = 'Desert Sage',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },
    
    ['golden_currant'] = { 
        label = 'Golden Currant',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['black_currant'] = { 
        label = 'Black Currant',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['texas_bonnet'] = { 
        label = 'Texas Bonnet',                       
        weight = 0.01,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['leaf'] = { 
        label = 'Leafs',                       
        weight = 0.0,  
        remove = 0, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 1, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['flour'] = {
        label = 'Flour',                       
        weight = 0.3,  
        remove = 0, 
        description = 'nothing', 
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
    ['oilbottle'] = {
        label = 'Bottle Of Oil',
        weight = 0.3,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

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

    -- ANIMAL MODELS (ANIMAL MODELS BY DEFAULT ARE NOT USABLE ITEMS, THEY ARE MOSTLY FOR CRAFTING RECIPES OR SELLING TO BUTCHER?)

    -- start of frogs

    ['a_c_toad_01'] = { 
        label = 'Toad',                       
        weight = 0.2,  
        remove = 1, 
        description = 'Amphibia', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_toad_01-0'] = { 
        label = 'Toad',                       
        weight = 0.2,  
        remove = 1, 
        description = 'Amphibia', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_toad_01-1'] = { 
        label = 'Poisonous Toad',                       
        weight = 0.2,  
        remove = 1, 
        description = 'Amphibia', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_frogbull_01'] = { 
        label = 'Frogbull',                       
        weight = 0.2,  
        remove = 1, 
        description = 'Amphibia', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_frogbull_01-0'] = { 
        label = 'Frogbull',                       
        weight = 0.2,  
        remove = 1, 
        description = 'Amphibia', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_frogbull_01-1'] = { 
        label = 'Poisonous Frogbull',                       
        weight = 0.2,  
        remove = 1, 
        description = 'Amphibia', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    }, -- end of frogs

    -- start of snakes

    ['a_c_snake_01'] = { 
        label = 'Diamondback Rattlesnake',                       
        weight = 1.2,  
        remove = 1, 
        description = 'Reptile', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_snake_01-0'] = { 
        label = 'Diamondback Rattlesnake',                       
        weight = 1.2,  
        remove = 1, 
        description = 'Reptile', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    
    ['a_c_snake_01-1'] = { 
        label = 'Diamondback Rattlesnake',                       
        weight = 1.2,  
        remove = 1, 
        description = 'Reptile', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_snake_01-2'] = { 
        label = 'Timber Rattlesnake',                       
        weight = 1.2,  
        remove = 1, 
        description = 'Reptile', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_snakewater_01'] = { 
        label = 'Midland Water Snake',                       
        weight = 0.3,  
        remove = 1, 
        description = 'Reptile', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },


    ['a_c_snakewater_01-0'] = { 
        label = 'Midland Water Snake',                       
        weight = 0.3,  
        remove = 1, 
        description = 'Reptile', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_snakewater_01-1'] = { 
        label = 'Cottonmouth Water Snake',                       
        weight = 0.3,  
        remove = 1, 
        description = 'Reptile', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    
    ['a_c_snakewater_01-2'] = { 
        label = 'Northern Water Snake',                       
        weight = 0.3,  
        remove = 1, 
        description = 'Reptile', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_snakewater_01-2'] = { 
        label = 'Northern Water Snake',                       
        weight = 0.3,  
        remove = 1, 
        description = 'Reptile', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_snakewater_01-2'] = { 
        label = 'Northern Water Snake',                       
        weight = 0.3,  
        remove = 1, 
        description = 'Reptile', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_snakeredboa_01'] = { 
        label = 'Red Tailed Boa',                       
        weight = 4.0,  
        remove = 1, 
        description = 'Reptile', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_snakeredboa_01-0'] = { 
        label = 'Red Tailed Boa',                       
        weight = 4.0,  
        remove = 1, 
        description = 'Reptile', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },
    
    ['a_c_snakeredboa_01-1'] = { 
        label = 'Sunglow Boa',                       
        weight = 4.0,  
        remove = 1, 
        description = 'Reptile', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_snakeredboa_01-2'] = { 
        label = 'Rainbow Boa',                       
        weight = 4.0,  
        remove = 1, 
        description = 'Reptile', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_snakeferdelance_01'] = { 
        label = 'Fer-de-lance Copperhead Snake',                       
        weight = 0.3,  
        remove = 1, 
        description = 'Reptile', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_snakeferdelance_01-0'] = { 
        label = 'Fer-de-lance Copperhead Snake',                       
        weight = 0.3,  
        remove = 1, 
        description = 'Reptile', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_snakeferdelance_01-1'] = { 
        label = 'Southern Copperhead Snake',                       
        weight = 0.3,  
        remove = 1, 
        description = 'Reptile', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_snakeferdelance_01-2'] = { 
        label = 'Northern Copperhead Snake',                       
        weight = 0.3,  
        remove = 1, 
        description = 'Reptile', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_snakeblacktailrattle_01'] = { 
        label = 'Black-Tailed Rattlesnake',                       
        weight = 3.0,  
        remove = 1, 
        description = 'Reptile', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_snakeblacktailrattle_01-0'] = { 
        label = 'Black-Tailed Rattlesnake',                       
        weight = 3.0,  
        remove = 1, 
        description = 'Reptile', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_snakeblacktailrattle_01-1'] = { 
        label = 'Black-Tailed Rattlesnake',                       
        weight = 3.0,    
        remove = 1, 
        description = 'Reptile', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    }, -- end of snakes

    -- start of mammals.

    ['a_c_squirrel_01'] = { 
        label = 'Gray Squirrel',                       
        weight = 0.3,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_squirrel_01-0'] = { 
        label = 'Gray Squirrel',                       
        weight = 0.3,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_squirrel_01-1'] = { 
        label = 'Gray Squirrel',                       
        weight = 0.3,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_squirrel_01-2'] = { 
        label = 'Gray Squirrel',                       
        weight = 0.3,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_squirrel_01-3'] = { 
        label = 'Black Squirrel',                       
        weight = 0.3,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_squirrel_01-4'] = { 
        label = 'Red Squirrel',                       
        weight = 0.3,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_badger_01'] = { 
        label = 'Gray Badger',                       
        weight = 4.0,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_badger_01-0'] = { 
        label = 'Gray Badger',                       
        weight = 4.0,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_badger_01-1'] = { 
        label = 'American Badger',                       
        weight = 4.0,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    }, 

    ['a_c_possum_01'] = { 
        label = 'Opossum',                       
        weight = 1.5,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_possum_01-0'] = { 
        label = 'Opossum',                       
        weight = 1.5,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_possum_01-1'] = { 
        label = 'Opossum',                       
        weight = 1.5,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_possum_01-2'] = { 
        label = 'Opossum',                       
        weight = 1.5,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    }, 

    ['a_c_rabbit_01'] = { 
        label = 'Rabbit',                       
        weight = 1.5,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_rabbit_01-0'] = { 
        label = 'Rabbit',                       
        weight = 1.5,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_rabbit_01-1'] = { 
        label = 'Rabbit',                       
        weight = 1.2,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_rabbit_01-2'] = { 
        label = 'Rabbit',                       
        weight = 1.2,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_rabbit_01-3'] = { 
        label = 'Rabbit',                       
        weight = 1.2,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    }, 

    ['a_c_raccoon_01'] = { 
        label = 'Raccoon',                       
        weight = 4.0,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_raccoon_01-0'] = { 
        label = 'Raccoon',                       
        weight = 4.0,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_raccoon_01-1'] = { 
        label = 'Raccoon',                       
        weight = 4.0,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_raccoon_01-2'] = { 
        label = 'Raccoon',                       
        weight = 4.0,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_raccoon_01-3'] = { 
        label = 'Raccoon',                       
        weight = 4.0,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    }, 

    ['a_c_muskrat_01'] = { 
        label = 'American Muskrat',                       
        weight = 0.8,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_muskrat_01-0'] = { 
        label = 'American Muskrat',                       
        weight = 0.8,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },
    
    ['a_c_muskrat_01-1'] = { 
        label = 'American Muskrat',                       
        weight = 0.8,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    }, 
    ['a_c_skunk_01'] = { 
        label = 'Skunk',                       
        weight = 0.8,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },


    ['a_c_skunk_01-0'] = { 
        label = 'Skunk',                       
        weight = 0.8,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_skunk_01-0'] = { 
        label = 'Skunk',                       
        weight = 0.8,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_chipmunk_01'] = { 
        label = 'Chipmunk',                       
        weight = 0.6,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    }, 

    ['a_c_rat_01'] = { 
        label = 'Rat',                       
        weight = 0.4,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_rat_01-0'] = { 
        label = 'Rat',                       
        weight = 0.4,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_rat_01-1'] = { 
        label = 'Gray Rat',                       
        weight = 0.4,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    
    ['a_c_rat_01-2'] = { 
        label = 'Mangy Rat',                       
        weight = 0.4,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    
    ['a_c_rat_01-3'] = { 
        label = 'Brown Rat',                       
        weight = 0.4,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_rat_01-4'] = { 
        label = 'Black Rat',                       
        weight = 0.4,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    }, 

    ['a_c_armadillo_01'] = { 
        label = 'Armadillo',                       
        weight = 10.0,  
        remove = 1, 
        description = 'Mammals', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    }, 
    
    -- end of mammals

    -- start of Aves

    ['a_c_cedarwaxwing_01'] = { 
        label = 'Cedar Waxwing',                       
        weight = 0.032,  
        remove = 1, 
        description = 'Aves', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_cedarwaxwing_01-0'] = { 
        label = 'Cedar Waxwing',                       
        weight = 0.032,  
        remove = 1, 
        description = 'Aves', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_cedarwaxwing_01-1'] = { 
        label = 'Cedar Waxwing',                       
        weight = 0.032,  
        remove = 1, 
        description = 'Aves', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_cedarwaxwing_01-2'] = { 
        label = 'Cedar Waxwing',                       
        weight = 0.032,  
        remove = 1, 
        description = 'Aves', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_cardinal_01'] = { 
        label = 'Cardinal',                       
        weight = 0.032,  
        remove = 1, 
        description = 'Aves', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_cardinal_01-0'] = { 
        label = 'Cardinal',                       
        weight = 0.032,  
        remove = 1, 
        description = 'Aves', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_cardinal_01-1'] = { 
        label = 'Cardinal',                       
        weight = 0.032,  
        remove = 1, 
        description = 'Aves', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_cardinal_01-2'] = { 
        label = 'Cardinal',                       
        weight = 0.032,  
        remove = 1, 
        description = 'Aves', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_bluejay_01'] = { 
        label = 'Bluejay',                       
        weight = 0.032,  
        remove = 1, 
        description = 'Aves', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_bluejay_01-0'] = { 
        label = 'Bluejay',                       
        weight = 0.032,  
        remove = 1, 
        description = 'Aves', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_bluejay_01-1'] = { 
        label = 'Bluejay',                       
        weight = 0.032,  
        remove = 1, 
        description = 'Aves', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_carolinaparakeet_01'] = { 
        label = 'Carolina Parakeet',                       
        weight = 0.032,  
        remove = 1, 
        description = 'Aves', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_oriole_01'] = { 
        label = 'Hooded Oriole',                       
        weight = 0.032,  
        remove = 1, 
        description = 'Aves', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_oriole_01-0'] = { 
        label = 'Hooded Oriole',                       
        weight = 0.032,  
        remove = 1, 
        description = 'Aves', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_oriole_01-1'] = { 
        label = 'Baltimore Oriole',                       
        weight = 0.032,  
        remove = 1, 
        description = 'Aves', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_pigeon'] = { 
        label = 'Pigeon',                       
        weight = 0.032,  
        remove = 1, 
        description = 'Aves', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_pigeon-0'] = { 
        label = 'Pigeon',                       
        weight = 0.032,  
        remove = 1, 
        description = 'Aves', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_robin_01'] = { 
        label = 'Robin',                       
        weight = 0.032,  
        remove = 1, 
        description = 'Aves', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_robin_01-0'] = { 
        label = 'Robin',                       
        weight = 0.032,  
        remove = 1, 
        description = 'Aves', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_woodpecker_01'] = { 
        label = 'Woodpecker',                       
        weight = 0.1,  
        remove = 1, 
        description = 'Aves', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_woodpecker_01-0'] = { 
        label = 'Woodpecker',                       
        weight = 0.1,  
        remove = 1, 
        description = 'Aves', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_woodpecker_02'] = { 
        label = 'Woodpecker',                       
        weight = 0.1,  
        remove = 1, 
        description = 'Aves', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_woodpecker_02-0'] = { 
        label = 'Woodpecker',                       
        weight = 0.1,  
        remove = 1, 
        description = 'Aves', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_sparrow_01'] = { 
        label = 'Sparrow',                       
        weight = 0.1,  
        remove = 1, 
        description = 'Aves', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_sparrow_01-0'] = { 
        label = 'Sparrow',                       
        weight = 0.03,  
        remove = 1, 
        description = 'Aves', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_sparrow_01-1'] = { 
        label = 'Sparrow',                       
        weight = 0.03,  
        remove = 1, 
        description = 'Aves', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_sparrow_01-2'] = { 
        label = 'Sparrow',                       
        weight = 0.03,  
        remove = 1, 
        description = 'Aves', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_songbird_01'] = { 
        label = 'Songbird',                       
        weight = 0.1,  
        remove = 1, 
        description = 'Aves', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_songbird_01-0'] = { 
        label = 'Songbird',                       
        weight = 0.03,  
        remove = 1, 
        description = 'Aves', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_songbird_01-1'] = { 
        label = 'Songbird',                       
        weight = 0.03,  
        remove = 1, 
        description = 'Aves', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_crow_01'] = { 
        label = 'Crow',                       
        weight = 0.65,  
        remove = 1, 
        description = 'Aves', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['a_c_crow_01-0'] = { 
        label = 'Crow',                       
        weight = 0.65,  
        remove = 1, 
        description = 'Aves', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
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

    ['a_c_crawfish_01'] = { 
        label = 'Crawfish',                       
        weight = 0.2,  
        remove = 1, 
        description = 'nothing', 
        action = 'NONE', 
        stackable = 0, 
        droppable = 1, 
        closeInventory = 0 
    },

    ['fish_bone'] = { 
        label = 'Fish Bones',                       
        weight = 0.1,  
        remove = 1, 
        description = 'nothing', 
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

    -- TRAPS

    ['trap_crab'] = {
        label = 'Crabs Trap',
        weight = 1.0,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['trap_fish'] = {
        label = 'Fishes Trap',
        weight = 1.0,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['trap_bird'] = {
        label = 'Birds Trap',
        weight = 1.0,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['trap_smallanimal'] = {
        label = 'Small Animals Trap',
        weight = 1.0,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['trap_reptile'] = {
        label = 'Reptiles Trap',
        weight = 1.0,
        remove = 0,
        description = 'nothing',
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

    ['claws_bear'] = {
        label = 'Bear Claws',
        weight = 0.1,
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

    ['passport'] = {
        label = 'Passport',
        weight = 0.0,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 0, -- NOT STACKABLE, PASSPORT IS UNIQUE!
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

    
    -- Horses

    ['horse_adrenaline_shot'] = {
        label = "Horse Adrenaline Shot",
        weight = 0.3,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0 
    },

    ['unique_brad_horsesugar'] = {
        label = "Brad Horse Sugar",
        weight = 0.1,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0 
    },

    ['consumable_haycube'] = {
        label = "Horse Adrenaline Shot",
        weight = 0.1,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0 
    },

    ['horsemeal'] = {
        label = "Horse Adrenaline Shot",
        weight = 0.1,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0 
    },

    ['horsebrush'] = {
        label = "Horse Brush",
        weight = 0.3,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 0, -- BRUSH HAS DURABILITY FOR ITS USES BY DEFAULT
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
    
    ['wooden_nails'] = {
        label = 'Wooden Nails',
        weight = 0.05,
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

    ['regular_horseshoes'] = {
        label = 'Regular Horse Shoes',
        weight = 0.7,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['improved_horseshoes'] = {
        label = 'Improved Horse Shoes',
        weight = 1.0,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['premium_horseshoes'] = {
        label = 'Premium Horse Shoes',
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
        weight = 0.05,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['weapon_spring'] = {
        label = 'Weapon Spring',
        weight = 0.3,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['weapon_trigger'] = {
        label = 'Weapon Trigger',
        weight = 0.3,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['weapon_cylinder'] = {
        label = 'Weapon Cylinder',
        weight = 0.7,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['weapon_barrel'] = {
        label = 'Weapon Barrel',
        weight = 1.5,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['weapon_stock'] = {
        label = 'Weapon Stock',
        weight = 1.0,
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

    ['miner_hat'] = {
        label = "Miner's Hat",
        weight = 0.7,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0 
    },

    ['natives_arrow_pouch_bag'] = {
        label = "Natives Arrows Pouch Bag",
        weight = 0.7,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0 
    },

    ['natives_backshield'] = {
        label = "Natives Backshield",
        weight = 0.7,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0 
    },

    ['natives_chief_hat'] = {
        label = "Natives Chief Hat",
        weight = 0.7,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0 
    },

    ['headband1'] = {
        label = "Natives Headband #1",
        weight = 0.7,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0 
    },

    ['headband2'] = {
        label = "Natives Headband #2",
        weight = 0.7,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0 
    },

    ['headband3'] = {
        label = "Natives Headband #3",
        weight = 0.7,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0 
    },

    ['headband4'] = {
        label = "Natives Headband #4",
        weight = 0.7,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0 
    },

    ['headband5'] = {
        label = "Natives Headband #5",
        weight = 0.7,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0 
    },

    ['heaband6'] = {
        label = "Natives Headband #6",
        weight = 0.7,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0 
    },
    
    ['belt_lantern'] = {
        label = "Lantern Belt",
        weight = 0.7,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0 
    },

    ['pocket_watch'] = {
        label = "Pocket Watch",
        weight = 0.1,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0 
    },

    ['pocket_watch_silver'] = {
        label = "Silver Pocket Watch",
        weight = 0.2,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0 
    },

    ['pocket_watch_gold'] = {
        label = "Golden Pocket Watch",
        weight = 0.25,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0 
    },

    ['pocket_watch_platinum'] = {
        label = "Platinum Pocket Watch",
        weight = 0.30,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0 
    },

    ['pocket_watch_antique'] = {
        label = "Antique Pocket Watch",
        weight = 0.2,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0 
    },

    ['pocket_watch_reutlinger'] = {
        label = "Reutlinger Pocket Watch",
        weight = 0.25,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0 
    },

    ['hairpomade'] = {
        label = "Hair Pomade",
        weight = 0.1,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0 
    },

    ['cigarettepack'] = {
        label = "Cigarettes Pack",
        weight = 0.1,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0 
    },

    ['cigarette'] = {
        label = "Cigarette",
        weight = 0.01,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0 
    },

    ['pipepeace'] = {
        label = "Pipe Of Peace",
        weight = 0.2,
        remove = 0,
        description = 'nothing',
        action = 'USABLE', -- UNIQUE ITEM FOR HAVING DURABILITY ON ITS USE.
        stackable = 0,
        droppable = 1,
        closeInventory = 0 
    },

    ['pipe'] = {
        label = "Smoking Pipe",
        weight = 0.2,
        remove = 0,
        description = 'nothing',
        action = 'USABLE', -- UNIQUE ITEM FOR HAVING DURABILITY ON ITS USE.
        stackable = 0,
        droppable = 1,
        closeInventory = 0 
    },

    ['cigar'] = {
        label = "Cigar",
        weight = 0.1,
        remove = 0,
        description = 'nothing',
        action = 'USABLE',
        stackable = 0, -- UNIQUE ITEM FOR HAVING DURABILITY ON ITS USE.
        droppable = 1,
        closeInventory = 0 
    },

    ['matches'] = {
        label = "Matches",
        weight = 0.0,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0 
    },

    ['rollingpaper'] = {
        label = "Rolling Paper",
        weight = 0.0,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0 
    },

    ['matches_box'] = {
        label = "Matches Box",
        weight = 0.1,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0 
    },

    ['warehousekeys'] = {
        label = 'Warehouse Keys',
        weight = 0.1,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 0,
        droppable = 1,
        closeInventory = 0
    },

    ['motelkeys'] = {
        label = 'Motel Keys',
        weight = 0.1,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 0,
        droppable = 1,
        closeInventory = 0
    },

    ['goldbracelet'] = {
        label = 'Golden Bracelet',
        weight = 0.05,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['goldnecklace'] = {
        label = 'Golden Necklace',
        weight = 0.15,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['goldring'] = {
        label = 'Golden Ring',
        weight = 0.1,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },
    
    ['goldtooth'] = {
        label = 'Golden Tooth',
        weight = 0.03,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },

    ['goldcoin'] = {
        label = 'Golden Coin',
        weight = 0.3,
        remove = 0,
        description = 'nothing',
        action = 'NONE',
        stackable = 1,
        droppable = 1,
        closeInventory = 0
    },
}

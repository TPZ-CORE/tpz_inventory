# TPZ-CORE Inventory

## Requirements

1. TPZ-Core: https://github.com/TPZ-CORE/tpz_core
2. TPZ-Characters: https://github.com/TPZ-CORE/tpz_characters

# Installation

1. When opening the zip file, open `tpz_inventory-main` directory folder and inside there will be another directory folder which is called as `tpz_inventory`, this directory folder is the one that should be exported to your resources (The folder which contains `fxmanifest.lua`).

2. Add `ensure tpz_inventory` after the **REQUIREMENTS** in the resources.cfg or server.cfg, depends where your scripts are located.

## Commands

@param [source] : The online Player ID

| Command                                        | Ace Permission                   | Description
|------------------------------------------------|----------------------------------|----------------------------------------------|
| additem [source] [itemName] [quantity]         | tpzcore.inventory.additem        | Gives an item quantity to the selected player source.            |
| addweapon [source] [weaponName] [serialNumber] | tpzcore.inventory.addweapon      | Gives a weapon to the selected player source.                    |
| clearinventory [source]                        | tpzcore.inventory.clearinventory | Clears all the inventory contents of the selected player source. |

- The ace permission: `tpzcore.all` Gives permissioms to all commands and actions (FOR ALL OFFICIAL PUBLISHED FREE SCRIPTS).

## Screenshot Displays

![image](https://github.com/TPZ-CORE/tpz_inventory/assets/152554963/aa7f9722-b340-44ee-953d-36dedaff863a)
![image](https://github.com/TPZ-CORE/tpz_inventory/assets/152554963/e496a663-aba9-42bd-98e2-eef67eb5e962)

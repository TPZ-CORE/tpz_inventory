# TPZ-CORE Inventory

## Requirements

1. TPZ-Core: https://github.com/TPZ-CORE/tpz_core
2. TPZ-Characters: https://github.com/TPZ-CORE/tpz_characters

# Installation

1. When opening the zip file, open `tpz_inventory-main` directory folder and inside there will be another directory folder which is called as `tpz_inventory`, this directory folder is the one that should be exported to your resources (The folder which contains `fxmanifest.lua`).

2. Add `ensure tpz_inventory` after the **REQUIREMENTS** in the resources.cfg or server.cfg, depends where your scripts are located.

## Commands

| Command                                         | Description
|-------------------------------------------------|------------------------------------------------------------------|
| /additem [source] [itemName] [quantity]         | Gives an item quantity to the selected player source.            |
| /addweapon [source] [weaponName] [serialNumber] | Gives a weapon to the selected player source.                    |
| /clearinventory [source]                        | Clears all the inventory contents of the selected player source. |

## Screenshot Displays

![image](https://github.com/TPZ-CORE/tpz_inventory/assets/152554963/aa7f9722-b340-44ee-953d-36dedaff863a)
![image](https://github.com/TPZ-CORE/tpz_inventory/assets/152554963/e496a663-aba9-42bd-98e2-eef67eb5e962)

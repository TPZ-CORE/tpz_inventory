function initMainInventoryHandlers(inventory){

    $.each(inventory, function (index, item) {

        // Item Hovering Displays.
        $('.item-' + item.item + "-" + item.itemId).hover(
            
            function () {

                if (item.type == "weapon"){

                    let serialDisplay = item.itemId == 'N/A' ? '' : "Serial Number: (" + item.itemId  + ")";

                    $("#main_inventory_hovered_weapon_serial_number").text(serialDisplay);
                }

                $("#main_inventory_hovered_item_label").text(item.label);

                if (item.description != null && item.description != "undefined" && item.description != "nothing"){
                    $("#main_inventory_hovered_item_description").text(item.description);
                }


            },
            function () {
                $("#main_inventory_hovered_weapon_serial_number").text(" ");
                $("#main_inventory_hovered_item_label").text(" ");
                $("#main_inventory_hovered_item_description").text(" ");
            }
        );

        // Item Draggable Actions

        if (HasSecondInventoryOpen){
            
            if (item.type != "money" && item.type != "blackmoney" && item.type != "gold"){

                if (item.usedType == undefined || item.usedType == null || item.usedType == 0){

                    $('.item-' + item.item + "-" + item.itemId).draggable({
                        helper: 'clone',
                        appendTo: 'body',
                        zIndex: 99999,
                        revert: 'invalid',
                        start: function (event, ui) {
        
                            FirstDraggedItemData = item;
                            SecondDraggedItemData = null;
        
                         //   $("#inventory").fadeOut();
                        },
                        stop: function () {
        
                            FirstDraggedItemData = item;
                            
                          //  $("#inventory").fadeIn();
                        }
                    });
                }
                    
            }
        }

        if (!HasSecondInventoryOpen) {

            // Item double clicking actions
            $('.item-' + item.item + "-" + item.itemId).dblclick(function(){

                if (item.type == "item") {
    
                    $.post("http://tpz_inventory/useItem", JSON.stringify({
                        item : item.item,
                        itemId : item.itemId,
                        type : item.type,
                        id : item.id,
                        quantity : item.quantity,
                        label : item.label,
                        weight : item.weight,
                        metadata : item.metadata,
                        durability : item.durability,
                        remove : item.remove,	
                        closeInventory : item.closeInventory,
                    }));
    
                }
                
                
            }); 
            
            // Dropdown Functions
            $('.item-' + item.item + "-" + item.itemId).data('item', item);

            var data = [];

            if (item.action != "NONE" && item.action != "currency"){
    
                if (item.type != "weapon"){
    
                    let actionText = Locales['ITEM_ACTION_' + item.action] != null ? Locales['ITEM_ACTION_' + item.action] : Locales['ITEM_ACTION_USABLE'];

                    data.push({
                        text: actionText,
                        action: function () {
                            $.post("http://tpz_inventory/useItem", JSON.stringify({
                                item : item.item,
                                itemId : item.itemId,
                                type : item.type,
                                id : item.id,
                                quantity : item.quantity,
                                label : item.label,
                                weight : item.weight,
                                metadata : item.metadata,
                                durability : item.durability,
                                remove : item.remove,	
                                closeInventory : item.closeInventory,
                            }));
                        }
                    });
    
                }else{
    
                    if (item.usedType == 0){

                        data.push({
                            text: Locales['WEAPON_ACTION_DEFAULT_EQUIP'],
                            action: function () {
        
                                $.post("http://tpz_inventory/equipWeapon", JSON.stringify({
                                    item : item.item,
                                    itemId : item.itemId,
                                    type : item.type,
                                    id : item.id,
                                    ammoType : item.ammoType,
                                    ammo : item.ammo,
                                    label : item.label,
                                    weight : item.weight,
                                    metadata : item.metadata,
                                    durability : item.durability,
                                    remove : item.remove,	
                                    closeInventory : item.closeInventory,
                                }));
                            }
                        });
    
                    }else{

                        data.push({
                            text: Locales['WEAPON_ACTION_DEFAULT_UNEQUIP'],
                            action: function () {
                                $.post("http://tpz_inventory/unequipWeapon", JSON.stringify({ }));
                            }
                        });

                        if (item.ammoType != null){
                            data.push({
                                text: Locales['SET_AMMO_TYPE'] + " | " + item.ammoTypeLabel,
                                action: function () {

                                    $.post("http://tpz_inventory/setAmmoType", JSON.stringify({ item : item.item, itemId : item.itemId, metadata : item.metadata, usedType : item.usedType}));
                                }
                            });

                        }
                        

                    }
                }
            }
    
            if (item.usedType == 0){
                data.push({
                    text: Locales['ITEM_ACTION_GIVE'],
                    action: function () {
                        $.post("http://tpz_inventory/give", JSON.stringify({
                            item : item.item,
                            itemId : item.itemId,
                            type : item.type,
                            id : item.id,
                            quantity : item.quantity,
                            label : item.label,
                            weight : item.weight,
                            metadata : item.metadata,
                            durability : item.durability,
                            remove : item.remove,
                        }));

                    }
                });
            }
    
            if (item.droppable == 1 && item.usedType == 0 ) {
                data.push({
                    text: Locales['ITEM_ACTION_DROP'],
                    action: function () {
                        $.post("http://tpz_inventory/drop", JSON.stringify({
                            item : item.item,
                            itemId : item.itemId,
                            type : item.type,
                            id : item.id,
                            quantity : item.quantity,
                            label : item.label,
                            weight : item.weight,
                            metadata : item.metadata,
                            durability : item.durability,
                            remove : item.remove,
                        }));
                    }
                });
            }
    
    
            $(".item-" + item.item + "-" + item.itemId).contextMenu([data], {
                offsetX: 1,
                offsetY: 1,
            });

        }

    });

    $('#second_inventory').droppable({
        drop: function (event, ui) {

            if (FirstDraggedItemData == null) { return; }

            if (FirstDraggedItemData.quantity == 1) { // Do not ask for a dialog prompt.

                $.post("http://tpz_inventory/nui:transferItem", JSON.stringify({
                    item : FirstDraggedItemData,
                    inventory : "main",
                    quantity : 1,
                }));

            }else{

                HasDialogOpen = true;

                //displayInventory(false);

                dialog.prompt({ title: Locales['TRANSFER'], button: Locales['ACCEPT'], required: true, input: { type: "number", autofocus: "true" },

                    validate: function (value) {
                        if (!value) {
                            dialog.close();
                            HasDialogOpen = false;
                            FirstDraggedItemData = null;
                            //displayInventory(true);
                            return;
                        }

                        if (!isInteger(value)) {
                            return;
                        }

                        if (!isValidating) {
                            //displayInventory(true);

                            processEventValidation();

                            $.post("http://tpz_inventory/nui:transferItem", JSON.stringify({
                                item : FirstDraggedItemData,
                                inventory : "main",
                                quantity : value,
                            }));

                            FirstDraggedItemData = null;
                            HasDialogOpen = false;
                            dialog.close();
                            
                        }
                    }
                });
            }
        }
    })
}
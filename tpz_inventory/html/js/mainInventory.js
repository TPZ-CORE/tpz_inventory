function initMainInventoryHandlers(inventory){

    $.each(inventory, function (index, item) {

        // Item Hovering Displays.
        $('.item-' + item.item + "-" + item.itemId).hover(
            
            function () {

                if (item.type == "weapon"){

                    let serialDisplay = item.itemId == 'N/A' ? '' : "Serial Number: (" + item.itemId  + ")";

                    $("#main_inventory_hovered_weapon_serial_number").text(serialDisplay);

                }else if (item.type == 'item' && item.itemId != 0 && item.itemId != 'N/A' && item.action != 'EATABLE') {

                    let serialDisplay = item.itemId == 'N/A' ? '' : "Item Id: (" + item.itemId  + ")";
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
            
            if (item.type != 'slot' && item.type != "money" && item.type != "blackmoney" && item.type != "gold"){

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

                    if (item.type == 'slot') {
                        actionText = Locales['ITEM_ACTION_USABLE_SLOT'];
                    }

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
                                action : item.action,

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

                        /*
                        if (item.ammoType != null){
                            data.push({
                                text: Locales['SET_AMMO_TYPE'] + " | " + item.ammoTypeLabel,
                                action: function () {

                                    $.post("http://tpz_inventory/setAmmoType", JSON.stringify({ item : item.item, itemId : item.itemId, metadata : item.metadata, usedType : item.usedType}));
                                }
                            });

                        }*/
                        

                    }
                }
            }
    
            if (item.usedType == 0 && item.type != 'slot'){
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

            if (item.action != 'NONE' && item.action != "currency" && item.type != 'slot') {
                data.push({
                    text: Locales['ITEM_ACTION_USABLE_SELECT_SLOT'],
                    action: function () {
                        
                        $.post("http://tpz_inventory/select_slot", JSON.stringify({
                            item: item.item,
                            itemId: item.itemId,
                            type: item.type,
                            id: item.id,
                            quantity: item.quantity,
                            label: item.label,
                            weight: item.weight,
                            metadata: item.metadata,
                            durability: item.durability,
                            remove: item.remove,
                            closeInventory: item.closeInventory,
                            action : item.action,
                            ammoType: item.ammoType,
                            ammo: item.ammo,
                        }));

                    }
                });
            }
    
            let selector = (item.type !== 'slot')
                ? `.item-${item.item}-${item.itemId}`
                : `.item-slot-${item.itemId}`;

            // Apply contextMenu once
            $(selector).contextMenu([data], {
                offsetX: 1,
                offsetY: 1,
            });

            if (item.itemId != null && item.itemId != 0) {

                data.push({
                    text: item.type != "weapon" ? Locales['COPY_ITEM_ID'] : Locales['COPY_WEAPON_SERIAL_NUMBER'],
                    action: function () {

                        let textToCopy = item.itemId; // or however you get it
                        let textarea = document.createElement("textarea");
                        textarea.value = textToCopy;
                        document.body.appendChild(textarea);

                        textarea.select();
                        document.execCommand("copy");

                        document.body.removeChild(textarea);

                    }
                });
            }
            
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



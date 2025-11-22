function initSecondInventoryHandlers(inventory){
    
    $.each(inventory, function (index, item) {
    
        // Item Hovering Displays
        $('.seconditem-' + item.item + "-" + item.itemId).hover(
            function () {

                if (item.type == "weapon") {

                    let serialDisplay = item.itemId == 'N/A' ? '' : "Serial Number: (" + item.itemId + ")";

                    $("#second_inventory_hovered_weapon_serial_number").text(serialDisplay);
               
                } else if (item.type == 'item' && item.itemId != 0 && item.itemId != 'N/A' && item.action != 'EATABLE') {

                    let serialDisplay = item.itemId == 'N/A' ? '' : "Item Id: (" + item.itemId + ")";
                    $("#second_inventory_hovered_weapon_serial_number").text(serialDisplay);
                }

                $("#second_inventory_hovered_item_label").text(item.label);

                if (item.description != null && item.description != "undefined" && item.description != "nothing") {
                    $("#second_inventory_hovered_item_description").text(item.description);
                }
                
            },
            function () {
                $("#second_inventory_hovered_weapon_serial_number").text(" ");
                $("#second_inventory_hovered_item_label").text(" ");
                $("#second_inventory_hovered_item_description").text(" ");
            }
        );

        // Item Draggable Actions

        $('.seconditem-' + item.item + "-" + item.itemId).draggable({
            helper: 'clone',
            appendTo: 'body',
            zIndex: 99999,
            revert: 'invalid',
            start: function (event, ui) {
    
                SecondDraggedItemData = item;
                FirstDraggedItemData = null;
    
              //  $("#second_inventory").fadeOut();
            },
            stop: function () {
    
                SecondDraggedItemData = item;
    
               // $("#second_inventory").fadeIn();
            }
        });
                    
    
    });

    // Item Droppable Actions
    $('#inventory').droppable({
        drop: function (event, ui) {
            
            if (SecondDraggedItemData == null) { return; }
    
            if (SecondDraggedItemData.quantity == 1) { // Do not ask for a dialog prompt.
    
                $.post("http://tpz_inventory/nui:transferItem", JSON.stringify({
                    item : SecondDraggedItemData,
                    inventory : "container",
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
                            SecondDraggedItemData = null;
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
                                item : SecondDraggedItemData,
                                inventory : "container",
                                quantity : value,
                            }));

                            SecondDraggedItemData = null;
                            
                            HasDialogOpen = false;
                            dialog.close();
                        }
                    }
                });
            }
    
        }
    })
    

}

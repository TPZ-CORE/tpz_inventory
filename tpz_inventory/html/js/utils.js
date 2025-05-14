let hiddenInventoryFunction = null;
let hiddenInventory         = false;
let isValidating            = false; // Block other validation event when a validation prompt is already processing

FirstDraggedItemData        = null;
SecondDraggedItemData       = null;

HasDialogOpen               = false;

HasSecondInventoryOpen      = false;

function processEventValidation(ms = 1000) {
    isValidating = true;
    const timer = setTimeout(() => {
        isValidating = false;
        clearTimeout(timer);
    }, ms)
}

function isInteger(n) {
    return n != "" && !isNaN(n) && Math.round(n) == n;
}
function isFloat(n){
    return Number(n) === n && n % 1 !== 0;
}

function displayInventory(cb){

    if (cb) {
        
        $("#inventory").fadeIn();
        $("#second_inventory").fadeIn();

        document.getElementById("inventory").style.visibility = "visible";
        document.getElementById("second_inventory").style.visibility = "visible";
    }else{

        $("#inventory").fadeOut();
        $("#second_inventory").fadeOut();

        document.getElementById("inventory").style.visibility = "hidden";
        document.getElementById("second_inventory").style.visibility = "hidden";
    }
}


function closePlayerInventory() {

	//dialog.removeDialogHolder();

	FirstDraggedItemData   = null;
	SecondDraggedItemData  = null;
	HasSecondInventoryOpen = false;
    
	$("#main_inventory_contents").html('');
	$("#second_inventory_contents").html('');

	document.getElementById("main_inventory_current_weight").innerHTML = "";
	document.getElementById("main_inventory_hovered_weapon_serial_number").innerHTML = " ";
	document.getElementById("main_inventory_hovered_item_label").innerHTML = " ";
	document.getElementById("main_inventory_hovered_item_description").innerHTML = " ";

    document.getElementById("second_inventory_current_weight").innerHTML = "";
	document.getElementById("second_inventory_hovered_weapon_serial_number").innerHTML = " ";
	document.getElementById("second_inventory_hovered_item_label").innerHTML = " ";
	document.getElementById("second_inventory_hovered_item_description").innerHTML = " ";

    $.post("http://tpz_inventory/closePlayerInventory", JSON.stringify({}));

}


function getItemIMG(item){
	return 'nui://tpz_inventory/html/img/items/' + item + '.png';
}
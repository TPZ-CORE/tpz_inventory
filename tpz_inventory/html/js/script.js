var ClickedCloseKey = false;

$("document").ready(function () {
	
	HasSecondInventoryOpen = false;

	$("#inventory").draggable();
	$("#second_inventory").draggable();

	document.body.style.display = "none";
	document.getElementById("second_inventory").style.display = 'none';
});

$(function() {
	window.addEventListener('message', function(event) {
		var item = event.data;


		if (item.action == "setPlayerInventoryState") {

			document.body.style.display = item.enable ? "block" : "none";

			if (item.enable){
				$("#inventory").fadeIn();
			}

			document.getElementById("inventory").style.display="block";

		}

		else if (item.action == 'setSecondInventoryState') {

			var display = item.enable ? "block" : "none";

			if (item.enable){

				$("#second_inventory").fadeIn();

				let weightDisplay = (item.maxWeight != -1) ? Number(item.weight).toFixed(2) + "/" + item.maxWeight + "KG" : Number(item.weight).toFixed(2) + "KG";
				$("#second_inventory_current_weight").text(weightDisplay);
			}
			
			document.getElementById("second_inventory").style.display = display;

			item.isAllowlisted ? $("#second_inventory_freezer_state").show() : $("#second_inventory_freezer_state").hide();
			
			
		} 
		
		else if (item.action == 'updatePlayerInventoryWeight'){
			document.getElementById("main_inventory_current_weight").innerHTML = Number(event.data.weight).toFixed(2) + "/" + event.data.maxWeight;
		}

		else if (item.action == 'updateContainerInventoryWeight'){

			let weightDisplay = (item.maxWeight != -1) ? Number(item.weight).toFixed(2) + "/" + item.maxWeight + "KG" : Number(item.weight).toFixed(2) + "KG";
			$("#second_inventory_current_weight").text(weightDisplay);
		}

		else if (item.action == 'updatePlayerSourceId'){
			document.getElementById("main_inventory_current_source_id").innerHTML = event.data.sourceId;
		}

		else if (item.action == 'clearPlayerInventoryContents'){
			$("#main_inventory_contents").html('');
			
		}

		else if (item.action == 'clearContainerInventoryContents'){
			$("#second_inventory_contents").html('');
		}

		else if (item.action == 'updateAccount') {
			var prod_item = event.data.item_data;
			

			if (prod_item.type == "0") {

				let money = Number($("#main_inventory_current_money").text().replace('$', ''));
				let new_money = money + Number(prod_item.transfer_quantity.toFixed(2));

				$("#main_inventory_current_money").text("$" + new_money);

			} else if (prod_item.type == "1") {

				let gold = Number($("#main_inventory_current_gold").text());
				let new_gold = gold + Number(prod_item.transfer_quantity.toFixed(2));

				$("#main_inventory_current_gold").text(new_gold);

			}
		
		}

		else if (item.action == 'updateSecondInventoryContents'){
			var prod_item = event.data.item_data;

			if (event.data.transfer_type != null){

				if (event.data.transfer_type == 'ADD'){

					if ($(".seconditem-" + prod_item.item + "-" + prod_item.itemId)[0]){

						let quantity = Number($(".seconditem-count-" + prod_item.item + "-" + prod_item.itemId).text()) + prod_item.transfer_quantity;
						
						$(".seconditem-count-" + prod_item.item + "-" + prod_item.itemId).text(quantity);
	
						return;
					}

					prod_item.quantity = prod_item.transfer_quantity;

				}else if (event.data.transfer_type == 'REMOVE') {

					let quantity = Number($(".seconditem-count-" + prod_item.item + "-" + prod_item.itemId).text()) - prod_item.transfer_quantity;

					if (quantity > 0){
						$(".seconditem-count-" + prod_item.item + "-" + prod_item.itemId).text(quantity);

					}else{

						$("#second_content-" + prod_item.item + "-" + prod_item.itemId).remove();
					}

					return;
				}
			}

			if (prod_item.type != "weapon") {


				if (prod_item.stackable == 0) {

					if (prod_item.durability != -1) {
						$("#second_inventory_contents").append(
							`<div id = "second_content-` + prod_item.item + "-" + prod_item.itemId + `" class = "seconditem-` + prod_item.item + "-" + prod_item.itemId + `"> ` +
							`<img id="second_inventory_item_image_display" src = "` + getItemIMG(prod_item.item) + `"></img>` + 
							`<div id="second_inventory_item_count" style = 'background-color: #9e7a4a; color: snow; font-weight: 100; font-size: 0.5vw; '>` + Number(prod_item.durability) + `%</div>`+
							`</div>`
						);
					}else{
						$("#second_inventory_contents").append(
							`<div id = "second_content-` + prod_item.item + "-" + prod_item.itemId + `" class = "seconditem-` + prod_item.item + "-" + prod_item.itemId + `"> ` +
							`<img id="second_inventory_item_image_display" src = "` + getItemIMG(prod_item.item) + `"></img>` + 
							`</div>`
						);
					}

				}else{
	
					$("#second_inventory_contents").append(
						`<div id = "second_content-` + prod_item.item + "-" + prod_item.itemId + `" class = "seconditem-` + prod_item.item + "-" + prod_item.itemId + `"> ` +
						`<img id = "second_inventory_item_image_display" src = "` + getItemIMG(prod_item.item) + `"></img>` + 
						`<div class = "seconditem-count-` + prod_item.item + "-" + prod_item.itemId + `" id="second_inventory_item_count">` + prod_item.quantity + `</div>`+
						`</div>`
					);
				}

			}else{
				var durability = prod_item.durability

				if (durability != -1){
		
					$("#second_inventory_contents").append(
						`<div id = "second_content-` + prod_item.item + "-" + prod_item.itemId + `" class = "seconditem-` + prod_item.item + "-" + prod_item.itemId + `"> ` +
						`<img id="second_inventory_item_image_display" src = "` + getItemIMG(prod_item.item) + `"></img>` + 
						`<div id="second_inventory_item_count" style = 'background-color: brown; color: snow; font-weight: 100; font-size: 0.5vw; '>` + durability + `%</div>`+
						`</div>`
					);

				}else {

					$("#second_inventory_contents").append(
						`<div id = "second_content-` + prod_item.item + "-" + prod_item.itemId + `" class = "seconditem-` + prod_item.item + "-" + prod_item.itemId + `"> ` +
						`<img id="second_inventory_item_image_display" src = "` + getItemIMG(prod_item.item) + `"></img>` + 
						`</div>`
					);

				}

			}

		}

		else if (item.action == 'updatePlayerInventoryContents'){

			var prod_item = event.data.item_data;

			if (prod_item.type != "money" && prod_item.type != "blackmoney" && prod_item.type != "gold" && prod_item.type != "kit_pouch_ammo") {

				if (event.data.transfer_type != null){

					if (event.data.transfer_type == 'ADD'){
	
						if ($(".item-" + prod_item.item + "-" + prod_item.itemId)[0]){
	
							let quantity = Number($(".item-count-" + prod_item.item + "-" + prod_item.itemId).text()) + prod_item.transfer_quantity;
							
							$(".item-count-" + prod_item.item + "-" + prod_item.itemId).text(quantity);
		
							return;
						}

						prod_item.quantity = prod_item.transfer_quantity;
	
					}else if (event.data.transfer_type == 'REMOVE') {
	
						let quantity = Number($(".item-count-" + prod_item.item + "-" + prod_item.itemId).text()) - prod_item.transfer_quantity;
	
						if (quantity > 0){
							$(".item-count-" + prod_item.item + "-" + prod_item.itemId).text(quantity);
	
						}else{

							$("#primary_content-" + prod_item.item + "-" + prod_item.itemId).remove();
						}
	
						return;
					}
				}
				
				if (prod_item.type != "weapon") {

					if (prod_item.stackable == 0) {

						if (prod_item.durability != -1) {
							$("#main_inventory_contents").append(
								`<div id = "primary_content-` + prod_item.item + "-" + prod_item.itemId + `" class = "item-` + prod_item.item + "-" + prod_item.itemId + `"> ` +
								`<img id="main_inventory_item_image_display" src = "` + getItemIMG(prod_item.item) + `"></img>` + 
								`<div id="main_inventory_item_count" style = 'background-color: #9e7a4a; color: snow; font-weight: 100; font-size: 0.5vw; '>` + Number(prod_item.durability) + `%</div>`+
								`</div>`
							);
						}else{
							$("#main_inventory_contents").append(
								`<div id = "primary_content-` + prod_item.item + "-" + prod_item.itemId + `" class = "item-` + prod_item.item + "-" + prod_item.itemId + `"> ` +
								`<img id="main_inventory_item_image_display" src = "` + getItemIMG(prod_item.item) + `"></img>` + 
								`</div>`
							);
						}

					}else{
		
						$("#main_inventory_contents").append(
							`<div id = "primary_content-` + prod_item.item + "-" + prod_item.itemId + `" class = "item-` + prod_item.item + "-" + prod_item.itemId + `"> ` +
							`<img id="main_inventory_item_image_display" src = "` + getItemIMG(prod_item.item) + `"></img>` + 
							`<div class = "item-count-` + prod_item.item + "-" + prod_item.itemId + `" id="main_inventory_item_count">` + prod_item.quantity + `</div>`+
							`</div>`
						);
					}

				}else{
					
					var durability = prod_item.durability
		
					if (durability != -1 ) {
						$("#main_inventory_contents").append(
							`<div id = "primary_content-` + prod_item.item + "-" + prod_item.itemId + `" class = "item-` + prod_item.item + "-" + prod_item.itemId + `"> ` +
							`<img id="main_inventory_item_image_display" src = "` + getItemIMG(prod_item.item) + `"></img>` + 
							`<div id="main_inventory_item_count" style = 'background-color: brown; color: snow; font-weight: 100; font-size: 0.5vw; '>` + durability + `%</div>`+
							`</div>`
						);

					}else {
						$("#main_inventory_contents").append(
							`<div id = "primary_content-` + prod_item.item + "-" + prod_item.itemId + `" class = "item-` + prod_item.item + "-" + prod_item.itemId + `"> ` +
							`<img id="main_inventory_item_image_display" src = "` + getItemIMG(prod_item.item) + `"></img>` + 
							`</div>`
						);
					}
				}
			}

			if (prod_item.type == "money" || prod_item.type == "blackmoney" || prod_item.type == "gold" || prod_item.type == "kit_pouch_ammo" ) {

				if (prod_item.type == "money") {
					document.getElementById("main_inventory_current_money").innerHTML = "$" + prod_item.quantity.toFixed(2);

				}else if (prod_item.type == "gold") {
					document.getElementById("main_inventory_current_gold").innerHTML = prod_item.quantity;
				}

				if (event.data.displayImage){
					$("#main_inventory_contents").append(
						`<div id = "primary_content"> ` +
						`<img class = "item-` + prod_item.item + "-" + prod_item.itemId +  `" id="main_inventory_item_image_display" src = "` + getItemIMG(prod_item.item) + `"></img>` + 
						`</div>`
					);
				}

			}

		}

		else if (item.action == 'setupSecondInventoryContents'){
			HasSecondInventoryOpen = true;
			
			var inventory = event.data.inventory;
			initSecondInventoryHandlers(inventory);
		}

		else if (item.action == 'setupPlayerInventoryContents'){
			var inventory = event.data.inventory;
			initMainInventoryHandlers(inventory);
		}

		else if (item.action == 'closePlayerInventory'){
			$("#inventory").fadeOut();
			$("#second_inventory").fadeOut();

			closePlayerInventory();

		}

		$("body").on("keyup", function (key) {
			if ( (key.which == 73 || key.which == 27) && ClickedCloseKey == false){

				if (HasDialogOpen) { return; }

				$("#inventory").fadeOut();
				$("#second_inventory").fadeOut();

				ClickedCloseKey = true;
				closePlayerInventory();

				setTimeout(()=> { ClickedCloseKey = false; },2000);
			}
		});

	});

});

/* Loading Locales */

const loadScript = (FILE_URL, async = true, type = "text/javascript") => {
	return new Promise((resolve, reject) => {
		try {
			const scriptEle = document.createElement("script");
			scriptEle.type = type;
			scriptEle.async = async;
			scriptEle.src =FILE_URL;
  
			scriptEle.addEventListener("load", (ev) => {
				resolve({ status: true });
			});
  
			scriptEle.addEventListener("error", (ev) => {
				reject({
					status: false,
					message: `Failed to load the script ${FILE_URL}`
				});
			});
  
			document.body.appendChild(scriptEle);
		} catch (error) {
			reject(error);
		}
	});
  };
  
loadScript("js/locales/locales-" + Config.Locale + ".js").then( data  => { 
	
}) .catch( err => { console.error(err); });


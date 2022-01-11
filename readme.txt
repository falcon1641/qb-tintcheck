Installation

1. look in the "images" folder and add that tintchecker.png to qb-inventory/html/images
2. go to qb-core and locate either your shared.lua or if you have a shared folder go to shared/items.lua and put the line below wherever you choose in that file.

['tintchecker'] 				 = {['name'] = 'tintchecker', 			  	  	['label'] = 'tintchecker', ['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'tintchecker.png', 				['unique'] = true,   	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Device used for checking legality of vehicle tint'},

3. Should be obvious but put qb-tintcheck in your resources and "ensure" either the folder or the resource.



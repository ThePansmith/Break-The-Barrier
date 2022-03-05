import mods.gregtech.recipe.RecipeMap;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.data.IData;
import scripts.CommonVars.makeShaped as makeShaped;

recipes.remove(<potionfingers:ring>);
makeShaped("basicring",<potionfingers:ring>.withTag({}),
	["D  ",
	 " G ",
	 "   "],
	{ D : <minecraft:diamond>,
	  G :<gregtech:meta_ring:41>,
	  });
	  
makeShaped("hastering",<potionfingers:ring:1>.withTag({effect: "minecraft:haste"}),
	[" B ",
	 "BGB",
	 " B "],
	{ B : <gregtech:meta_plate_double:260>,
	  G : <potionfingers:ring>.withTag({}),
	  });
	  

makeShaped("jumpring",<potionfingers:ring:1>.withTag({effect: "minecraft:jump_boost"}),
	[" B ",
	 "BGB",
	 " B "],
	{ B : <gregtech:meta_plate:287>,
	  G : <potionfingers:ring>.withTag({}),
	  });   
	  
makeShaped("nightvisionring",<potionfingers:ring:1>.withTag({effect: "minecraft:night_vision"}),
	[" B ",
	 "BGB",
	 " B "],
	{ B : <minecraft:golden_apple>,
	  G : <potionfingers:ring>.withTag({}),
	  });   
	  
	  
mods.jei.JEI.removeAndHide(<potionfingers:ring:1>.withTag({effect: "minecraft:resistance"}));
mods.jei.JEI.removeAndHide(<potionfingers:ring:1>.withTag({effect: "minecraft:strength"}));
mods.jei.JEI.removeAndHide(<potionfingers:ring:1>.withTag({effect: "minecraft:regeneration"}));
	 
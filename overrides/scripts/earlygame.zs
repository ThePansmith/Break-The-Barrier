import mods.gregtech.recipe.RecipeMap;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.data.IData;
import scripts.CommonVars.makeShaped as makeShaped;

// Wood pulp into chad
compressor.recipeBuilder().inputs([<gregtech:meta_item_1:2196>]).outputs([<gregtech:meta_item_1:2325>]).duration(100).EUt(10).buildAndRegister();

alloy.recipeBuilder().inputs([<minecraft:coal:1> * 16, <gregtech:meta_item_1:10197>]).outputs([<gregtech:meta_item_1:10184>]).duration(300).EUt(16).buildAndRegister();
compressor.recipeBuilder().inputs([<minecraft:coal:1> * 32]).outputs([<minecraft:diamond>]).duration(500).EUt(10).buildAndRegister();
recipes.addShapeless(<minecraft:dirt>, [<contenttweaker:worldgendirtblock>]);
makeShaped("Coal_boiler", <gregtech:machine:1>,
	["  ",
	 " S ",
	 "BFB"],
	{ F : <minecraft:furnace>,
	  B : <minecraft:brick_block>,
	  S : <contenttweaker:brokenboiler>
	  });

makeShaped("Wood_plank", <gregtech:meta_item_1:12196>,
	[" H ",
	 " P ",
	 " P "],
	{ H : <ore:gtceHardHammers>,
	  P : <ore:plankWood>
	  });
	  
makeShaped("stone_plank", <gregtech:meta_item_1:12328>,
	[" H ",
	 " P ",
	 " P "],
	{ H : <ore:gtceHardHammers>,
	  P : <ore:stone>
	  });
	  
makeShaped("woodstonedrilltip", <contenttweaker:woodstonedrilltip>,
	["WSW",
	 "WSW",
	 "SHS"],
	{ H : <ore:gtceHardHammers>,
	  W : <gregtech:meta_item_1:12196>,
	  S : <gregtech:meta_item_1:12328>
	  });

// Drill recipes will likely be temp until there are textures for the drill 
makeShaped("tieronedrill", <contenttweaker:tieronedrill>,
	["SCS",
	 "GFG",
	 " D "],
	{ D : <contenttweaker:woodstonedrilltip>,
	  F : <minecraft:furnace>,
	  S : <minecraft:stone>,
	  G : <gregtech:meta_item_2:26196>,
	  C : <ore:chestWood>
	  });

// Same here
makeShaped("tiertwodrill", <contenttweaker:tiertwodrill>,
	["SBS",
	 "PBP",
	 " D "],
	{ D : <gregtech:meta_item_2:8184>,
	  F : <gregtech:machine:2>,
	  S : <minecraft:stone_slab:4>,
	  P : <gregtech:fluid_pipe:1018>,
	  B : <minecraft:brick_block>
	  });



	  

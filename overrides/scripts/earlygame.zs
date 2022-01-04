import mods.gregtech.recipe.RecipeMap;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.data.IData;
import scripts.CommonVars.makeShaped as makeShaped;

// Wood pulp into chad
compressor.recipeBuilder().inputs([<gregtech:meta_dust:1617> * 2]).outputs([<gregtech:meta_dust:1618>]).duration(100).EUt(10).buildAndRegister();
alloy.recipeBuilder().inputs([<minecraft:coal:1> * 16, <gregtech:meta_ingot:335>]).outputs([<gregtech:meta_ingot:324>]).duration(300).EUt(16).buildAndRegister();
compressor.recipeBuilder().inputs([<minecraft:coal:1> * 32]).outputs([<minecraft:diamond>]).duration(500).EUt(10).buildAndRegister();
compressor.recipeBuilder().inputs([<minecraft:coal> * 32]).outputs([<minecraft:diamond>]).duration(500).EUt(10).buildAndRegister();
recipes.addShapeless(<minecraft:dirt>, [<contenttweaker:worldgendirtblock>]);
makeShaped("Coal_boiler", <gregtech:machine:1>,
	["  ",
	 " S ",
	 "BFB"],
	{ F : <minecraft:furnace>,
	  B : <minecraft:brick_block>,
	  S : <contenttweaker:brokenboiler>
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
	  G : <gregtech:fluid_pipe_small:1617>,
	  C : <ore:chestWood>
	  });

// Same here
makeShaped("tiertwodrill", <contenttweaker:tiertwodrill>,
	["SBS",
	 "PBP",
	 " D "],
	{ D : <gregtech:meta_tool_head_drill:324>,
	  S : <minecraft:stone_slab:4>,
	  P : <gregtech:fluid_pipe_tiny:260>,
	  B : <minecraft:brick_block>
	  });

makeShaped("PBFbricks", <gregtech:meta_item_1:351> * 8,
	["BBB",
	 "BMB",
	 "BBB"],
	{ B : <gregtech:meta_dust:2525>,
	  M : <gregtech:meta_item_1:348>
	  });

makeShaped("AGless Solar boiler", <gregtech:machine:3>,
	["GGG",
	 "III",
	 "PHP"],
	{ G : <minecraft:glass>,
	  I : <gregtech:meta_plate:51>,
	  P : <gregtech:fluid_pipe_small:260>,
	  H : <gregtech:steam_casing:1>,
	  });
	  
makeShaped("AGless HP Solar boiler", <gregtech:machine:4>,
	["GGG",
	 "III",
	 "PHP"],
	{ G : <minecraft:glass>,
	  I : <gregtech:meta_plate_double:51>,
	  P : <gregtech:fluid_pipe_small:324>,
	  H : <gregtech:steam_casing:3>,
	  });

// Reverting Silicon boule recipe
blast_furnace.recipeBuilder()
    .inputs(<gregtech:meta_dust:99> * 32,
			<gregtech:meta_dust_small:39>)
    .outputs(<gregtech:meta_item_1:361>)
    .property("temperature", 1000)
    .EUt(1080000)
	.duration(9000)	
    .buildAndRegister();



recipes.remove(<gregtech:meta_item_1:402>);
makeShaped("AGless goodboard recipe", <gregtech:meta_item_1:402>,
	["WWW",
	 "WBW",
	 "WWW"],
	{ W : <gregtech:wire_single:51>,
	  B : <gregtech:meta_item_1:382>,
	  });



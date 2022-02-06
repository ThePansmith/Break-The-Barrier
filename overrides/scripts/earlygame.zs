import mods.gregtech.recipe.RecipeMap;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.data.IData;
import scripts.CommonVars.makeShaped as makeShaped;

// Wood pulp into chad
compressor.recipeBuilder().inputs([<gregtech:meta_dust:1617> * 2]).outputs([<gregtech:meta_dust:1618>]).duration(100).EUt(10).buildAndRegister();

// Charcoal or coke into steel
// Coke is a bit faster, at the cost of itself taking longer to produce
// Same goes for wrought iron
alloy.recipeBuilder().inputs([<minecraft:coal:1> * 16, <minecraft:iron_ingot>]).outputs([<gregtech:meta_ingot:324>]).duration(200).EUt(10).buildAndRegister();
alloy.recipeBuilder().inputs([<gregtech:meta_gem:319> * 8, <minecraft:iron_ingot>]).outputs([<gregtech:meta_ingot:324>]).duration(150).EUt(8).buildAndRegister();
alloy.recipeBuilder().inputs([<minecraft:coal:1> * 10, <gregtech:meta_ingot:335>]).outputs([<gregtech:meta_ingot:324>]).duration(150).EUt(8).buildAndRegister();
alloy.recipeBuilder().inputs([<gregtech:meta_gem:319> * 6, <gregtech:meta_ingot:335>]).outputs([<gregtech:meta_ingot:324>]).duration(130).EUt(6).buildAndRegister();

//Spunch
alloy.recipeBuilder().inputs([<minecraft:sponge>, <minecraft:ghast_tear>]).outputs([<contenttweaker:spunchcube>]).duration(300).EUt(16).hidden().buildAndRegister();


//(Char)coal into diamond
compressor.recipeBuilder().inputs([<minecraft:coal:1> * 32]).outputs([<minecraft:diamond>]).duration(500).EUt(10).buildAndRegister();
compressor.recipeBuilder().inputs([<minecraft:coal> * 16]).outputs([<minecraft:diamond>]).duration(500).EUt(10).buildAndRegister();

//Conversion
recipes.addShapeless(<minecraft:dirt>, [<contenttweaker:worldgendirtblock>]);

// Sand into dust, dust into clay
hammer.recipeBuilder().inputs([<ore:sand>]).outputs([<exnihilocreatio:block_dust>]).duration(10).EUt(16).buildAndRegister();
chemreactor.recipeBuilder().inputs([<exnihilocreatio:block_dust>]).fluidInputs([<liquid:water> * 1000]).outputs([<minecraft:clay>]).duration(40).EUt(16).buildAndRegister();

// Various mana boosted fluid recipes
// Large chem recipes to come later
// Also mana buffed PE recipe
chemreactor.recipeBuilder().fluidInputs([<liquid:ethylene> * 200, <liquid:manasap> * 100]).fluidOutputs([<liquid:manainfusedethylene> * 100]) .duration(30).EUt(16).buildAndRegister();
mixer.recipeBuilder().inputs([<gregtech:meta_dust:32002> * 1]).fluidInputs([<liquid:plastic> * 100]).fluidOutputs([<liquid:manainfusedpe> * 100]) .duration(40).EUt(10).buildAndRegister();
chemreactor.recipeBuilder().fluidInputs([<liquid:oxygen> * 1000, <liquid:manainfusedethylene> * 144]).fluidOutputs([<liquid:plastic> * 360]) .duration(100).EUt(16).buildAndRegister();

// Replace T2LV circuit
circuit_assembler.findRecipe(16, [<metaitem:circuit_board.basic>, <metaitem:plate.integrated_logic_circuit>, <metaitem:wireFineCopper> * 2, <metaitem:boltTin> * 2, <metaitem:component.resistor> * 2, <metaitem:component.diode> * 2], [<liquid:tin> * 144]).remove();
circuit_assembler.findRecipe(16, [<metaitem:circuit_board.basic>, <metaitem:plate.integrated_logic_circuit>, <metaitem:wireFineCopper> * 2, <metaitem:boltTin> * 2, <metaitem:component.resistor> * 2, <metaitem:component.diode> * 2], [<liquid:soldering_alloy> * 72]).remove();
circuit_assembler.recipeBuilder().inputs([<metaitem:circuit_board.basic>, <metaitem:plate.integrated_logic_circuit>, <metaitem:component.resistor> * 2, <metaitem:component.diode> * 2, <metaitem:wireFineCopper> * 2, <gregtech:meta_bolt:32002> * 2]).fluidInputs([<liquid:fluidmanasteel> * 72]).outputs([<gregtech:meta_item_1:623> * 2])  .duration(320).EUt(16).buildAndRegister();

makeShaped("Coal_boiler", <gregtech:machine:1>,
	["   ",
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
	["SWS",
	 "SWS",
	 " F "],
	{ F : <ore:gemFlint>,
	  W : <ore:plankWood>,
	  S : <ore:stoneCobble>
	  });
	  
makeShaped("woodstonedrilltip2", <contenttweaker:woodstonedrilltip>,
	["SWS",
	 "SWS",
	 " F "],
	{ F : <ore:gemFlint>,
	  W : <ore:plankWood>,
	  S : <ore:stoneSmooth>
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
	 "PHP",
	 " D "],
	{ D : <gregtech:meta_tool_head_drill:51>,
	  S : <minecraft:stone_slab:4>,
	  P : <gregtech:meta_plate:324>,
	  B : <minecraft:brick_block>,
	  H : <gregtech:steam_casing:1>
	  });

// Same here
makeShaped("biomedrill", <contenttweaker:biomedrill>,
	["SBS",
	 "PHP",
	 " D "],
	{ D : <gregtech:meta_tool_head_drill:324>,
	  S : <gregtech:meta_plate_double:260>,
	  P : <gregtech:meta_plate:324>,
	  B : <gregtech:machine:1625>,
	  H : <ore:circuitBasic>
	  });
	  
makeShaped("PBFbricks", <gregtech:meta_item_1:351> * 8,
	["BBB",
	 "BMB",
	 "BBB"],
	{ B : <gregtech:meta_dust:2525>,
	  M : <gregtech:meta_item_1:348>
	  });

recipes.remove(<gregtech:machine:3>);
makeShaped("AGless Solar boiler", <gregtech:machine:3>,
	["GGG",
	 "III",
	 "PHP"],
	{ G : <minecraft:glass>,
	  I : <gregtech:meta_plate:51>,
	  P : <gregtech:fluid_pipe_small:260>,
	  H : <gregtech:steam_casing:1>,
	  });

recipes.remove(<gregtech:machine:4>);	
makeShaped("AGless HP Solar boiler", <gregtech:machine:4>,
	["GGG",
	 "III",
	 "PHP"],
	{ G : <minecraft:glass>,
	  I : <gregtech:meta_plate_double:51>,
	  P : <gregtech:fluid_pipe_small:324>,
	  H : <gregtech:steam_casing:3>,
	  });
	  
makeShaped("woodpipebad", <gregtech:fluid_pipe_small:1617> * 3,
	["W W",
	 "WHW",
	 "W W"],
	{ W : <ore:plankWood>,
	  H : <ore:craftingToolSoftHammer>
	  });
// Reverting Silicon boule recipe
blast_furnace.recipeBuilder()
    .inputs(<gregtech:meta_dust:99> * 32,
			<gregtech:meta_dust_small:39>)
    .outputs(<gregtech:meta_item_1:361>)
    .property("temperature", 1000)
    .EUt(1080000)
	.duration(9500)	
    .buildAndRegister();

recipes.remove(<gregtech:meta_item_1:402>);
makeShaped("AGless goodboard recipe", <gregtech:meta_item_1:402>,
	["WWW",
	 "WBW",
	 "WWW"],
	{ W : <gregtech:wire_single:51>,
	  B : <gregtech:meta_item_1:382>,
	  });

makeShaped("tierthreedrill", <contenttweaker:tierthreedrill>,
	["PLP",
	 " C ",
	 " D "],
	{ D : <gregtech:meta_tool_head_drill:324>,
	  C : <gregtech:meta_item_1:127>,
	  L : <gregtech:meta_item_1:621>,
	  P : <gregtech:meta_plate:51>
	  });

makeShaped("tierfourdrill", <contenttweaker:tierfourdrill>,
	["CLC",
	 " P ",
	 " D "],
	{ D : <gregtech:meta_tool_head_drill:324>,
	  C : <gregtech:meta_item_1:157>,
	  P : <gregtech:meta_item_1:142>,
	  L : <gregtech:meta_item_1:621>
	  });

makeShaped("tierfivedrill", <contenttweaker:tierfivedrill>,
	["CLC",
	 "MAM",
	 " D "],
	{ D : <gregtech:meta_tool_head_drill:2>,
	  C : <gregtech:meta_item_1:173>,
	  A : <gregtech:meta_item_1:81>,
	  M : <contenttweaker:dmanastone>,
	  L : <gregtech:machine:1627>
	  });

makeShaped("tiersixdrill", <contenttweaker:tiersixdrill>,
	["SPS",
	 "FPF",
	 " D "],
	{ D : <gregtech:meta_tool_head_drill:324>,
	  S : <gregtech:meta_item_1:233>,
	  G : <gregtech:meta_gear:214>,
	  P : <gregtech:meta_item_1:143>,
	  F : <gregtech:meta_plate:32002>
	  });
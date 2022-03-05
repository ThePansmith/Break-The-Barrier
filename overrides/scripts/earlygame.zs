import mods.gregtech.recipe.RecipeMap;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.data.IData;
import scripts.CommonVars.makeShaped as makeShaped;



// Wood pulp into chad
hammer.recipeBuilder().inputs([<gregtech:meta_dust:1617> * 3]).outputs([<gregtech:meta_dust:1618>]).duration(100).EUt(10).buildAndRegister();

// Charcoal or coke into steel
// Coke is a bit faster, at the cost of itself taking longer to produce
// Same goes for wrought iron
alloy.recipeBuilder().inputs([<minecraft:coal:1> * 8, <minecraft:iron_ingot>]).outputs([<gregtech:meta_ingot:324>]).duration(200).EUt(10).buildAndRegister();
alloy.recipeBuilder().inputs([<gregtech:meta_gem:319> * 4, <minecraft:iron_ingot>]).outputs([<gregtech:meta_ingot:324>]).duration(150).EUt(8).buildAndRegister();
alloy.recipeBuilder().inputs([<minecraft:coal:1> * 4, <gregtech:meta_ingot:335>]).outputs([<gregtech:meta_ingot:324>]).duration(150).EUt(8).buildAndRegister();
alloy.recipeBuilder().inputs([<gregtech:meta_gem:319> * 3, <gregtech:meta_ingot:335>]).outputs([<gregtech:meta_ingot:324>]).duration(130).EUt(6).buildAndRegister();

//Spunch
alloy.recipeBuilder().inputs([<minecraft:sponge>, <minecraft:ghast_tear>]).outputs([<contenttweaker:spunchcube>]).duration(300).EUt(16).hidden().buildAndRegister();


alloy.recipeBuilder().inputs([<gregtech:meta_ingot:2517>, <gregtech:meta_ingot:2>]).outputs([<gregtech:meta_ingot:32002> * 4]).duration(300).EUt(16).buildAndRegister();
// CEu devs forgor to add rubber planks as furance fuel
furnace.setFuel(<gregtech:planks>, 350);

// Hot iron creation
furnace.addRecipe(<contenttweaker:hotironingot>, <minecraft:iron_ingot>, 0.0);
//hot iron into wrought
hammer.recipeBuilder().inputs([<contenttweaker:hotironingot>]).outputs([<gregtech:meta_ingot:335>]).duration(100).EUt(16).buildAndRegister();

//Conversion
recipes.addShapeless(<minecraft:dirt>, [<contenttweaker:worldgendirtblock>]);

// Sand into dust, dust into clay
hammer.recipeBuilder().inputs([<contenttweaker:worldgenblock>]).outputs([<minecraft:cobblestone>]).duration(10).EUt(16).buildAndRegister();
hammer.recipeBuilder().inputs([<ore:sand>]).outputs([<exnihilocreatio:block_dust>]).duration(10).EUt(16).buildAndRegister();
chemreactor.recipeBuilder().inputs([<exnihilocreatio:block_dust>]).fluidInputs([<liquid:water> * 1000]).outputs([<minecraft:clay>]).duration(40).EUt(16).buildAndRegister();

//Clay to clay balls
recipes.addShapeless(<minecraft:clay_ball> * 4, [<minecraft:clay>]);

// Various mana boosted fluid recipes
// Large chem recipes to come later
// Also mana buffed PE recipe
chemreactor.recipeBuilder().fluidInputs([<liquid:oxygen> * 1000, <liquid:manainfusedethylene> * 144]).fluidOutputs([<liquid:plastic> * 360]) .duration(100).EUt(16).buildAndRegister();

// Replace T2LV circuit
circuit_assembler.findRecipe(16, [<metaitem:circuit_board.basic>, <metaitem:plate.integrated_logic_circuit>, <metaitem:wireFineCopper> * 2, <metaitem:boltTin> * 2, <metaitem:component.resistor> * 2, <metaitem:component.diode> * 2], [<liquid:tin> * 144]).remove();
circuit_assembler.findRecipe(16, [<metaitem:circuit_board.basic>, <metaitem:plate.integrated_logic_circuit>, <metaitem:wireFineCopper> * 2, <metaitem:boltTin> * 2, <metaitem:component.resistor> * 2, <metaitem:component.diode> * 2], [<liquid:soldering_alloy> * 72]).remove();
circuit_assembler.recipeBuilder().inputs([<metaitem:circuit_board.basic>, <metaitem:plate.integrated_logic_circuit>, <metaitem:component.resistor> * 2, <metaitem:component.diode> * 2, <metaitem:wireFineCopper> * 2, <gregtech:meta_bolt:32002> * 2]).fluidInputs([<liquid:soldering_alloy> * 72]).outputs([<gregtech:meta_item_1:623> * 2])  .duration(320).EUt(16).buildAndRegister();
circuit_assembler.recipeBuilder().inputs([<metaitem:circuit_board.basic>, <metaitem:plate.integrated_logic_circuit>, <metaitem:component.resistor> * 2, <metaitem:component.diode> * 2, <metaitem:wireFineCopper> * 2, <gregtech:meta_bolt:32002> * 2]).fluidInputs([<liquid:soldering_alloy> * 144]).outputs([<gregtech:meta_item_1:623> * 2])  .duration(320).EUt(16).buildAndRegister();

// Make soapstone recipe LV
// Will make mag require further processing to be usable to compensate 
<recipemap:electrolyzer>.findRecipe(60, [<metaitem:dustSoapstone> * 21], null).remove();
electrolyzer.recipeBuilder().inputs([<metaitem:dustSoapstone> * 21]).outputs([<gregtech:meta_dust:99> * 4, <gregtech:meta_dust:59> * 3]).fluidOutputs([<liquid:oxygen> * 12000, <liquid:hydrogen> * 2000]).duration(320).EUt(16).buildAndRegister();
makeShaped("Coal_boiler", <gregtech:machine:1>,
	["   ",
	 " S ",
	 "BFB"],
	{ F : <minecraft:furnace>,
	  B : <minecraft:brick_block>,
	  S : <contenttweaker:brokenboiler>
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
	  
recipes.remove(<gregtech:machine:1647>);
makeShaped("craftingstation", <gregtech:machine:1647>,
	["EPE",
	 "WCW",
	 "WSW"],
	{ C : <minecraft:crafting_table>,
	  P : <minecraft:wooden_pressure_plate>,
	  E : <ore:chestWood>,
	  W : <ore:plankWood>,
	  S : <ore:fixedcraftingToolSaw>
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
	  H : <ore:fixedcraftingToolSoftHammer>
	  });
// Reverting Silicon boule recipe
blast_furnace.recipeBuilder()
    .inputs(<gregtech:meta_dust:99> * 32,
			<gregtech:meta_dust_small:39>)
    .outputs(<gregtech:meta_item_1:361>)
    .property("temperature", 1000)
    .EUt(120)
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
	  M : <gregtech:meta_plate:2>,
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
	  
makeShaped("brickpipe", <gregtech:fluid_pipe_small:2524> * 6,
	["B B",
	 "BHB",
	 "B B"],
	{ B : <ore:ingotBrick>,
	  H : <ore:fixedcraftingToolSoftHammer>
	  });
	  
makeShaped("brickpipetiny", <gregtech:fluid_pipe_tiny:2524> * 8,
	["BBB",
	 " H ",
	 "BBB"],
	{ B : <ore:ingotBrick>,
	  H : <ore:fixedcraftingToolSoftHammer>
	  });
	  
recipes.addShapeless(<gregtech:meta_dust:2525> * 2, [<gregtech:meta_dust:2524>,<minecraft:clay_ball>]);
	  
makeShaped("brickmoldalt", <gregtech:meta_item_1:347>,
	[" H ",
	 " P ",
	 " P "],
	{ H : <ore:fixedcraftingToolSoftHammer>,
	  P : <ore:plankWood>
	  });
	  
recipes.addShapeless(<minecraft:flint>, [<minecraft:gravel>,<minecraft:gravel>,<minecraft:gravel>,<minecraft:gravel>]);

recipes.addShapeless(<metaitem:fluid_filter>, [<ore:fixedcraftingToolWrench>,<metaitem:item_filter>]);
recipes.addShapeless(<metaitem:ore_dictionary_filter>, [<ore:fixedcraftingToolWrench>,<metaitem:fluid_filter>]);
recipes.addShapeless(<metaitem:smart_item_filter>, [<ore:fixedcraftingToolWrench>,<metaitem:ore_dictionary_filter>]);
recipes.addShapeless(<metaitem:item_filter>, [<ore:fixedcraftingToolWrench>,<metaitem:smart_item_filter>]);

recipes.remove(<gregtech:machine:1024>);
makeShaped("steamoveninvarless", <gregtech:machine:1024>,
	["BGB",
	 "DFD",
	 "BGB"],
	{ F : <gregtech:machine:15>,
	  G : <gregtech:meta_gear:2037>,
	  B : <gregtech:metal_casing>,
	  D : <gregtech:boiler_firebox_casing>
	  });
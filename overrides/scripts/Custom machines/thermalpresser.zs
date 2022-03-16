#priority 998
import mods.gregtech.machine.MachineBuilder;
import mods.gregtech.recipe.RecipeMapBuilder;
import mods.gregtech.recipe.RecipeMaps;
import mods.gregtech.recipe.RecipeMap;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.data.IData;
import scripts.CommonVars.makeShaped as makeShaped;



// Thermal press
val thermalpress as RecipeMap = RecipeMapBuilder.create("thermalpresser")
    .setInputs(1, 1)
    .setOutputs(1)
    .setHidden(false)
    .build();
	
MachineBuilder.create(32104, "thermalpresser")
    .setRecipeMap(thermalpress)
    .setRenderer("machines/thermal_centrifuge")
	.addTierRange(1, 4)
    .addSteamTier(false)
    .addSteamTier(true)
    .buildAndRegister();


val thermalpressrecipe    as RecipeMap = RecipeMap.getByName("thermalpresser");

//(Char)coal into diamond
thermalpressrecipe.recipeBuilder().inputs([<minecraft:coal:1> * 32]).outputs([<minecraft:diamond>]).duration(500).EUt(10).buildAndRegister();
thermalpressrecipe.recipeBuilder().inputs([<minecraft:coal> * 16]).outputs([<minecraft:diamond>]).duration(500).EUt(10).buildAndRegister();
// Recipes
makeShaped("steamTP", <gregtech:machine:32104>,
	["BPB",
	 "BHB",
	 "BFB"],
	{ H : <gregtech:machine:11>,
	  F : <minecraft:furnace>,
	  B : <gregtech:fluid_pipe_small:260>, 
	  P : <ore:craftingPiston>
	  });
	  

makeShaped("steelTP", <gregtech:machine:32105>,
	["WSW",
	 "PTP",
	 "WPW"],
	{ S : <gregtech:meta_plate:324>,
	  W : <gregtech:meta_plate:335>,
	  P : <gregtech:fluid_pipe_small:335>, 
	  T : <gregtech:machine:32104>
	  });
	  
makeShaped("LVTP", <gregtech:machine:32107>,
	["PLP",
	 "CHC",
	 "TLT"],
	{ H : <gregtech:machine:986>,
	  P : <gregtech:meta_item_1:172>, 
	  C : <gregtech:wire_double:25>,
	  T : <gregtech:cable_single:112>,
	  L : <ore:circuitBasic>
	  });
	  
makeShaped("MVTP", <gregtech:machine:32108>,
	["PLP",
	 "CHC",
	 "TLT"],
	{ H : <gregtech:machine:987>,
	  P : <gregtech:meta_item_1:173>, 
	  C : <gregtech:wire_double:274>,
	  T : <gregtech:cable_single:25>,
	  L : <ore:circuitGood>
	  });

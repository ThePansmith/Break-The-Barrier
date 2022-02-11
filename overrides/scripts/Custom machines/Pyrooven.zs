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
val pyrooven as RecipeMap = RecipeMapBuilder.create("pyroovener")
    .setInputs(1, 1)
    .setOutputs(1)
    .setHidden(false)
    .build();
	
MachineBuilder.create(32011, "pyroovener")
    .setRecipeMap(pyrooven)
    .setRenderer("machines/thermal_centrifuge")
    .addSteamTier(false, true)
    .addSteamTier(true, true)
    .buildAndRegister();


val pyroovenrecipe    as RecipeMap = RecipeMap.getByName("pyroovener");

//Fast charcoal
pyroovenrecipe.recipeBuilder().inputs([<ore:logWood>]).outputs([<minecraft:coal:1>]).duration(75).EUt(10).buildAndRegister();

// Recipes
makeShaped("steamPO", <gregtech:machine:32011>,
	["BBB",
	 "BHB",
	 "FFF"],
	{ H : <gregtech:machine:15>,
	  F : <gregtech:metal_casing:8>,
	  B : <gregtech:fluid_pipe_small:260>, 
	  P : <ore:craftingPiston>
	  });
	  

makeShaped("steelPO", <gregtech:machine:32012>,
	["WSW",
	 "PTP",
	 "WPW"],
	{ S : <gregtech:meta_plate:324>,
	  W : <gregtech:meta_plate:335>,
	  P : <gregtech:fluid_pipe_small:335>, 
	  T : <gregtech:machine:32011>
	  });
#priority 998
import mods.gregtech.machine.MachineBuilder;
import mods.gregtech.recipe.RecipeMapBuilder;
import mods.gregtech.recipe.RecipeMaps;
import mods.gregtech.recipe.RecipeMap;



// creating a recipe map here
val thermalpress as RecipeMap = RecipeMapBuilder.create("thermalpresser")
    .setInputs(1, 1)
    .setOutputs(1)
    .setHidden(false)
    .build();
	
MachineBuilder.create(32004, "thermalpresser")
    .setRecipeMap(thermalpress)
    .setRenderer("machines/thermal_centrifuge")
	.addTierRange(1, 4)
    .addSteamTier(false)
    .addSteamTier(true)
    .buildAndRegister();
	
global thermalpress    as RecipeMap = RecipeMap.getByName("thermalpresser");
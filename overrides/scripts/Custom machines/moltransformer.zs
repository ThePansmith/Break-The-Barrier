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
val mtrm as RecipeMap = RecipeMapBuilder.create("mt")
    .setInputs(2)
    .setOutputs(1)
    .setHidden(false)
    .build();
	
MachineBuilder.create(32013, "mt")
    .setRecipeMap(mtrm)
    .setRenderer("machines/thermal_centrifuge")
	.addTierRange(2, 4)
    .buildAndRegister();


val mtrecipe    as RecipeMap = RecipeMap.getByName("mt");

// Conversion
mtrecipe.recipeBuilder().inputs([<gregtech:meta_gem:340>]).outputs([<minecraft:quartz>]).duration(100).EUt(40).buildAndRegister();
mtrecipe.recipeBuilder().inputs([<minecraft:quartz>]).outputs([<gregtech:meta_gem:340>]).duration(100).EUt(40).buildAndRegister();
mtrecipe.recipeBuilder().inputs([<gregtech:meta_gem:340>]).outputs([<gregtech:meta_gem:214>]).circuit(1).duration(100).EUt(2000).buildAndRegister();
// Recipes
	  	  
makeShaped("MVMT", <gregtech:machine:32017>,
	["PLA",
	 "CHC",
	 "TLT"],
	{ H : <gregtech:machine:987>,
	  P : <gregtech:meta_item_1:188>,
	  A : <gregtech:meta_item_1:233>, 
	  C : <gregtech:wire_double:274>,
	  T : <gregtech:cable_single:25>,
	  L : <ore:circuitGood>
	  });

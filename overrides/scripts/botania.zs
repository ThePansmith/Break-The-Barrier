import mods.gregtech.recipe.RecipeMap;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.data.IData;
import scripts.CommonVars.makeShaped as makeShaped;

chemical_bath.recipeBuilder().inputs(<minecraft:stone>).fluidInputs(<liquid:aluminium> * 72).outputs([<contenttweaker:dmanastone>]).duration(50).EUt(100).buildAndRegister();


recipes.remove(<botania:pool:2>);
recipes.remove(<botanicadds:mana_tesseract>);
makeShaped("dmanapool", <botania:pool:2>,
	["   ",
	 "D D",
	 "DDD"],
	{ D	: <contenttweaker:dmanastone>
	  });
	  
mods.botania.ManaInfusion.removeRecipe(<botania:manaresource>);
mods.botania.ManaInfusion.addInfusion(<botania:manaresource>, <gregtech:meta_ingot:324>, 3000);
mods.botania.ManaInfusion.addInfusion(<minecraft:quartz>, <gregtech:meta_gem:340>, 3000);


mods.botania.Apothecary.removeRecipe("endoflame");
recipes.remove(<botania:spark>);
makeShaped("spark", <botania:spark>,
	[" P ",
	 "GMG",
	 " P "],
	{ G	: <minecraft:gold_ingot>,
	  M : <ore:ingotManasteel>,
	  P : <gregtech:meta_item_1:439>
	  });
	  
makeShaped("sparkbetter", <botania:spark> * 2,
	[" P ",
	 "GMG",
	 " P "],
	{ G	: <minecraft:blaze_powder>,
	  M : <ore:ingotManasteel>,
	  P : <gregtech:meta_item_1:439>
	  });
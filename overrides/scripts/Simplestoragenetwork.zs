import mods.gregtech.recipe.RecipeMap;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.data.IData;
import scripts.CommonVars.makeShaped as makeShaped;

recipes.removeByMod("storagenetwork");  


makeShaped("SSNmaster", <storagenetwork:master>,
	[" R ",
	 "RBR",
	 " R "],
	{ B : <ore:blockSteel>,
	  R : <ore:stickBronze>
	  });

makeShaped("SSNcrafting", <storagenetwork:request>,
	["BCB",
	 "CTC",
	 "BCB"],
	{ B : <ore:stickBronze>,
	  C : <storagenetwork:simple_kabel>,
	  T : <minecraft:crafting_table>
	  });
	  
makeShaped("SSNcable", <storagenetwork:simple_kabel> * 8,
	[" B ",
	 "WWW",
	 " B "],
	{ W : <gregtech:item_pipe_small:112>,
	  B : <gregtech:meta_plate:260>
	  });
	  

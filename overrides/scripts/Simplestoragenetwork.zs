import mods.gregtech.recipe.RecipeMap;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.data.IData;
import scripts.CommonVars.makeShaped as makeShaped;

//Removed all recipes to start
recipes.removeByMod("storagenetwork");  


makeShaped("SSNmaster", <storagenetwork:master>,
	["PRP",
	 "RBR",
	 "PRP"],
	{ B : <gregtech:steam_casing>,
	  R : <ore:stickBronze>,
	  P : <gregtech:meta_plate:324>
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
	  
makeShaped("SSNcableimport", <storagenetwork:im_kabel> * 1,
	["   ",
	 " B ",
	 " W "],
	{ W : <ore:craftingToolWrench>,
	  B : <storagenetwork:simple_kabel>
	  });
	  
makeShaped("SSNcablerevert", <storagenetwork:simple_kabel> * 1,
	["   ",
	 " B ",
	 " W "],
	{ W : <ore:craftingToolWrench>,
	  B : <storagenetwork:im_kabel>
	  });

makeShaped("remote", <storagenetwork:remote:2>,
	["PBP",
	 "PCP",
	 "PBP"],
	{ B : <gregtech:meta_plate:260>,
	  C : <ore:circuitBasic>,
	  P : <gregtech:meta_plate:324>
	  });

// Removal
mods.jei.JEI.removeAndHide(<storagenetwork:inventory>);
mods.jei.JEI.removeAndHide(<storagenetwork:controller>);
mods.jei.JEI.removeAndHide(<storagenetwork:upgrade:1>);
mods.jei.JEI.removeAndHide(<storagenetwork:upgrade:2>);
mods.jei.JEI.removeAndHide(<storagenetwork:upgrade:3>);
mods.jei.JEI.removeAndHide(<storagenetwork:storage_kabel>);
mods.jei.JEI.removeAndHide(<storagenetwork:ex_kabel>);
mods.jei.JEI.removeAndHide(<storagenetwork:process_kabel>);
mods.jei.JEI.removeAndHide(<storagenetwork:storage_kabel>);
mods.jei.JEI.removeAndHide(<storagenetwork:remote>);
mods.jei.JEI.removeAndHide(<storagenetwork:remote:3>);
mods.jei.JEI.removeAndHide(<storagenetwork:remote:1>);
mods.jei.JEI.removeAndHide(<storagenetwork:kabel>);
mods.jei.JEI.removeAndHide(<storagenetwork:picker_remote>);
mods.jei.JEI.removeAndHide(<storagenetwork:collector_remote>);
mods.jei.JEI.removeAndHide(<storagenetwork:upgrade>);
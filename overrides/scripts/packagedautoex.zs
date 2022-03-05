import mods.gregtech.recipe.RecipeMap;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.data.IData;
import scripts.CommonVars.makeShaped as makeShaped;

// Merged the two mods into one script

recipes.remove(<packagedauto:recipe_holder>);
makeShaped("recipeholder",<packagedauto:recipe_holder> * 4,
	["SCS",
	 "BGB",
	 " B "],
	{ B : <gregtech:meta_plate_double:259>,
	  S : <gregtech:meta_item_1:232>,
	  C : <ore:circuitAdvanced>,
	  G : <appliedenergistics2:material:52>
	  });

recipes.remove(<packagedauto:packager>);
makeShaped("packager",<packagedauto:packager>,
	["BCB",
	 "RGE",
	 "BDB"],
	{ B : <gregtech:meta_plate:2011>,
	  R : <gregtech:meta_item_1:188>,
	  C : <ore:circuitAdvanced>,
	  G : <gregtech:machine:988>,
	  E : <gregtech:meta_item_1:158>,
	  D : <gregtech:cable_double:41>
	  });
	  
recipes.remove(<packagedauto:unpackager>);
makeShaped("unpackager",<packagedauto:unpackager>,
	["BCB",
	 "EGR",
	 "BDB"],
	{ B : <gregtech:meta_plate:2011>,
	  R : <gregtech:meta_item_1:188>,
	  C : <ore:circuitAdvanced>,
	  G : <gregtech:machine:988>,
	  E : <gregtech:meta_item_1:158>,
	  D : <gregtech:cable_double:41>
	  });

recipes.remove(<packagedauto:packager_extension>);
makeShaped("packagerextension",<packagedauto:packager_extension>,
	["BCB",
	 "EGR",
	 "BDB"],
	{ B : <gregtech:meta_plate:2011>,
	  R : <gregtech:meta_item_1:217>,
	  C : <ore:circuitAdvanced>,
	  G : <gregtech:machine:988>,
	  E : <gregtech:meta_item_1:232>,
	  D : <gregtech:cable_double:41>
	  });

recipes.remove(<packagedauto:encoder>);
makeShaped("encoder",<packagedauto:encoder>,
	["BCB",
	 "BGB",
	 "BBB"],
	{ B : <gregtech:meta_plate:2011>,
	  R : <gregtech:meta_item_1:218>,
	  C : <appliedenergistics2:part:340>,
	  G : <gregtech:machine:988>,
	  E : <gregtech:meta_item_1:233>,
	  D : <gregtech:cable_double:41>
	  });
	  
recipes.remove(<packagedexcrafting:advanced_crafter>);
makeShaped("acrafter",<packagedexcrafting:advanced_crafter>,
	["BDB",
	 "DGD",
	 "BDB"],
	{ B : <gregtech:meta_plate:2011>,
	  G : <packagedauto:packager>,
	  D : <gregtech:meta_plate:41>
	  });
	  
recipes.remove(<packagedexcrafting:elite_crafter>);
makeShaped("ecrafter",<packagedexcrafting:elite_crafter>,
	["BDB",
	 "DGD",
	 "BDB"],
	{ B : <gregtech:meta_plate:2011>,
	  G : <packagedauto:packager>,
	  D : <gregtech:meta_plate:276>
	  });
	  
recipes.remove(<packagedexcrafting:ultimate_crafter>);
makeShaped("ucrafter",<packagedexcrafting:ultimate_crafter>,
	["BDB",
	 "DGD",
	 "BDB"],
	{ B : <gregtech:meta_plate:2011>,
	  G : <packagedauto:packager>,
	  D : <gregtech:meta_plate:278>
	  });
	  
//Removal 
mods.jei.JEI.removeAndHide(<packagedauto:package_component>);
mods.jei.JEI.removeAndHide(<packagedauto:me_package_component>);
// I have never seen this be used well
mods.jei.JEI.removeAndHide(<packagedexcrafting:ender_crafter>);
mods.jei.JEI.removeAndHide(<packagedexcrafting:combination_crafter>);
mods.jei.JEI.removeAndHide(<packagedexcrafting:marked_pedestal>);


	  
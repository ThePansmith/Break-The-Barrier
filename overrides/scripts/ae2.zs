import mods.gregtech.recipe.RecipeMap;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.data.IData;
import scripts.CommonVars.makeShaped as makeShaped;
import mods.gregtech.material.Material;
import mods.appliedenergistics2.Inscriber;


//cables
recipes.remove(<appliedenergistics2:part:16>);
recipes.remove(<appliedenergistics2:part:140>);
recipes.remove(<appliedenergistics2:part:516>);
wiremill.recipeBuilder().inputs(<gregtech:meta_gem:32002>).outputs(<gregtech:wire_single:32002> * 2).duration(100).EUt(48).buildAndRegister();
wiremill.recipeBuilder().inputs(<gregtech:meta_gem:214>).outputs(<appliedenergistics2:part:140> * 1).duration(100).EUt(12).buildAndRegister();
reactor.recipeBuilder().inputs(<gregtech:wire_single:32002> * 2, <appliedenergistics2:part:140> * 1).fluidInputs(<liquid:glass> * 500).outputs(<appliedenergistics2:part:16>).EUt(40).duration(120).buildAndRegister();
reactor.recipeBuilder().inputs(<gregtech:wire_quadruple:32002> * 2, <appliedenergistics2:part:140> * 4).fluidInputs(<liquid:glass> * 2000, <liquid:rubber> * 2000).outputs(<appliedenergistics2:part:516>).EUt(40).duration(120).buildAndRegister();

//quartz into certus quartz
mixer.recipeBuilder().inputs(<minecraft:quartz>).fluidInputs(<liquid:aluminium> * 31).outputs(<gregtech:meta_gem:214>).EUt(16).duration(60).buildAndRegister();

// Replace fluix crystals with ingots in all recipes (may reintroduce fluix crystals later on)
recipes.replaceAllOccurences(<appliedenergistics2:material:7>, <gregtech:meta_ingot:32002>, <*>);

// Removal and replacement of printed parts
val printed = [			<appliedenergistics2:material:20>,
						<appliedenergistics2:material:16>,
						<appliedenergistics2:material:17>,
						<appliedenergistics2:material:18>,
						<appliedenergistics2:material:23>,
						<appliedenergistics2:material:22>,
						<appliedenergistics2:material:24>] as IItemStack[];
for ing in printed {
Inscriber.removeRecipe(ing);
}
extruder.recipeBuilder()
	.inputs(<gregtech:meta_dust:99>)
	.notConsumable(<contenttweaker:pressplate>)
	.outputs(<appliedenergistics2:material:20>)
	.duration(100)
	.EUt(32)
	.buildAndRegister();
			   
 extruder.recipeBuilder()
	.inputs(<appliedenergistics2:material>)
	.notConsumable(<contenttweaker:pressplate>)
	.outputs(<appliedenergistics2:material:16>)
	.duration(100)
	.EUt(32)
	.buildAndRegister();
			   
extruder.recipeBuilder()
	.inputs(<minecraft:diamond>)
	.notConsumable(<contenttweaker:pressplate>)
	.outputs(<appliedenergistics2:material:17>)
	.duration(100)
	.EUt(32)
	.buildAndRegister();
			   
extruder.recipeBuilder()
	.inputs(<minecraft:gold_ingot>)
	.notConsumable(<contenttweaker:pressplate>)
	.outputs(<appliedenergistics2:material:18>)
	.duration(100)
	.EUt(32)
	.buildAndRegister();
			   
//Processers

			   chemreactor.recipeBuilder()
			   .inputs(<appliedenergistics2:material:16>, 
					   <appliedenergistics2:material:20>)
			   .fluidInputs(<liquid:redstone> * 288)
			   .outputs(<appliedenergistics2:material:23>)
			   .duration(150)
			   .EUt(32)
			   .buildAndRegister();
			   
			   chemreactor.recipeBuilder()
			   .inputs(<appliedenergistics2:material:18>, 
					   <appliedenergistics2:material:20>)
			   .fluidInputs(<liquid:redstone> * 288)
			   .outputs(<appliedenergistics2:material:22>)
			   .duration(150)
			   .EUt(32)
			   .buildAndRegister();
			   
			   chemreactor.recipeBuilder()
			   .inputs(<appliedenergistics2:material:17>, 
					   <appliedenergistics2:material:20>)
			   .fluidInputs(<liquid:redstone> * 288)
			   .outputs(<appliedenergistics2:material:24>)
			   .duration(150)
			   .EUt(32)
			   .buildAndRegister();

// Removal of shaped drive recipes
recipes.removeByRecipeName("appliedenergistics2:network/cells/storage_cell_1k");
recipes.removeByRecipeName("appliedenergistics2:network/cells/storage_cell_4k");
recipes.removeByRecipeName("appliedenergistics2:network/cells/storage_cell_16k");
recipes.removeByRecipeName("appliedenergistics2:network/cells/storage_cell_64k");
recipes.removeByRecipeName("appliedenergistics2:network/cells/fluid_storage_cell_1k");
recipes.removeByRecipeName("appliedenergistics2:network/cells/fluid_storage_cell_4k");
recipes.removeByRecipeName("appliedenergistics2:network/cells/fluid_storage_cell_16k");
recipes.removeByRecipeName("appliedenergistics2:network/cells/fluid_storage_cell_64k");

makeShaped("ae2mold", <contenttweaker:pressplate>,
	[" C ",
	 "   ",
	 " P "],
	{ C	: <ore:fixedcraftingToolWireCutter>,
	  P : <gregtech:meta_item_1:11>
	  });

recipes.remove(<appliedenergistics2:energy_acceptor>);
makeShaped("ae2eacceptor", <appliedenergistics2:energy_acceptor>,
	["PCP",
	 "CFC",
	 "PCP"],
	{ C	: <appliedenergistics2:part:16>,
	  F : <gregtech:meta_block_compressed_2000:2>,
	  P : <gregtech:meta_plate_double:324>
	  });

recipes.remove(<appliedenergistics2:drive>);
makeShaped("ae2drive", <appliedenergistics2:drive>,
	["PCP",
	 "CFC",
	 "PCP"],
	{ C	: <appliedenergistics2:part:16>,
	  F : <gregtech:machine:1628>,
	  P : <gregtech:meta_plate_double:324>
	  });

recipes.remove(<appliedenergistics2:interface>);
makeShaped("ae2interfacev", <appliedenergistics2:interface> * 4,
	["PIP",
	 "CFC",
	 "PIP"],
	{ C	: <gregtech:meta_item_1:188>,
	  F : <gregtech:machine:987>,
	  P : <gregtech:meta_plate_double:324>,
	  I : <gregtech:meta_plate:214>
	  });

recipes.remove(<appliedenergistics2:part:180>);
makeShaped("ae2panel", <appliedenergistics2:part:180>,
	[" MG",
	 "SRG",
	 " MG"],
	{ G : <appliedenergistics2:quartz_glass>,
	  M : <gregtech:meta_dust:32002>,
	  R : <minecraft:redstone>,
	  S : <gregtech:meta_ingot:2>
	  });

recipes.remove(<appliedenergistics2:material:39>);
makeShaped("ae2housing", <appliedenergistics2:material:39>,
	["GRG",
	 "R R",
	 "SSS"],
	{ G : <appliedenergistics2:quartz_glass>,
	  R : <gregtech:meta_foil:2517>,
	  S : <gregtech:meta_ingot:324>
	  });

recipes.remove(<appliedenergistics2:material:52>);
makeShaped("ae2interface", <appliedenergistics2:material:52> * 4,
	[" M ",
	 "MGM",
	 "SSS"],
	{ G : <gregtech:meta_gear:214>,
	  M : <gregtech:meta_dust:32002>,
	  S : <gregtech:meta_ingot:324>
	  });
	 
recipes.remove(<appliedenergistics2:fluid_interface>);  
makeShaped("fluidalt", <appliedenergistics2:fluid_interface> * 1,
	["   ",
	 " B ",
	 " W "],
	{ W : <ore:fixedcraftingToolWrench>,
	  B : <appliedenergistics2:interface>
	  });
	  
makeShaped("fluidrevert", <appliedenergistics2:interface> * 1,
	["   ",
	 " B ",
	 " W "],
	{ W : <ore:fixedcraftingToolWrench>,
	  B : <appliedenergistics2:fluid_interface>
	  });

//removal
mods.jei.JEI.removeAndHide(<appliedenergistics2:charger>);
mods.jei.JEI.removeAndHide(<appliedenergistics2:inscriber>);
mods.jei.JEI.removeAndHide(<appliedenergistics2:part:260>);
mods.jei.JEI.removeAndHide(<appliedenergistics2:part:240>);
mods.jei.JEI.removeAndHide(<appliedenergistics2:fluix_block>);
mods.jei.JEI.removeAndHide(<appliedenergistics2:crystal_seed>);
mods.jei.JEI.removeAndHide(<appliedenergistics2:crystal_seed:600>);
mods.jei.JEI.removeAndHide(<appliedenergistics2:crystal_seed:1200>);

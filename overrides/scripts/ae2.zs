import mods.gregtech.recipe.RecipeMap;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.data.IData;
import scripts.CommonVars.makeShaped as makeShaped;
import mods.gregtech.material.Material;
import mods.appliedenergistics2.Inscriber;
//cables
recipes.remove(<appliedenergistics2:part:140>);
recipes.remove(<appliedenergistics2:part:516>);
wiremill.recipeBuilder().inputs(<gregtech:meta_gem:32002>).outputs(<gregtech:wire_single:32002> * 2).duration(100).EUt(48).buildAndRegister();
wiremill.recipeBuilder().inputs(<gregtech:meta_gem:214>).outputs(<appliedenergistics2:part:140> * 1).duration(100).EUt(12).buildAndRegister();
reactor.recipeBuilder().inputs(<gregtech:wire_single:32002> * 2, <appliedenergistics2:part:140> * 1).fluidInputs(<liquid:glass> * 500).outputs(<appliedenergistics2:part:16>).EUt(40).duration(120).buildAndRegister();
reactor.recipeBuilder().inputs(<gregtech:wire_quadruple:32002> * 2, <appliedenergistics2:part:140> * 4).fluidInputs(<liquid:glass> * 2000, <liquid:rubber> * 2000).outputs(<appliedenergistics2:part:516>).EUt(40).duration(120).buildAndRegister();

//certus
mixer.recipeBuilder().inputs(<minecraft:quartz>).fluidInputs(<liquid:fluidmanasteel> * 31).outputs(<gregtech:meta_gem:214>).EUt(16).duration(60).buildAndRegister();



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
	.inputs(<botania:manaresource:2>)
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


makeShaped("ae2mold", <contenttweaker:pressplate>,
	[" C ",
	 "   ",
	 " P "],
	{ C	: <ore:craftingToolWireCutter>,
	  P : <gregtech:meta_item_1:11>
	  });

//removal
mods.jei.JEI.removeAndHide(<appliedenergistics2:charger>);
mods.jei.JEI.removeAndHide(<appliedenergistics2:inscriber>);


import mods.gregtech.recipe.RecipeMap;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.data.IData;
import scripts.CommonVars.makeShaped as makeShaped;
import mods.gregtech.material.Material;


wiremill.recipeBuilder().inputs(<gregtech:meta_gem:32002>).outputs(<gregtech:wire_single:32002> * 2).duration(100).EUt(48).buildAndRegister();
wiremill.recipeBuilder().inputs(<gregtech:meta_gem:214>).outputs(<appliedenergistics2:part:140> * 1).duration(100).EUt(12).buildAndRegister();
reactor.recipeBuilder().inputs(<gregtech:wire_single:32002> * 2, <appliedenergistics2:part:140> * 1).fluidInputs(<liquid:glass> * 500).outputs(<appliedenergistics2:part:16>).EUt(40).duration(120).buildAndRegister();
reactor.recipeBuilder().inputs(<gregtech:wire_quadruple:32002> * 2, <appliedenergistics2:part:140> * 4).fluidInputs(<liquid:glass> * 2000, <liquid:rubber> * 2000).outputs(<appliedenergistics2:part:516>).EUt(40).duration(120).buildAndRegister();
reactor.recipeBuilder().inputs(<appliedenergistics2:part:16>).fluidInputs(<liquid:rubber> * 500).outputs(<appliedenergistics2:part:36>).EUt(16).duration(40).buildAndRegister();

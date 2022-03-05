import mods.gregtech.recipe.RecipeMap;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.data.IData;
import scripts.CommonVars.makeShaped as makeShaped;

//Recipes for chemchain fluids
//Keep them in the same order as they are shown in chemchains_materials

mixer.recipeBuilder().fluidInputs([<liquid:nitric_acid> * 1000,<liquid:ammonia> * 1000]).fluidOutputs(<liquid:ammonium_nitrate>  * 1000).EUt(15).duration(200).buildAndRegister();

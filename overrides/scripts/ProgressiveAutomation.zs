import mods.gregtech.recipe.RecipeMap;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.data.IData;
import scripts.CommonVars.makeShaped as makeShaped;


 val stonemachines = [<progressiveautomation:chopper_stone>, 
                    <progressiveautomation:crafter_stone>,
                    <progressiveautomation:farmer_stone>, 
                    <progressiveautomation:killer_stone>, 
                    <progressiveautomation:miner_stone>, 
                    <progressiveautomation:planter_stone>] as IIngredient[];

for ing in stonemachines {
  recipes.replaceAllOccurences(ing, <gregtech:machine:986>, <*>);
}

recipes.remove(<progressiveautomation:rf_engine>);
recipes.addShaped(rfengine, [
	[null, <minecraft:redstone_block>, null],
	[<gregtech:meta_ingot:260>,<ore:circuitBasic>,<gregtech:meta_ingot:260>],
	[null, <minecraft:redstone_block>, null]]);


## Removal
mods.jei.JEI.removeAndHide(<progressiveautomation:capacitor_wooden>);
mods.jei.JEI.removeAndHide(<progressiveautomation:capacitor_stone>);
mods.jei.JEI.removeAndHide(<progressiveautomation:capacitor_iron>);
mods.jei.JEI.removeAndHide(<progressiveautomation:capacitor_diamond>);
mods.jei.JEI.removeAndHide(<progressiveautomation:chopper_wooden>);
mods.jei.JEI.removeAndHide(<progressiveautomation:chopper_stone>);
mods.jei.JEI.removeAndHide(<progressiveautomation:crafter_wooden>);
mods.jei.JEI.removeAndHide(<progressiveautomation:crafter_stone>);
mods.jei.JEI.removeAndHide(<progressiveautomation:farmer_wooden>);
mods.jei.JEI.removeAndHide(<progressiveautomation:farmer_stone>);
mods.jei.JEI.removeAndHide(<progressiveautomation:generator_wooden>);
mods.jei.JEI.removeAndHide(<progressiveautomation:generator_stone>);
mods.jei.JEI.removeAndHide(<progressiveautomation:generator_iron>);
mods.jei.JEI.removeAndHide(<progressiveautomation:generator_diamond>);
mods.jei.JEI.removeAndHide(<progressiveautomation:killer_wooden>);
mods.jei.JEI.removeAndHide(<progressiveautomation:killer_stone>);
mods.jei.JEI.removeAndHide(<progressiveautomation:miner_wooden>);
mods.jei.JEI.removeAndHide(<progressiveautomation:miner_stone>);
mods.jei.JEI.removeAndHide(<progressiveautomation:planter_wooden>);
mods.jei.JEI.removeAndHide(<progressiveautomation:planter_stone>);
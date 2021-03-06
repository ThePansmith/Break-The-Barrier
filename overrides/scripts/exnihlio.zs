import mods.gregtech.recipe.RecipeMap;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.data.IData;
import scripts.CommonVars.makeShaped as makeShaped;


mods.exnihilocreatio.Hammer.addRecipe(<contenttweaker:worldgenblock>, <minecraft:cobblestone>, 0, 1, 0);
mods.exnihilocreatio.Hammer.addRecipe(<minecraft:brick_block>, <gregtech:meta_dust:2524> * 4, 0, 1, 0);

recipes.replaceAllOccurences(<exnihilocreatio:item_material:1>, <gregtech:meta_item_1:351>, <*>);

mods.jei.JEI.hideCategory("exnihilocreatio:sieve");

recipes.remove(<exnihilocreatio:block_barrel0>);
makeShaped("barrel", <exnihilocreatio:block_barrel0>,
	["P P",
	 "P P",
	 "PHP"],
	{ P : <ore:plankWood>,
	  H : <minecraft:wooden_pressure_plate>,
	  });
## Removal
mods.jei.JEI.removeAndHide(<exnihilocreatio:item_mesh>);
mods.jei.JEI.removeAndHide(<exnihilocreatio:item_mesh:1>);
mods.jei.JEI.removeAndHide(<exnihilocreatio:item_mesh:2>);
mods.jei.JEI.removeAndHide(<exnihilocreatio:item_mesh:3>);
mods.jei.JEI.removeAndHide(<exnihilocreatio:item_mesh:4>);
mods.jei.JEI.removeAndHide(<exnihilocreatio:item_doll>);
mods.jei.JEI.removeAndHide(<exnihilocreatio:item_doll:1>);
mods.jei.JEI.removeAndHide(<exnihilocreatio:item_doll:2>);
mods.jei.JEI.removeAndHide(<exnihilocreatio:item_doll:3>);
mods.jei.JEI.removeAndHide(<exnihilocreatio:block_netherrack_crushed>);
mods.jei.JEI.removeAndHide(<exnihilocreatio:block_endstone_crushed>);
mods.jei.JEI.removeAndHide(<exnihilocreatio:block_diorite_crushed>);
mods.jei.JEI.removeAndHide(<exnihilocreatio:block_andesite_crushed>);
mods.jei.JEI.removeAndHide(<exnihilocreatio:block_granite_crushed>);
mods.jei.JEI.removeAndHide(<exnihilocreatio:block_sieve>);
mods.jei.JEI.removeAndHide(<exnihilocreatio:block_auto_sifter>);
mods.jei.JEI.removeAndHide(<exnihilocreatio:block_axle_stone>);
mods.jei.JEI.removeAndHide(<exnihilocreatio:block_auto_sifter>);
mods.jei.JEI.removeAndHide(<exnihilocreatio:block_end_cake>);
mods.jei.JEI.removeAndHide(<exnihilocreatio:item_material:1>);
mods.jei.JEI.removeAndHide(<exnihilocreatio:block_waterwheel>);
mods.jei.JEI.removeAndHide(<exnihilocreatio:block_grinder>);
mods.jei.JEI.removeAndHide(<exnihilocreatio:item_material:5>);
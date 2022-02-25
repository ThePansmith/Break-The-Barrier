import mods.gregtech.recipe.RecipeMap;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.data.IData;
import scripts.CommonVars.makeShaped as makeShaped;

//AE2 cables
mods.chisel.Carving.addGroup("ae2cables");
for i in [14,1,4,13,5,9,3,11,10,2,6,0,8,7,15,12,16] {
	mods.chisel.Carving.addVariation("ae2cables", <appliedenergistics2:part>.withDamage(i));
	mods.chisel.Carving.addVariation("ae2cables", <appliedenergistics2:part>.withDamage(i+20));
}

//AE2 interfaces
mods.chisel.Carving.addGroup("interfaces");
 val interfaces = [<appliedenergistics2:interface>,
<appliedenergistics2:fluid_interface>,
<appliedenergistics2:part:440>,
<appliedenergistics2:part:441>] as IItemStack[];

for ing in interfaces {
mods.chisel.Carving.addVariation("interfaces", ing);
}

//SSN cables
mods.chisel.Carving.addGroup("SSNcables");
 val cables = [<storagenetwork:simple_kabel>,
<storagenetwork:im_kabel>] as IItemStack[];

for ing in cables {
mods.chisel.Carving.addVariation("SSNcables", ing);
}

//Programmed circuits
mods.chisel.Carving.addGroup("programmed_circuits");
for i in 0 .. 33 {
	mods.chisel.Carving.addVariation("programmed_circuits", <metaitem:circuit.integrated>.withTag({Configuration: i}));
}

//Gregtech filters
mods.chisel.Carving.addGroup("gregtech_filters");
 val gregtech_filters = [<metaitem:fluid_filter>,
<metaitem:item_filter>,
<metaitem:ore_dictionary_filter>,
<metaitem:smart_item_filter>] as IItemStack[];
for ing in gregtech_filters {
mods.chisel.Carving.addVariation("gregtech_filters", ing);
}

//Worldgen blocks
mods.chisel.Carving.addVariation("stonebrick", <contenttweaker:worldgenblock>);
mods.chisel.Carving.addVariation("dirt", <contenttweaker:worldgendirtblock>);

//Remove metal block uncrafting recipes
recipes.removeByRecipeName("chisel:uncraft_blocksteel");
recipes.removeByRecipeName("chisel:uncraft_blockiron");
recipes.removeByRecipeName("chisel:uncraft_blocktin");
recipes.removeByRecipeName("chisel:uncraft_blockuranium");
recipes.removeByRecipeName("chisel:uncraft_blocksilver");
recipes.removeByRecipeName("chisel:uncraft_blockgold");
recipes.removeByRecipeName("chisel:uncraft_blocknickel");
recipes.removeByRecipeName("chisel:uncraft_blockcobalt");
recipes.removeByRecipeName("chisel:uncraft_blockplatinum");
recipes.removeByRecipeName("chisel:uncraft_blockcopper");
recipes.removeByRecipeName("chisel:uncraft_blockaluminum");
recipes.removeByRecipeName("chisel:uncraft_blocklead");
recipes.removeByRecipeName("chisel:uncraft_blockbronze");

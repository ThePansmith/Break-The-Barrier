import mods.gregtech.recipe.RecipeMap;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.data.IData;
import scripts.CommonVars.makeShaped as makeShaped;

//AE2 cables
// Had these sorted by color but chisel fucked it up :(
mods.chisel.Carving.addGroup("ae2cables");
 val ae2cableswires = [<appliedenergistics2:part:16>,
<appliedenergistics2:part:14>,
<appliedenergistics2:part:1>,
<appliedenergistics2:part:4>,
<appliedenergistics2:part:13>,
<appliedenergistics2:part:5>,
<appliedenergistics2:part:9>,
<appliedenergistics2:part:11>,
<appliedenergistics2:part:10>,
<appliedenergistics2:part:6>,
<appliedenergistics2:part>,
<appliedenergistics2:part:7>,
<appliedenergistics2:part:15>,
<appliedenergistics2:part:12>,
<appliedenergistics2:part:22>,
<appliedenergistics2:part:26>,
<appliedenergistics2:part:20>,
<appliedenergistics2:part:28>,
<appliedenergistics2:part:27>,
<appliedenergistics2:part:35>,
<appliedenergistics2:part:32>,
<appliedenergistics2:part:16>,
<appliedenergistics2:part:14>,
<appliedenergistics2:part:1>,
<appliedenergistics2:part:4>,
<appliedenergistics2:part:13>,
<appliedenergistics2:part:5>,
<appliedenergistics2:part:3>,
<appliedenergistics2:part:9>,
<appliedenergistics2:part:11>,
<appliedenergistics2:part:10>,
<appliedenergistics2:part:2>,
<appliedenergistics2:part:6>,
<appliedenergistics2:part>,
<appliedenergistics2:part:8>,
<appliedenergistics2:part:7>,
<appliedenergistics2:part:15>,
<appliedenergistics2:part:12>,
<appliedenergistics2:part:36>,
<appliedenergistics2:part:34>,
<appliedenergistics2:part:21>,
<appliedenergistics2:part:24>,
<appliedenergistics2:part:33>,
<appliedenergistics2:part:25>,
<appliedenergistics2:part:23>,
<appliedenergistics2:part:29>,
<appliedenergistics2:part:31>,
<appliedenergistics2:part:30>] as IItemStack[];

for ing in ae2cableswires {
mods.chisel.Carving.addVariation("ae2cables", ing);
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
 val programmed_circuits = [<metaitem:circuit.integrated>.withTag({Configuration: 0}),
<metaitem:circuit.integrated>.withTag({Configuration: 1}),
<metaitem:circuit.integrated>.withTag({Configuration: 2}),
<metaitem:circuit.integrated>.withTag({Configuration: 3}),
<metaitem:circuit.integrated>.withTag({Configuration: 4}),
<metaitem:circuit.integrated>.withTag({Configuration: 5}),
<metaitem:circuit.integrated>.withTag({Configuration: 6}),
<metaitem:circuit.integrated>.withTag({Configuration: 7}),
<metaitem:circuit.integrated>.withTag({Configuration: 8}),
<metaitem:circuit.integrated>.withTag({Configuration: 9}),
<metaitem:circuit.integrated>.withTag({Configuration: 10}),
<metaitem:circuit.integrated>.withTag({Configuration: 11}),
<metaitem:circuit.integrated>.withTag({Configuration: 12}),
<metaitem:circuit.integrated>.withTag({Configuration: 13}),
<metaitem:circuit.integrated>.withTag({Configuration: 14}),
<metaitem:circuit.integrated>.withTag({Configuration: 15}),
<metaitem:circuit.integrated>.withTag({Configuration: 16}),
<metaitem:circuit.integrated>.withTag({Configuration: 17}),
<metaitem:circuit.integrated>.withTag({Configuration: 18}),
<metaitem:circuit.integrated>.withTag({Configuration: 19}),
<metaitem:circuit.integrated>.withTag({Configuration: 20}),
<metaitem:circuit.integrated>.withTag({Configuration: 21}),
<metaitem:circuit.integrated>.withTag({Configuration: 22}),
<metaitem:circuit.integrated>.withTag({Configuration: 23}),
<metaitem:circuit.integrated>.withTag({Configuration: 24}),
<metaitem:circuit.integrated>.withTag({Configuration: 25}),
<metaitem:circuit.integrated>.withTag({Configuration: 26}),
<metaitem:circuit.integrated>.withTag({Configuration: 27}),
<metaitem:circuit.integrated>.withTag({Configuration: 28}),
<metaitem:circuit.integrated>.withTag({Configuration: 29}),
<metaitem:circuit.integrated>.withTag({Configuration: 30}),
<metaitem:circuit.integrated>.withTag({Configuration: 31}),
<metaitem:circuit.integrated>.withTag({Configuration: 32})] as IItemStack[];
for ing in programmed_circuits {
mods.chisel.Carving.addVariation("programmed_circuits", ing);
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
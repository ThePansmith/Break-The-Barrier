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

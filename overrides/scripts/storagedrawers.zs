import scripts.CommonVars.makeShaped as makeShaped;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.data.IData;
import crafttweaker.recipes.IRecipeFunction;

//rubber wood drawer for early game
makeShaped("drawer_rubber", <storagedrawers:customdrawers>.withTag({MatS: {id: "gregtech:planks", Count: 1 as byte, Damage: 0 as short}}),
	["PPP",
	 "SCM",
	 "PPP"],
	{ C : <ore:chestWood>,
	  P : <gregtech:planks:0>,
	  M : <ore:fixedcraftingToolSoftHammer>,
	  S : <ore:fixedcraftingToolSaw>
	  });

mods.jei.JEI.removeAndHide(<storagedrawers:framingtable>);
mods.jei.JEI.removeAndHide(<storagedrawers:upgrade_conversion>);
recipes.replaceAllOccurences(<minecraft:slime_ball>, <metaitem:rubber_drop>, <storagedrawers:tape>);

//strip XYZ data from sealed drawers
val stackEmUp = <storagedrawers:basicdrawers>.withTag({
    display: {
        Name: "§6Stack 'em up!",
        Lore: [
            "§fSealed drawers store information about their last placed position",
			"§fIt's useless and makes otherwise identical drawers not stackable",
			"§fThis recipe removes it and lists drawer contents"
        ]
    },
});

function getDrawerStorage(Drawers as IData) as string[]{
	var lore=[] as string[];
	for i in 0 to Drawers.length {
		if Drawers[i] == {} continue;
		val id=Drawers[i].Item.id.asString();
		val Damage=Drawers[i].Item.Damage.asInt();
		val Count=Drawers[i].Count.asInt();
		val tag=Drawers[i].Item.tag;
		val item=itemUtils.getItem(id).withDamage(Damage).withAmount(Count).withTag(tag);
		if item.amount<=64 {
			lore+="§6"+item.displayName + "§8 : §a" + item.amount;
		} else {
			lore+="§6"+item.displayName + "§8 : §a" + item.amount + " §7[" + item.amount / 64 + "x64 + " + item.amount % 64+"]";
		}
	}
	return lore;
}

for i in 0 to 5 {
	recipes.addShapeless("drawer_stack_"+i, stackEmUp.withDamage(i), 
		[<storagedrawers:basicdrawers>.withDamage(i).withTag({tile:{}}).marked("mark")],
		function(outputs, inputs, craftingInfo){
			val nbt = inputs.mark.tag as IData;
			val nbtRemove = {tile : {x:0, y:0 ,z:0}} as IData;
			val lore = {display: {Lore : ["§aStackable!"]}} as IData;
			val storage = getDrawerStorage(nbt.tile.Drawers);
			return inputs.mark.withTag(nbt-nbtRemove-lore+lore).withLore(storage) * 1;
		},null);

	recipes.addShapeless("drawer_stack_framed_"+i, <storagedrawers:customdrawers>.withDamage(i).withTag(stackEmUp.tag + {MatS: {id: "chisel:glowstone",Count: 1 as byte, Damage: 15 as short}}), 
		[<storagedrawers:customdrawers>.withDamage(i).withTag({tile:{}}).marked("mark")],
		function(outputs, inputs, craftingInfo){
			val nbt = inputs.mark.tag as IData;
			val nbtRemove = {tile : {x:0, y:0 ,z:0}} as IData;
			val lore = {display: {Lore : ["§aStackable!"]}} as IData;
			val storage = getDrawerStorage(nbt.tile.Drawers);
			return inputs.mark.withTag(nbt-nbtRemove-lore+lore).withLore(storage) * 1;
		},null);
}

//Frame drawers without a framing table
//All hail Eutro 
val framingMaterial as IIngredient = <*>.only(function(stack as IItemStack) as bool {
    if(!stack.isItemBlock) {
        return false;
    }
    return stack.asBlock().definition.getStateFromMeta(stack.metadata).opaqueCube;
});

val customDrawerOut = <storagedrawers:customdrawers>.withTag({
    display: {
        Name: "§6Frame your drawers by hand!",
        Lore: [
            "§cTop left: sides",
            "§aTop middle: trim",
            "§9Middle left: front"
        ]
    },
    MatS: {
        id: "minecraft:wool",
        Count: 1 as byte,
        Damage: 14 as short
    },
	MatT: {
        id: "minecraft:wool",
        Count: 1 as byte,
        Damage: 5 as short
    },
	MatF: {
        id: "minecraft:wool",
        Count: 1 as byte,
        Damage: 11 as short
    }
});

val dummyItem = <minecraft:barrier>.withTag({
	display: {
        Name: "This is an example recipe",
        Lore: [
            "This item is here to prevent conflicts with the real recipes.",
            "Just ignore it."
        ]
    }
});

function asData(stack as IItemStack) as IData {
    return {
        id: stack.definition.id,
        Count: 1 as byte,
        Damage: stack.metadata
    } as IData;
}

<ore:handFramedThree>.add(<storagedrawers:customdrawers:*>,
                          <framedcompactdrawers:framed_drawer_controller>, // remove these three if you don't have Framed Compacting Drawers
                          <framedcompactdrawers:framed_compact_drawer>,
                          <framedcompactdrawers:framed_slave>);

<ore:handFramed>.addAll(<ore:handFramedThree>);
<ore:handFramed>.add(<storagedrawers:customtrim>);

for side in [true, false] as bool[] {
	for front in [true, false] as bool[] {
		for trim in [true, false] as bool[] {
			if !side && !front && !trim continue;
			val ingredients as IIngredient[][] = [
				[
					side ? framingMaterial.marked("MatS") : null,
					trim ? framingMaterial.marked("MatT") : null
				],
				[
					front ? framingMaterial.marked("MatF") : null,
					(front ? <ore:handFramedThree> : <ore:handFramed>).marked("drawer")
				]
			];

			recipes.addHiddenShaped(
				"hand_framing_" + (trim ? "trim_" : "") + (front ? "front_" : "") + (side ? "side" : ""),
				customDrawerOut,
				ingredients,
				function(out, ins, cInfo) {
					var tag = {} as IData[string];
					for key, stack in ins {
						if(key != "drawer") {
							tag[key] = asData(stack);
						}
					}
					val ret as any[any] = tag;
					if ins.drawer.tag.tile {
						return ins.drawer.withTag(ins.drawer.tag+(ret as IData)+{tile: ret as IData}) * 1;
					} else {
						return ins.drawer.withTag(ins.drawer.tag+(ret as IData)) * 1;
					}
				} as IRecipeFunction
			);
		}
	}
}
//exaple recipes for JEI
for i in 0 to 5 {
	recipes.addShaped(
		"hand_framing_example"+i,
		customDrawerOut.withDamage(i),
		[[<minecraft:wool:14>,<minecraft:wool:5>, dummyItem],
		[<minecraft:wool:11>, <storagedrawers:customdrawers>.withDamage(i)]]
	);
}
recipes.addShaped(
	"hand_framing_example_trim",
	<storagedrawers:customtrim>.withTag(customDrawerOut.tag),
	[[<minecraft:wool:14>,<minecraft:wool:5>, dummyItem],
	[<minecraft:book>.withTag({display: {Name: "Trims don't have a front face"}}), <storagedrawers:customtrim>]]
);
recipes.addShaped(
	"hand_framing_example_compacting",
	<framedcompactdrawers:framed_compact_drawer>.withTag(customDrawerOut.tag),
	[[<minecraft:wool:14>, <minecraft:wool:5>, dummyItem],
	[<minecraft:wool:11>, <framedcompactdrawers:framed_compact_drawer>]]
);
recipes.addShaped(
	"hand_framing_example_controller",
	<framedcompactdrawers:framed_drawer_controller>.withTag(customDrawerOut.tag),
	[[<minecraft:wool:14>, <minecraft:wool:5>, dummyItem],
	[<minecraft:wool:11>, <framedcompactdrawers:framed_drawer_controller>]]
);
recipes.addShaped(
	"hand_framing_example_slave",
	<framedcompactdrawers:framed_slave>.withTag(customDrawerOut.tag),
	[[<minecraft:wool:14>, <minecraft:wool:5>, dummyItem],
	[<minecraft:wool:11>, <framedcompactdrawers:framed_slave>]]
);

for i in 0 to 5 {
recipes.addShaped("drawer_convert_"+i, <storagedrawers:customdrawers>.withDamage(i).withTag({tile: {id: "storagedrawers:basicdrawers.1"}}), //some junk data in tile{} to make it look taped
	[[<ore:fixedcraftingToolSoftHammer>, <ore:fixedcraftingToolSaw>],
	[<metaitem:frameWood>, <storagedrawers:basicdrawers>.withDamage(i).marked("mark")]],
	function(outputs, inputs, craftingInfo){
		val nbt = inputs.mark.tag as IData;
		val nbtRemove = {material : "oak", tile : {Mat: "oak"}} as IData;
		val nbtAdd = {MatS: {id: "storagedrawers:trim", Count: 1 as byte, Damage: 0 as short}} as IData;
		val nbtAddTile = {tile :{MatS: {id: "storagedrawers:trim", Count: 1 as byte, Damage: 0 as short}}} as IData;
		if (nbt.tile) {
			return outputs.withDamage(i).withTag(nbt-nbtRemove+nbtAdd+nbtAddTile);
		} else {
			return outputs.withDamage(i).withTag(nbt-nbtRemove+nbtAdd);
		}
	},null);
}

recipes.removeByMod("framedcompactdrawers");
recipes.addShaped("drawer_convert_compact", <framedcompactdrawers:framed_compact_drawer>.withTag({tile: {id: "storagedrawers:basicdrawers.1"}}),
	[[<ore:fixedcraftingToolSoftHammer>, <ore:fixedcraftingToolSaw>],
	[<metaitem:frameWood>, <storagedrawers:compdrawers>.marked("mark")]],
	function(outputs, inputs, craftingInfo){
		val nbt = inputs.mark.tag as IData;
		val nbtAdd = {MatS: {id: "storagedrawers:trim", Count: 1 as byte, Damage: 0 as short}} as IData;
		val nbtAddTile = {tile :{MatS: {id: "storagedrawers:trim", Count: 1 as byte, Damage: 0 as short}, Qua: 1 as byte}} as IData;
		if (nbt.tile) {
			return outputs.withTag(nbt+nbtAdd+nbtAddTile);
		} else {
			return outputs.withTag(nbt+nbtAdd);
		}
	},null);

recipes.addShaped("drawer_convert_controller", <framedcompactdrawers:framed_drawer_controller>,
	[[<ore:fixedcraftingToolSoftHammer>, <ore:fixedcraftingToolSaw>],
	[<metaitem:frameWood>, <storagedrawers:controller>]]);

recipes.addShaped("drawer_convert_slave", <framedcompactdrawers:framed_slave>,
	[[<ore:fixedcraftingToolSoftHammer>, <ore:fixedcraftingToolSaw>],
	[<metaitem:frameWood>, <storagedrawers:controllerslave>]]);

//Drawers
recipes.removeByRegex("storagedrawers:framed_drawer_.*");

val materials = {
	0 : "oak",
	1 : "spruce",
	2 : "birch",
	3 : "jungle",
	4 : "acacia",
	5 : "dark_oak"
} as string[int];

val types = {
	0 : "fulldrawers1_",
	1 : "fulldrawers2_",
	2 : "fulldrawers4_",
	3 : "halfdrawers2_",
	4 : "halfdrawers4_"
} as string[int];

val templates = [[
		"PPP",
		"SCH",
		"PPP"
	],[
		"PCP",
		"SPH",
		"PCP"
	],[
		"CPC",
		"SPH",
		"CPC"
	],[
		"DCD",
		"SDH",
		"DCD"
	],[
		"CDC",
		"SDH",
		"CDC"
	]
] as string[][];

val assemblerTemplates = [
	{"P" : 6, "C" : 1},
	{"P" : 5, "C" : 2},
	{"P" : 3, "C" : 4},
	{"S" : 5, "C" : 2},
	{"S" : 3, "C" : 4}
] as int[string][];

function assemblerTemplatesToIngredients(template as int[string], replacements as IIngredient[string]) as IIngredient[] {
	var ingredients = [] as IIngredient[];
        for item, quantity in template{
			ingredients+=replacements[item]*quantity;
        }
	return ingredients as IIngredient[];
}

for plankDmg, mat in materials{
	for drawerDmg, drawerType in types{
		recipes.removeByRecipeName("storagedrawers:basicdrawers_"+drawerType+mat);
		makeShaped("basicdrawers_"+drawerType+mat, <storagedrawers:basicdrawers>.withDamage(drawerDmg).withTag({material: mat}) * assemblerTemplates[drawerDmg]["C"],
			templates[drawerDmg],
			{ C : <minecraft:chest>,
			  P : <minecraft:planks>.withDamage(plankDmg),
			  D : <minecraft:wooden_slab>.withDamage(plankDmg),
			  S : <ore:fixedcraftingToolSaw>,
			  H : <ore:fixedcraftingToolSoftHammer>
			  });
		assembler.recipeBuilder()
		.inputs(assemblerTemplatesToIngredients(assemblerTemplates[drawerDmg],
			{ C : <minecraft:chest>,
			  P : <minecraft:planks>.withDamage(plankDmg),
			  S : <minecraft:wooden_slab>.withDamage(plankDmg)
			  }))
		.circuit(9+drawerDmg)
		.outputs(<storagedrawers:basicdrawers>.withDamage(drawerDmg).withTag({material: mat}) * assemblerTemplates[drawerDmg]["C"])
		.duration(100)
		.EUt(30)
		.buildAndRegister();
	}
}

recipes.replaceAllOccurences(<minecraft:piston>, <metaitem:electric.piston.lv>, <storagedrawers:compdrawers>);
recipes.replaceAllOccurences(<minecraft:iron_ingot>, <ore:circuitBasic>, <storagedrawers:compdrawers>);
assembler.recipeBuilder()
    .inputs([<ore:drawerBasic>, <metaitem:electric.piston.lv>, <ore:circuitPrimitive>])
	.fluidInputs(<liquid:concrete> * 720)
    .outputs(<storagedrawers:compdrawers>)
    .duration(100)
    .EUt(30)
    .buildAndRegister();

recipes.replaceAllOccurences(<minecraft:comparator>, <metaitem:robot.arm.lv>, <storagedrawers:controller>);
recipes.replaceAllOccurences(<minecraft:diamond>, <ore:circuitGood>, <storagedrawers:controller>);
assembler.recipeBuilder()
    .inputs([<ore:drawerBasic>, <metaitem:robot.arm.lv>, <ore:circuitBasic>])
	.fluidInputs(<liquid:concrete> * 720)
    .outputs(<storagedrawers:controller>)
    .duration(100)
    .EUt(30)
    .buildAndRegister();

recipes.replaceAllOccurences(<minecraft:comparator>, <metaitem:conveyor.module.lv>, <storagedrawers:controllerslave>);
recipes.replaceAllOccurences(<minecraft:gold_ingot>, <ore:circuitBasic>, <storagedrawers:controllerslave>);
assembler.recipeBuilder()
    .inputs([<ore:drawerBasic>, <metaitem:conveyor.module.lv>, <ore:circuitPrimitive>])
	.fluidInputs(<liquid:concrete> * 720)
    .outputs(<storagedrawers:controllerslave>)
    .duration(100)
    .EUt(30)
    .buildAndRegister();

//Upgrades
recipes.removeByRegex("storagedrawers:upgrade_storage_.*");
recipes.removeByRecipeName("storagedrawers:upgrade_template");

makeShaped("upgrade_template", <storagedrawers:upgrade_template>,
	["   ",
	 "STM",
	 "   "],
	{ T : <metaitem:wooden_form.empty>,
	  M : <ore:fixedcraftingToolSoftHammer>,
	  S : <ore:fixedcraftingToolSaw>
	  });
assembler.recipeBuilder()
    .inputs(<ore:plankWood>)
    .circuit(0)
    .outputs(<storagedrawers:upgrade_template>)
    .duration(20)
    .EUt(30)
    .buildAndRegister();

makeShaped("upgrade_storage_bronze", <storagedrawers:upgrade_storage:0>,
	["SHS",
	 "PTP",
	 "SDS"],
	{ T : <storagedrawers:upgrade_template>,
	  P : <metaitem:plateBronze>,
	  S : <metaitem:boltWood>,
	  H : <ore:fixedcraftingToolHardHammer>,
	  D : <ore:fixedcraftingToolSoftHammer>
	  });
assembler.recipeBuilder()
    .inputs(<storagedrawers:upgrade_template>)
    .inputs(<metaitem:plateBronze>)
	.fluidInputs(<liquid:glue> * 100)
    .outputs(<storagedrawers:upgrade_storage:0>)
    .duration(100)
    .EUt(30)
    .buildAndRegister();

makeShaped("upgrade_storage_iron", <storagedrawers:upgrade_storage:1>,
	["SHS",
	 "PTP",
	 "SDS"],
	{ T : <storagedrawers:upgrade_template>,
	  P : <metaitem:plateIron>,
	  S : <metaitem:screwBronze>,
	  H : <ore:fixedcraftingToolHardHammer>,
	  D : <ore:fixedcraftingToolScrewdriver>
	  });
assembler.recipeBuilder()
	.inputs(<storagedrawers:upgrade_template>)
    .inputs(<metaitem:plateIron>)
	.fluidInputs(<liquid:tin> * 144)
    .outputs(<storagedrawers:upgrade_storage:1>)
    .duration(100)
    .EUt(30)
    .buildAndRegister();

makeShaped("upgrade_storage_steel", <storagedrawers:upgrade_storage:2>,
	["SHS",
	 "PTP",
	 "SDS"],
	{ T : <storagedrawers:upgrade_template>,
	  P : <metaitem:plateSteel>,
	  S : <metaitem:screwIron>,
	  H : <ore:fixedcraftingToolHardHammer>,
	  D : <ore:fixedcraftingToolScrewdriver>
	  });
assembler.recipeBuilder()
	.inputs(<storagedrawers:upgrade_template>)
    .inputs(<metaitem:plateSteel>)
	.fluidInputs(<liquid:tin> * 144)
    .outputs(<storagedrawers:upgrade_storage:2>)
    .duration(100)
    .EUt(30)
    .buildAndRegister();

makeShaped("upgrade_storage_diamond", <storagedrawers:upgrade_storage:3>,
	["SHS",
	 "PTP",
	 "SDS"],
	{ T : <storagedrawers:upgrade_template>,
	  P : <ore:gemDiamond>,
	  S : <metaitem:rubber_drop>,
	  H : <ore:fixedcraftingToolHardHammer>,
	  D : <ore:fixedcraftingToolSoftHammer>
	  });
assembler.recipeBuilder()
	.inputs(<storagedrawers:upgrade_template>)
    .inputs(<metaitem:plateDiamond>)
	.fluidInputs(<liquid:tin> * 144)
    .outputs(<storagedrawers:upgrade_storage:3>)
    .duration(100)
    .EUt(30)
    .buildAndRegister();

makeShaped("upgrade_storage_potin", <storagedrawers:upgrade_storage:4>,
	["SHS",
	 "PTP",
	 "SDS"],
	{ T : <storagedrawers:upgrade_template>,
	  P : <metaitem:platePotin>,
	  S : <metaitem:screwSteel>,
	  H : <ore:fixedcraftingToolHardHammer>,
	  D : <ore:fixedcraftingToolScrewdriver>
	  });
assembler.recipeBuilder()
	.inputs(<storagedrawers:upgrade_template>)
    .inputs(<metaitem:platePotin>)
	.fluidInputs(<liquid:tin> * 144)
    .outputs(<storagedrawers:upgrade_storage:4>)
    .duration(100)
    .EUt(30)
    .buildAndRegister();

recipes.removeByRecipeName("storagedrawers:upgrade_void");
makeShaped("upgrade_void", <storagedrawers:upgrade_void>,
	[" H ",
	 " T ",
	 " G "],
	{ T : <storagedrawers:upgrade_template>,
	  H : <ore:fixedcraftingToolHardHammer>,
	  G : <trashcansreborn:trashcan>
	  });

recipes.replaceAllOccurences(<minecraft:redstone_torch>, <metaitem:wireGtSingleRedAlloy>, <storagedrawers:upgrade_status:0>);
recipes.replaceAllOccurences(<minecraft:comparator>, <metaitem:cableGtDoubleRedAlloy>, <storagedrawers:upgrade_status:1>);

//Keys
recipes.removeByRegex("storagedrawers:key_.*");

makeShaped("drawer_key", <storagedrawers:drawer_key>,
	[" II",
	 "HIF",
	 " O "],
	{ I : <ore:stickBronze>,
	  O : <ore:ringBronze>,
	  F : <ore:fixedcraftingToolFile>,
	  H : <ore:fixedcraftingToolHardHammer>,
	  });

mods.chisel.Carving.addGroup("drawer_keys");
 val drawer_keys = [<storagedrawers:drawer_key>,
<storagedrawers:shroud_key>,
<storagedrawers:personal_key>,
<storagedrawers:quantify_key>] as IItemStack[];
for ing in drawer_keys {
mods.chisel.Carving.addVariation("drawer_keys", ing);
}

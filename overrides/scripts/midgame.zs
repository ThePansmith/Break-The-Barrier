import mods.gregtech.recipe.RecipeMap;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.data.IData;
import scripts.CommonVars.makeShaped as makeShaped;


// Small Sodium Battery is also a new battery 
// If devtech adds the ability to create batteries this will be changed to be its own battery.
makeShaped("LVbattery", <gregtech:meta_item_1:732>.withTag({RepairCost: 0, display: {Name: "Copper Zinc Battery"}}),
	[" C ",
	 "ROR",
	 "RZR"],
	{ C : <gregtech:cable_double:112>,
	  O : <gregtech:meta_plate_double:25>,
	  Z : <gregtech:meta_plate_double:122>,
	  R : <gregtech:meta_plate:1068>
	  });
<gregtech:meta_item_1:732>.addTooltip(format.darkGray("Basic, but it gets the job done"));

// Sorry, may cause GTNH flashbacks :troll:
// May come back in the future, perhaps using that IC2 lava
<recipemap:centrifuge>.findRecipe(80, null, [<liquid:lava> * 100]).remove();

//Remove Ore/Fluid drill recipes
<recipemap:assembler>.findRecipe(1920, [<metaitem:hull.ev>, <metaitem:frameTitanium> * 4, <metaitem:circuit.workstation> * 4, <metaitem:electric.motor.ev> * 4, <metaitem:electric.pump.ev> * 4, <metaitem:conveyor.module.ev> * 4, <metaitem:gearTungsten> * 4, <metaitem:circuit.integrated>.withTag({Configuration: 1})], null).remove();
<recipemap:assembler>.findRecipe(7680, [<metaitem:hull.iv>, <metaitem:frameTungstenSteel> * 4, <metaitem:circuit.mainframe> * 4, <metaitem:electric.motor.iv> * 4, <metaitem:electric.pump.iv> * 4, <metaitem:conveyor.module.iv> * 4, <metaitem:gearIridium> * 4, <metaitem:circuit.integrated>.withTag({Configuration: 1})], null).remove();
<recipemap:assembler>.findRecipe(30720, [<metaitem:hull.luv>, <metaitem:frameHsss> * 4, <metaitem:circuit.nano_mainframe> * 4, <metaitem:electric.motor.luv> * 4, <metaitem:electric.pump.luv> * 4, <metaitem:conveyor.module.luv> * 4, <metaitem:gearRuridit> * 4, <metaitem:circuit.integrated>.withTag({Configuration: 1})], null).remove();
<recipemap:assembler>.findRecipe(120, [<metaitem:hull.mv>, <metaitem:frameSteel> * 4, <metaitem:circuit.good_electronic> * 4, <metaitem:electric.motor.mv> * 4, <metaitem:electric.pump.mv> * 4, <metaitem:gearVanadiumSteel> * 4, <metaitem:circuit.integrated>.withTag({Configuration: 2})], null).remove();
<recipemap:assembler>.findRecipe(1920, [<metaitem:hull.ev>, <metaitem:frameTitanium> * 4, <metaitem:circuit.workstation> * 4, <metaitem:electric.motor.ev> * 4, <metaitem:electric.pump.ev> * 4, <metaitem:gearTungstenCarbide> * 4, <metaitem:circuit.integrated>.withTag({Configuration: 2})], null).remove();
<recipemap:assembler>.findRecipe(30720, [<metaitem:hull.luv>, <metaitem:frameTungstenSteel> * 4, <metaitem:circuit.nano_mainframe> * 4, <metaitem:electric.motor.luv> * 4, <metaitem:electric.pump.luv> * 4, <metaitem:gearOsmiridium> * 4, <metaitem:circuit.integrated>.withTag({Configuration: 2})], null).remove();

makeShaped("oildrill", <contenttweaker:oildrill>,
	["PIP",
	 "UDU",
	 " S "],
	{ P : <gregtech:meta_plate:32002>,
	  I : <gregtech:meta_item_1:173>,
	  U : <gregtech:meta_item_1:143>,
	  D : <gregtech:machine:1613>,
	  S : <gregtech:meta_tool_head_drill:323>
	  });
<contenttweaker:oildrill>.addShiftTooltip("It floats in rain");
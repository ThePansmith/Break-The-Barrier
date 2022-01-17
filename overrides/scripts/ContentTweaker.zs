#loader contenttweaker
#priority 101

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.Block;
import mods.contenttweaker.Color;
import mods.contenttweaker.Fluid;

import mods.contenttweaker.AxisAlignedBB;

import mods.contenttweaker.IItemFoodEaten;
import crafttweaker.potions.IPotion;

var tieronedrill = VanillaFactory.createItem("tieronedrill");
tieronedrill.maxStackSize = 64;
tieronedrill.register();

var woodstonedrilltip = VanillaFactory.createItem("woodstonedrilltip");
woodstonedrilltip.maxStackSize = 64;
woodstonedrilltip.register();

var tiertwodrill = VanillaFactory.createItem("tiertwodrill");
tiertwodrill.maxStackSize = 64;
tiertwodrill.register();

var worldgenblock = VanillaFactory.createBlock("worldgenblock", <blockmaterial:sand>);
worldgenblock.setBlockHardness(0.5);
worldgenblock.setBlockResistance(2.5);
worldgenblock.setToolClass("pickaxe");
worldgenblock.setToolLevel(0);
worldgenblock.setBlockSoundType(<soundtype:sand>);
worldgenblock.register();

var worldgendirtblock = VanillaFactory.createBlock("worldgendirtblock", <blockmaterial:sand>);
worldgendirtblock.setBlockHardness(0.5);
worldgendirtblock.setBlockResistance(2.5);
worldgendirtblock.setToolClass("pickaxe");
worldgendirtblock.setToolLevel(0);
worldgendirtblock.setBlockSoundType(<soundtype:sand>);
worldgendirtblock.register();

var brokenboiler = VanillaFactory.createBlock("brokenboiler", <blockmaterial:sand>);
brokenboiler.setBlockHardness(0.5);
brokenboiler.setBlockResistance(2.5);
brokenboiler.setToolClass("pickaxe");
brokenboiler.setToolLevel(1);
brokenboiler.setBlockSoundType(<soundtype:sand>);
brokenboiler.register();

var spunchcube = VanillaFactory.createBlock("spunchcube", <blockmaterial:sand>);
spunchcube.setBlockHardness(0.5);
spunchcube.setBlockResistance(2.5);
spunchcube.setToolClass("pickaxe");
spunchcube.setToolLevel(1);
spunchcube.setBlockSoundType(<soundtype:sand>);
spunchcube.register();

var tierthreedrill = VanillaFactory.createItem("tierthreedrill");
tierthreedrill.maxStackSize = 64;
tierthreedrill.register();

var tierfourdrill = VanillaFactory.createItem("tierfourdrill");
tierfourdrill.maxStackSize = 64;
tierfourdrill.register();

var biomedrill = VanillaFactory.createItem("biomedrill");
biomedrill.maxStackSize = 64;
biomedrill.register();

var dmanastone = VanillaFactory.createBlock("dmanastone", <blockmaterial:sand>);
dmanastone.setBlockHardness(1);
dmanastone.setBlockResistance(2.5);
dmanastone.setToolClass("pickaxe");
dmanastone.setToolLevel(1);
dmanastone.setBlockSoundType(<soundtype:sand>);
dmanastone.register();

var fluidmanasteel = VanillaFactory.createFluid("fluidmanasteel", Color.fromHex("66d1ad")); 
fluidmanasteel.register();

var manasap = VanillaFactory.createFluid("manasap", Color.fromHex("66d1ad")); 
manasap.register();

var manainfusedlube = VanillaFactory.createFluid("manainfusedlube", Color.fromHex("66d1ad")); 
manainfusedlube.register();

var manainfusedDF = VanillaFactory.createFluid("manainfusedDF", Color.fromHex("66d1ad")); 
manainfusedDF.register();

var tierfivedrill = VanillaFactory.createItem("tierfivedrill");
tierfivedrill.maxStackSize = 64;
tierfivedrill.register();

var tiersixdrill = VanillaFactory.createItem("tiersixdrill");
tiersixdrill.maxStackSize = 64;
tiersixdrill.register();

var pressplate = VanillaFactory.createItem("pressplate");
pressplate.maxStackSize = 1;
pressplate.register();

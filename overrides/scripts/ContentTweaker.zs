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

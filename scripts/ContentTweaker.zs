#loader contenttweaker

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

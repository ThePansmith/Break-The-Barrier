#priority 99
import mods.gregtech.recipe.RecipeMap;
import crafttweaker.item.IItemDefinition;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

val resistor = <ore:resistor>;
val diode = <ore:diode>;

resistor.addItems([<metaitem:component.resistor>, <metaitem:component.smd.resistor>]);
diode.addItems([<metaitem:component.diode>, <metaitem:component.smd.diode>]);

mods.jei.JEI.hideCategory("minecraft.anvil");
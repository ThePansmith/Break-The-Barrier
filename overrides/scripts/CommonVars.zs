#priority 999
// preprocessor directive to load this file first so others have access to the definitions

/**
 * Global definitions for commonly referenced values.
 * This avoids any inconsistencies that may arise from different definitions in different files.
 */

import mods.gregtech.recipe.RecipeMap;
import mods.gregtech.material.MaterialRegistry;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemCondition;
import crafttweaker.data.IData;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.recipes.IRecipeFunction;
import crafttweaker.recipes.IRecipeAction;

global alloy             as RecipeMap = RecipeMap.getByName("alloy_smelter");
global assembler         as RecipeMap = RecipeMap.getByName("assembler");
global assembly_line     as RecipeMap = RecipeMap.getByName("assembly_line");
global attractor         as RecipeMap = RecipeMap.getByName("attractor");
global autoclave         as RecipeMap = RecipeMap.getByName("autoclave");
global blast_furnace     as RecipeMap = RecipeMap.getByName("electric_blast_furnace");
global brewer            as RecipeMap = RecipeMap.getByName("brewer");
global canner            as RecipeMap = RecipeMap.getByName("canner");
global centrifuge        as RecipeMap = RecipeMap.getByName("centrifuge");
global chemical_bath     as RecipeMap = RecipeMap.getByName("chemical_bath");
global chemreactor       as RecipeMap = RecipeMap.getByName("chemical_reactor");
global circuit_assembler as RecipeMap = RecipeMap.getByName("circuit_assembler");
global compressor        as RecipeMap = RecipeMap.getByName("compressor");
global distillery        as RecipeMap = RecipeMap.getByName("distillery");
global electrolyzer      as RecipeMap = RecipeMap.getByName("electrolyzer");
global engraver          as RecipeMap = RecipeMap.getByName("laser_engraver");
global extractor         as RecipeMap = RecipeMap.getByName("extractor");
global extruder          as RecipeMap = RecipeMap.getByName("extruder");
global fermenter         as RecipeMap = RecipeMap.getByName("fermenter");
global fluid_canner      as RecipeMap = RecipeMap.getByName("fluid_canner");
global fluid_extractor   as RecipeMap = RecipeMap.getByName("fluid_extractor");
global fluidextractor    as RecipeMap = RecipeMap.getByName("fluid_extractor");
global forming           as RecipeMap = RecipeMap.getByName("forming_press");
global freezer           as RecipeMap = RecipeMap.getByName("vacuum_freezer");
global fusion_reactor    as RecipeMap = RecipeMap.getByName("fusion_reactor");
//Recipe Map for Gregtech Furnace recipes, different from vanilla furnace map
global GTfurnace         as RecipeMap = RecipeMap.getByName("furnace");
global hammer            as RecipeMap = RecipeMap.getByName("forge_hammer");
global implosion         as RecipeMap = RecipeMap.getByName("implosion_compressor");
global lathe             as RecipeMap = RecipeMap.getByName("lathe");
global macerator         as RecipeMap = RecipeMap.getByName("macerator");
global mixer             as RecipeMap = RecipeMap.getByName("mixer");
global packager          as RecipeMap = RecipeMap.getByName("packer");
global pyro              as RecipeMap = RecipeMap.getByName("pyro");
global reactor           as RecipeMap = RecipeMap.getByName("chemical_reactor");
global saw               as RecipeMap = RecipeMap.getByName("cutting_saw");
global sifter            as RecipeMap = RecipeMap.getByName("sifter");
global solidifier        as RecipeMap = RecipeMap.getByName("fluid_solidifier");
global thermal_sep       as RecipeMap = RecipeMap.getByName("thermal_centrifuge");
global tower             as RecipeMap = RecipeMap.getByName("distillation_tower");
global unpackager        as RecipeMap = RecipeMap.getByName("unpacker");
global wiremill          as RecipeMap = RecipeMap.getByName("wiremill");

global isBasic      as IItemCondition = function(stack as IItemStack) { return stack.tag has {Level: 0 as byte} as IData && !(stack.tag has {Creative: 1 as byte} as IData); };
global isHardened   as IItemCondition = function(stack as IItemStack) { return stack.tag has {Level: 1 as byte} as IData && !(stack.tag has {Creative: 1 as byte} as IData); };
global isReinforced as IItemCondition = function(stack as IItemStack) { return stack.tag has {Level: 2 as byte} as IData && !(stack.tag has {Creative: 1 as byte} as IData); };
global isSignalum   as IItemCondition = function(stack as IItemStack) { return stack.tag has {Level: 3 as byte} as IData && !(stack.tag has {Creative: 1 as byte} as IData); };
global isResonant   as IItemCondition = function(stack as IItemStack) { return stack.tag has {Level: 4 as byte} as IData && !(stack.tag has {Creative: 1 as byte} as IData); };
global isCreative   as IItemCondition = function(stack as IItemStack) { return stack.tag has {Creative: 1 as byte, Level: 4 as byte} as IData; };


global rfengine         as IItemStack  = <progressiveautomation:rf_engine>.withTag({Energy: 0});


/*
 Converts a text representation of a crafting grid recipe into an array of
 ingredients.

 Example:
(3, [[null,null,null],
     [null,null,null],
     [null,null,null]], <minecraft:furnace>, ["AAA",
                                              "A A",
                                              "AAA"], { A : <minecraft:stone> })
 =>

[[<minecraft:stone>, <minecraft:stone>, <minecraft:stone>],
 [<minecraft:stone>,        null,       <minecraft:stone>],
 [<minecraft:stone>, <minecraft:stone>, <minecraft:stone>]]
*/
function textToIngredients(ingredients as IIngredient[][],
                           output as IItemStack,
                           recipe as string[],
                           replacements as IIngredient[string]) as IIngredient[][] {

    for i, str in recipe {
        for j in 0 .. str.length {
            var item = str[j];
            if " " != item { // blanks are nulls, ignore them
                ingredients[i][j] = replacements[item];
            }
        }
    }

    return ingredients;
}

/* Same as above, but for standard 3x3 shapeless recipes. */
function makeShapeless3FA(name as string,
                          output as IItemStack,
                          recipe as string[],
                          replacements as IIngredient[string],
                          recipeFunction as IRecipeFunction,
                          recipeAction as IRecipeAction) {

    var ingredients = [null,null,null,
                       null,null,null,
                       null,null,null] as IIngredient[];

    for i, str in recipe {
        for j in 0 .. str.length {
            var item = str[j];
            if " " != item { // blanks are nulls, ignore them
                ingredients[str.length*i+j] = replacements[item];
            }
        }
    }

    recipes.addShapeless(name, output, ingredients, recipeFunction, recipeAction);
}

// Support varying arities so RecipeFunction/Action may be optionally used
function makeShapeless3F(name as string,
                         output as IItemStack,
                         recipe as string[],
                         replacements as IIngredient[string],
                         recipeFunction as IRecipeFunction) {
    makeShapeless3FA(name, output, recipe, replacements, recipeFunction, null);
}

function makeShapeless3(name as string,
                        output as IItemStack,
                        recipe as string[],
                        replacements as IIngredient[string]) {
    makeShapeless3F(name, output, recipe, replacements, null);
}

/* 3x3 shapeless compacting recipe. */
function makeCompacting3(name as string,
                         output as IItemStack,
                         input as IIngredient) {
    recipes.addShapeless(name, output,
        [input,input,input,
         input,input,input,
         input,input,input] as IIngredient[]);
}

function makeShapedFA(name as string,
                      output as IItemStack,
                      recipe as string[],
                      replacements as IIngredient[string],
                      recipeFunction as IRecipeFunction,
                      recipeAction as IRecipeAction) {

    var ingredients =
        [[null,null,null],
         [null,null,null],
         [null,null,null]] as IIngredient[][];

    recipes.addShaped(name, output,
        textToIngredients(ingredients, output, recipe, replacements),
        recipeFunction, recipeAction);
}

// Support varying arities so RecipeFunction/Action may be optionally used
function makeShapedF(name as string,
                     output as IItemStack,
                     recipe as string[],
                     replacements as IIngredient[string],
                     recipeFunction as IRecipeFunction) {
    makeShapedFA(name, output, recipe, replacements, recipeFunction, null);
}

function makeShaped(name as string,
                    output as IItemStack,
                    recipe as string[],
                    replacements as IIngredient[string]) {
    makeShapedF(name, output, recipe, replacements, null);
}

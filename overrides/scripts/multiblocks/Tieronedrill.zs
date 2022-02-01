import mods.gregtech.multiblock.Builder;
import mods.gregtech.multiblock.FactoryBlockPattern;
import mods.gregtech.multiblock.RelativeDirection;
import mods.gregtech.multiblock.functions.IPatternBuilderFunction;
import mods.gregtech.IControllerTile;
import mods.gregtech.multiblock.CTPredicate;
import mods.gregtech.multiblock.IBlockPattern;
import mods.gregtech.recipe.FactoryRecipeMap;
import mods.gregtech.recipe.RecipeMap;
import mods.gregtech.recipe.IRecipeLogic;
import mods.gregtech.recipe.IRecipe;
import mods.gregtech.recipe.functions.ISetupRecipeFunction;
import mods.gregtech.recipe.functions.ICompleteRecipeFunction;
import crafttweaker.item.IItemCondition;
// Multiblock 


var loc = "mbt:tier_1_drill_base";

val tier_1_drill_base = Builder.start(loc)
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
                       return FactoryBlockPattern.start()
            .aisle(
                "F~F",
				"F~F",
                "FFF",
                "III")
            .aisle(
                "~~~",
				"~~~",
                "FFF",
                "IBI")
            .aisle(
                "F~F",
				"F~F",
                "FFF",
                "IEI")
            .where("E", controller.self())
			.where("F", <metastate:gregtech:metal_casing:1>)
            .where("~", CTPredicate.getAir())
			.where("S", <metastate:gregtech:metal_casing:1>)
			.where("B", <metastate:gregtech:metal_casing>)
            .where("I", CTPredicate.states(<metastate:gregtech:metal_casing>)
                                      | CTPredicate.abilities(<mte_ability:IMPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1) // There is at least one IMPORT_ITEMS bus. JEI preview shows only one.
                                      | CTPredicate.abilities(<mte_ability:EXPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1)
                                      | CTPredicate.abilities(<mte_ability:IMPORT_FLUIDS>).setMinGlobalLimited(1).setPreviewCount(1)
                                      | CTPredicate.abilities(<mte_ability:INPUT_ENERGY>).setMinGlobalLimited(1).setMaxGlobalLimited(1).setPreviewCount(1) // There is at least one INPUT_ENERGY hatch and no more than three of it. JEI preview shows only one.
            )              
            .build();
    } as IPatternBuilderFunction)
	    .withRecipeMap(
		FactoryRecipeMap.start("tier_1_drill_base")
                        .minFluidInputs(1)
                        .maxFluidInputs(1)
                        .minInputs(1)
						.maxInputs(1)
						.minOutputs(1)
                        .maxOutputs(4)
                        .build())
	.withBaseTexture(<gregtech:metal_casing>.asBlock())
		.buildAndRegister();
// set optional properties
tier_1_drill_base.hasMaintenanceMechanics = false;
tier_1_drill_base.hasMufflerMechanics = false;

// Lang	
game.setLocalization(
    "multiblocktweaker.machine.tier_1_drill_base.name",
    "Tier one drill base controller"
);
game.setLocalization(
    "multiblocktweaker.multiblock.tier_1_drill_base.description",
    "i forgor"
);	

game.setLocalization(
    "recipemap.tier_1_drill_base.name",
    "Tier one drill base"
);

// Controller Recipe
recipes.addShaped(
    <gregtech:machine:32001>,
    [
        [<gregtech:fluid_pipe_normal:1617>,         <gregtech:metal_casing:1>,         <gregtech:fluid_pipe_normal:1617>],
        [<minecraft:glass>, <gregtech:metal_casing:1>,  <minecraft:glass>],
        [<gregtech:fluid_pipe_normal:1617>,         <gregtech:metal_casing:1>,         <gregtech:fluid_pipe_normal:1617>]
    ]
);

// Logic to have T1 base actually require 0eu/t
// Shoutouts to kilabash
// JEI doesnt update to show 0eu/t, note this in qb
tier_1_drill_base.setupRecipeFunction = function(recipeLogic as IRecipeLogic, recipe as IRecipe) as bool {
recipeLogic.superSetupRecipe(recipe);
    recipeLogic.recipeEUt = 0;
    return false;
} as ISetupRecipeFunction;

// Recipes	

tier_1_drill_base
	.recipeMap
		.recipeBuilder()
    .duration(500)
	.EUt(-1)
    .inputs(<contenttweaker:tieronedrill>)
	.fluidInputs(<liquid:steam> * 2000)
    .outputs(<gregtech:meta_ingot:25> * 16,
			 <gregtech:meta_ingot:112> * 8,
	         <minecraft:iron_ingot> * 12,
	         <minecraft:redstone> * 8)
    .buildAndRegister();
	
tier_1_drill_base
	.recipeMap
		.recipeBuilder()
    .duration(500)
	.EUt(-1)
    .inputs(<contenttweaker:tiertwodrill>)
	.fluidInputs(<liquid:steam> * 4000)
    .outputs(<minecraft:coal> * 16,
	         <gregtech:meta_dust:103> * 10,
			 <minecraft:iron_ingot> * 20,
	         <gregtech:meta_ingot:25> * 10)
    .buildAndRegister();

// logic

tier_1_drill_base.CompleteRecipeFunction = function(logic as IRecipeLogic) {
    for slot, stack in logic.inputInventory {
	    if(!isNull(stack){
			transformDamage()
		}
	}
} as ICompleteRecipeFunction;
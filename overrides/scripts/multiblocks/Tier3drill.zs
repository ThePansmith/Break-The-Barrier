#priority 997
import mods.gregtech.multiblock.Builder;
import mods.gregtech.multiblock.FactoryBlockPattern;
import mods.gregtech.multiblock.RelativeDirection;
import mods.gregtech.multiblock.functions.IPatternBuilderFunction;
import mods.gregtech.IControllerTile;
import mods.gregtech.multiblock.CTPredicate;
import mods.gregtech.multiblock.IBlockPattern;
import mods.gregtech.recipe.FactoryRecipeMap;
import mods.gregtech.recipe.RecipeMap;

// Multiblock 

var loc = "mbt:tier_3_drill_base";

val tier_3_drill_base = Builder.start(loc)
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
                       return FactoryBlockPattern.start()
            .aisle(
				"F~~~F",
				"F~~~F",
				"BIIIB",
				"~~~~~")
            .aisle(
                "~~~~~",
				"~~~~~",
				"ICCCI",
				"~CCC~")
            .aisle(
                "~~~~~",
				"~~~~~",
				"ICCCI",
				"~CBC~")
            .aisle(
                "~~~~~",
				"~~~~~",
				"ICCCI",
				"~CCC~")
            .aisle(
				"F~~~F",
				"F~~~F",
				"BIEIB",
				"~~~~~")
            .where("E", controller.self())
            .where("~", CTPredicate.getAir())
			.where("F", <metastate:gregtech:meta_block_frame_0:2>)
			.where("B", <metastate:gregtech:boiler_casing:1>)
			.where("C", <metastate:gregtech:metal_casing:4>)
            .where("I", CTPredicate.states(<metastate:gregtech:metal_casing:4>)
                                      | CTPredicate.abilities(<mte_ability:IMPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1) // There is at least one IMPORT_ITEMS bus. JEI preview shows only one.
                                      | CTPredicate.abilities(<mte_ability:EXPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1)
									  | CTPredicate.abilities(<mte_ability:EXPORT_FLUIDS>).setMinGlobalLimited(1).setPreviewCount(1)
                                      | CTPredicate.abilities(<mte_ability:IMPORT_FLUIDS>).setMinGlobalLimited(1).setPreviewCount(1)
                                      | CTPredicate.abilities(<mte_ability:INPUT_ENERGY>).setMinGlobalLimited(1).setMaxGlobalLimited(2).setPreviewCount(1) // There is at least one INPUT_ENERGY hatch and no more than three of it. JEI preview shows only one.
            )
            .build();
    } as IPatternBuilderFunction)
    .withRecipeMap(
        FactoryRecipeMap.start("tier_3_drill_base")
                        .minFluidInputs(1)
                        .maxFluidInputs(1)
                        .maxFluidOutputs(1)
                        .minInputs(1)
						.maxInputs(1)
						.minOutputs(1)
                        .maxOutputs(4)
                        .build())
    .withBaseTexture(<gregtech:metal_casing>.asBlock().definition.getStateFromMeta(4))
    .buildAndRegister();

// set optional properties
tier_3_drill_base.hasMaintenanceMechanics = false;
tier_3_drill_base.hasMufflerMechanics = false;

// Lang	
game.setLocalization(
    "mbt.machine.tier_3_drill_base.name",
    "Tier 3 base controller"
);
game.setLocalization(
    "mbt.multiblock.tier_3_drill_base.description",
    "i forgor"
);	

game.setLocalization(
    "recipemap.tier_3_drill_base.name",
    "Tier three drill base"
);

// Controller Recipe
recipes.addShaped(
    <gregtech:machine:32002>,
    [
        [<gregtech:meta_plate_double:324>, <ore:circuitGood>, <gregtech:meta_plate_double:324>],
        [<gregtech:meta_item_1:143>, <gregtech:machine:987>, <gregtech:meta_item_1:248>],
        [<gregtech:meta_plate_double:324>, <gregtech:meta_item_1:173>, <gregtech:meta_plate_double:324>]
    ]
);

// Recipes	
	
tier_3_drill_base
	.recipeMap
		.recipeBuilder()
    .duration(500)
	.EUt(40)
    .inputs(<contenttweaker:tierfivedrill>)
	.fluidInputs(<liquid:ethylene> * 2000)
    .outputs(<gregtech:ore_quartzite_0> * 10,
			 <gregtech:ore_stibnite_0> * 5,
	         <gregtech:ore_silver_0> * 10,
	         <gregtech:ore_redstone_0> * 10)
    .buildAndRegister();
	
tier_3_drill_base
	.recipeMap
		.recipeBuilder()
    .duration(700)
	.EUt(100)
    .inputs(<contenttweaker:tiersixdrill>)
	.fluidInputs(<liquid:plastic> * 3000)
    .outputs(<gregtech:ore_tantalite_0> * 5,
	         <gregtech:ore_emerald_0> * 3,
			 <gregtech:ore_copper_0> * 15,
	         <gregtech:ore_ruby_0> * 10)
    .buildAndRegister();

	
	

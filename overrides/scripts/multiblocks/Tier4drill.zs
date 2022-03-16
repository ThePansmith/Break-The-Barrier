#priority 996
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

var loc = "mbt:tier_4_drill_base";

val tier_4_drill_base = Builder.start(loc)
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
                       return FactoryBlockPattern.start()
						  .aisle("A~~~A", "A~~~A", "A~~~A", "SSSSS")
                          .aisle("~~~~~", "~~~~~", "~~~~~", "SCCCS")
                          .aisle("~~~~~", "~~~~~", "~~~~~", "SCCCS")
                          .aisle("A~~~A", "A~~~A", "A~~~A", "SSESS")
            .where("E", controller.self())
            .where("~", CTPredicate.getAir())
			.where("A", <metastate:gregtech:meta_block_frame_0:2>)
			.where("I", <metastate:gregtech:metal_casing:5>)
			.where("C", <metastate:gregtech:metal_casing:3>)
            .where("S", CTPredicate.states(<metastate:gregtech:metal_casing:5>)
                                      | CTPredicate.abilities(<mte_ability:IMPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1) // There is at least one IMPORT_ITEMS bus. JEI preview shows only one.
                                      | CTPredicate.abilities(<mte_ability:EXPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1)
                                      | CTPredicate.abilities(<mte_ability:IMPORT_FLUIDS>).setMinGlobalLimited(1).setPreviewCount(1)
                                      | CTPredicate.abilities(<mte_ability:INPUT_ENERGY>).setMinGlobalLimited(1).setMaxGlobalLimited(2).setPreviewCount(1) // There is at least one INPUT_ENERGY hatch and no more than three of it. JEI preview shows only one.
            )
            .build();
    } as IPatternBuilderFunction)
    .withRecipeMap(
        FactoryRecipeMap.start("tier_4_drill_base")
                        .minFluidInputs(1)
                        .maxFluidInputs(1)
                        .minInputs(1)
						.maxInputs(1)
						.minOutputs(1)
                        .maxOutputs(9)
                        .build())
    .withBaseTexture(<gregtech:metal_casing>.asBlock().definition.getStateFromMeta(5))
    .buildAndRegister();

// set optional properties
tier_4_drill_base.hasMaintenanceMechanics = false;
tier_4_drill_base.hasMufflerMechanics = false;

// Lang	
game.setLocalization(
    "mbt.machine.tier_4_drill_base.name",
    "Tier 4 Base Controller"
);
game.setLocalization(
    "mbt.multiblock.tier_4_drill_base.description",
    "is anyone even reading this"
);	

game.setLocalization(
    "recipemap.tier_4_drill_base.name",
    "Tier three drill base"
);

// Controller Recipe
recipes.addShaped(
    <gregtech:machine:32003>,
    [
        [<gregtech:meta_plate_double:324>, <ore:circuitGood>, <gregtech:meta_plate_double:324>],
        [<gregtech:meta_item_1:143>, <gregtech:machine:987>, <gregtech:meta_item_1:248>],
        [<gregtech:meta_plate_double:324>, <gregtech:meta_item_1:173>, <gregtech:meta_plate_double:324>]
    ]
);

// Recipes	
	
tier_4_drill_base
	.recipeMap
		.recipeBuilder()
    .duration(500)
	.EUt(512)
    .inputs(<contenttweaker:tiersevendrill>)
	.fluidInputs(<liquid:ethylene> * 2000)
    .outputs(<gregtech:ore_quartzite_0> * 10,
			 <gregtech:ore_stibnite_0> * 5,
	         <gregtech:ore_silver_0> * 10,
	         <gregtech:ore_redstone_0> * 10)
    .buildAndRegister();
	
tier_4_drill_base
	.recipeMap
		.recipeBuilder()
    .duration(300)
	.EUt(512)
    .inputs(<contenttweaker:tiereightdrill>)
	.fluidInputs(<liquid:rocket_fuel> * 1000)
    .outputs(<gregtech:ore_quartzite_0> * 10,
			 <gregtech:ore_stibnite_0> * 5,
	         <gregtech:ore_silver_0> * 10,
	         <gregtech:ore_redstone_0> * 10)
    .buildAndRegister();
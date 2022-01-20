#priority 2

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



var loc = "mbt:tier_two_drill_base";

val tier_two_drill_base = Builder.start(loc)
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
                       return FactoryBlockPattern.start()
            .aisle(
                "F~F",
                "~C~",
                "F~F")
            .aisle(
                "F~F",
                "~C~",
                "F~F")
            .aisle(
                "III",
                "IBI",
                "IEI")
            .where("E", controller.self())
            .where("~", CTPredicate.getAir())
			.where("F", <gregtech:meta_block_frame_20:4>)
			.where("C", <minecraft:iron_bars>)
			.where("S", <gregtech:meta_block_frame_20:4>)
			.where("B", <gregtech:meta_block_compressed_157:5>)
			.where("C", CTPredicate.states(<metastate:gregtech:metal_casing:4>)
                                      | CTPredicate.abilities(<mte_ability:IMPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1) // There is at least one IMPORT_ITEMS bus. JEI preview shows only one.
                                      | CTPredicate.abilities(<mte_ability:EXPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1)
                                      | CTPredicate.abilities(<mte_ability:IMPORT_FLUIDS>).setMinGlobalLimited(1).setPreviewCount(1)
                                      | CTPredicate.abilities(<mte_ability:INPUT_ENERGY>).setMinGlobalLimited(1).setMaxGlobalLimited(2).setPreviewCount(1) // There is at least one INPUT_ENERGY hatch and no more than three of it. JEI preview shows only one.
            )
            .build();
    } as IPatternBuilderFunction)
    .withRecipeMap(
        FactoryRecipeMap.start("tier_two_drill_base")
                        .minFluidInputs(1)
                        .maxFluidInputs(1)
                        .minInputs(1)
						.maxInputs(2)
						.minOutputs(1)
                        .maxOutputs(4)
                        .build())
    .withBaseTexture(<gregtech:turbine_casing>.asBlock().definition.getStateFromMeta(3))
    .buildAndRegister();

// set optional properties
tier_two_drill_base.hasMaintenanceMechanics = false;
tier_two_drill_base.hasMufflerMechanics = false;


// Lang	
game.setLocalization(
    "multiblocktweaker.machine.tier_two_drill_base.name",
    "Tier two drill base controller"
);
game.setLocalization(
    "multiblocktweaker.multiblock.tier_two_drill_base.description",
    "i forgor"
);	

game.setLocalization(
    "recipemap.tier_two_drill_base.name",
    "Tier two drill base"
);

// Controller Recipe
recipes.addShaped( <gregtech:machine:3000>,
    [
        [<minecraft:dirt>,         null ,         null],
        [null , null ,  null ],
        [null ,         null ,         null]
    ]
);

// Recipes	
	
tier_two_drill_base
	.recipeMap
		.recipeBuilder()
    .duration(300)
	.EUt(16)
    .inputs(<contenttweaker:tierthreedrill>)
	.fluidInputs(<liquid:lubricant> * 2000)
    .outputs(<gregtech:ore_iron_0> * 10,
			 <gregtech:ore_tin_0> * 16,
	         <gregtech:ore_copper_0> * 10,
	         <gregtech:ore_soapstone_0> * 8)
    .buildAndRegister();
	
tier_two_drill_base
	.recipeMap
		.recipeBuilder()
    .duration(400)
	.EUt(24)
    .inputs(<contenttweaker:tierfourdrill>)
	.fluidInputs(<liquid:drilling_fluid> * 2000)
    .outputs(<gregtech:ore_aluminium_0:2> * 16,
	         <gregtech:ore_nickel_0:2> * 10,
	         <gregtech:ore_gold_0:2> * 10,
			 <gregtech:ore_sphalerite_0> * 5)
    .buildAndRegister();
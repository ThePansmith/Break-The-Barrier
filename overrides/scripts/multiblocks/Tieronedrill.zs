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


var loc = "mbt:tier_one_drill_base";

val tier_one_drill_base = Builder.start(loc)
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
			.aisle(
                "SSS",
                "SSS",
                "SSS")
            .where("E", controller.self())
			.where("F", <gregtech:metal_casing:1>)
            .where("~", CTPredicate.getAir())
			.where("C", <minecraft:cobblestone_wall>)
			.where("S", <gregtech:metal_casing:1>)
			.where("B", <gregtech:metal_casing>)
            .where("I", CTPredicate.states(<metastate:gregtech:metal_casing>)
                                      | CTPredicate.abilities(<mte_ability:IMPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1) // There is at least one IMPORT_ITEMS bus. JEI preview shows only one.
                                      | CTPredicate.abilities(<mte_ability:EXPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1)
                                      | CTPredicate.abilities(<mte_ability:IMPORT_FLUIDS>).setMinGlobalLimited(1).setPreviewCount(1)
            )              
            .build();
    } as IPatternBuilderFunction)
	    .withRecipeMap(
		FactoryRecipeMap.start("tier_one_drill_base")
                        .minFluidInputs(1)
                        .maxFluidInputs(1)
                        .minInputs(1)
						.maxInputs(1)
						.minOutputs(1)
                        .maxOutputs(4)
                        .build())
		.withBaseTexture(<gregtech:metal_casing>.asBlock().definition.getStateFromMeta(1))
		.buildAndRegister();
// set optional properties
tier_one_drill_base.hasMaintenanceMechanics = false;
tier_one_drill_base.hasMufflerMechanics = false;

// Lang	
game.setLocalization(
    "multiblocktweaker.machine.tier_one_drill_base.name",
    "Tier one drill base controller"
);
game.setLocalization(
    "multiblocktweaker.multiblock.tier_one_drill_base.description",
    "i forgor"
);	

game.setLocalization(
    "recipemap.tier_one_drill_base.name",
    "Tier one drill base"
);

// Controller Recipe
recipes.addShaped(
    <gregtech:machine:3000>,
    [
        [<gregtech:fluid_pipe_normal:1617>,         <gregtech:fluid_pipe_normal:1617>,         <gregtech:fluid_pipe_normal:1617>],
        [<minecraft:glass>, <gregtech:metal_casing:1>,  <minecraft:glass>],
        [<gregtech:fluid_pipe_normal:1617>,         <gregtech:metal_casing:1>,         <gregtech:fluid_pipe_normal:1617>]
    ]
);

// Recipes	
	
tier_one_drill_base
	.recipeMap
    .recipeBuilder()
    .duration(500)
    .inputs(<contenttweaker:tieronedrill>)
	.fluidInputs(<liquid:steam> * 2000)
    .outputs(<gregtech:meta_ingot:25> * 16,
			 <gregtech:meta_ingot:112> * 8,
	         <minecraft:iron_ingot> * 12,
	         <minecraft:redstone> * 8)
    .buildAndRegister();
	
tier_one_drill_base
	.recipeMap
    .recipeBuilder()
    .duration(500)
    .inputs(<contenttweaker:tiertwodrill>)
	.fluidInputs(<liquid:steam> * 4000)
    .outputs(<minecraft:coal> * 16,
	         <gregtech:meta_dust:103> * 10,
			 <minecraft:iron_ingot> * 20,
	         <gregtech:meta_ingot:25> * 10)
    .buildAndRegister();
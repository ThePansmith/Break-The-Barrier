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

import scripts.custom_classes.IPlantRecipe.IPlantRecipe;
import scripts.custom_classes.IPlantFluid.IPlantFluid;

// Multiblock 


// Multiblock 

var loc = "mbt:greenhouse";

val greenhouse = Builder.start(loc)
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
        FactoryRecipeMap.start("greenhouse")
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
greenhouse.hasMaintenanceMechanics = false;
greenhouse.hasMufflerMechanics = false;

// Lang	
game.setLocalization(
    "multiblocktweaker.machine.greenhouse.name",
    "Tier one drill base controller"
);
game.setLocalization(
    "multiblocktweaker.multiblock.greenhouse.description",
    "i forgor"
);	

game.setLocalization(
    "recipemap.greenhouse.name",
    "Tier one drill base"
);

// Controller Recipe
recipes.addShaped(
    <gregtech:machine:32015>,
    [
        [<gregtech:meta_item_1:144>,   <ore:circuitExtreme>,           <gregtech:meta_item_1:144>],
        [<gregtech:metal_casing:5>,    <gregtech:machine:988>,         <gregtech:metal_casing:5>],
        [<ore:blockGlowstone>,         <gregtech:multiblock_casing:2>, <ore:blockGlowstone>]
    ]
);

val Fluids = {
	//duration : fluid * amount
	200 : <liquid:ammonium_nitrate> * 500
	// More to come
} as ILiquidStack[int];

val Plants = {
	//EUt : [[[inputs],[outputs]], [[inputs],[outputs]], etc]
	60 : [
		[[<minecraft:sapling>], [<minecraft:log> * 4, <minecraft:sapling>]],
		[[<minecraft:sapling:1>], [<minecraft:log:1> * 4, <minecraft:sapling:1>]],
		[[<minecraft:sapling:2>], [<minecraft:log:2> * 4, <minecraft:sapling:2>]],
		[[<minecraft:sapling:3>], [<minecraft:log:3> * 4, <minecraft:sapling:3>]],
		[[<minecraft:sapling:4>], [<minecraft:log2> * 4, <minecraft:sapling:4>]],
		[[<minecraft:sapling:5>], [<minecraft:log2:1> * 4, <minecraft:sapling:5>]],
		[[<gregtech:rubber_sapling>], [<gregtech:rubber_log> * 4, <gregtech:rubber_sapling>]]
	],
	32 : [
		[[<minecraft:reeds>], [<minecraft:reeds> * 6, <minecraft:reeds> * 2]],
		[[<minecraft:wheat_seeds>], [<minecraft:wheat> * 2, <minecraft:wheat_seeds> * 6]]
	]
} as IItemStack[][][][int];

for EUt, recipes in Plants {
	for recipe in recipes {
		for duration, fluid in Fluids {
			<multiblock:mbt:greenhouse>.recipeMap.recipeBuilder()
				.inputs(recipe[0])
				.fluidInputs(fluid)
				.outputs(recipe[1])
				.duration(duration)
				.EUt(EUt)
				.buildAndRegister();
		}
	}
}

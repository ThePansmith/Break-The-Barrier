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



// IPlantFluid(fluid, amount, duration)
val ammoniumnitrate as IPlantFluid = IPlantFluid(<liquid:ammonium_nitrate>, 500, 200);
// More to come

val Fluids as IPlantFluid[] = [
	ammoniumnitrate
];

// IPlantRecipe (Input, Output, 2nd Output, EUt)
val oak as IPlantRecipe = IPlantRecipe(<minecraft:sapling>, <minecraft:log> * 4, <minecraft:sapling>, 60);
val spruce as IPlantRecipe = IPlantRecipe(<minecraft:sapling:1>, <minecraft:log:1> * 4, <minecraft:sapling:1>, 60);
val birch as IPlantRecipe = IPlantRecipe(<minecraft:sapling:2>, <minecraft:log:2> * 4, <minecraft:sapling:2>, 60);
val jungle as IPlantRecipe = IPlantRecipe(<minecraft:sapling:3>, <minecraft:log:3> * 4, <minecraft:sapling:3>, 60);
val acacia as IPlantRecipe = IPlantRecipe(<minecraft:sapling:4>, <minecraft:log:4> * 4, <minecraft:sapling:4>, 60);
val darkoak as IPlantRecipe = IPlantRecipe(<minecraft:sapling:5>, <minecraft:log:5> * 4, <minecraft:sapling:5>, 60);
val rubber as IPlantRecipe = IPlantRecipe(<gregtech:rubber_sapling>, <gregtech:rubber_log> * 4, <gregtech:rubber_sapling>, 60);
val sugarcane as IPlantRecipe = IPlantRecipe(<minecraft:reeds>, <minecraft:reeds> * 6, <minecraft:reeds> * 2, 32);
val seeds as IPlantRecipe = IPlantRecipe(<minecraft:wheat_seeds>, <minecraft:wheat> * 2, <minecraft:wheat_seeds> * 6, 32);

val Plants as IPlantRecipe[] = [
	oak,
	spruce,
	birch,
	jungle,
	acacia,
	darkoak,
	rubber,
	sugarcane,
	seeds
];

for Plant in Plants {
	for Fluid in Fluids {
			<multiblock:multiblocktweaker:greenhouse>.recipeMap.recipeBuilder()
				.inputs([Plant.getInput()])
				.fluidInputs([Fluid.Fluid()])
				.outputs(Plant.getOutput())
				.outputs(Plant.getOutput2())
				.duration(Fluid.getDuration())
				.EUt(Plant.getEUt())
				.buildAndRegister();
				}
}

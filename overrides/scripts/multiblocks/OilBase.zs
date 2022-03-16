#priority 994
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
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

// Multiblock 

var loc = "mbt:oildrill";

val oildrill = Builder.start(loc)
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
                       return FactoryBlockPattern.start()
			              .aisle("F~~~F", "F~~~F", "PMMMP", "~~~~~")
                          .aisle("~~~~~", "~~~~~", "MSSSM", "~SSS~")
                          .aisle("~~~~~", "~~~~~", "MSSSM", "~SSS~")
                          .aisle("F~~~F", "F~~~F", "PMEMP", "~~~~~")
			  .where("E", controller.self())
			  .where("~", CTPredicate.getAir())
			  .where("S", <metastate:gregtech:metal_casing:4>)
			  .where("P", <metastate:gregtech:boiler_casing:1>)
			  .where("F", <metastate:gregtech:meta_block_frame_20:3>)
            		  .where("M", CTPredicate.states(<metastate:gregtech:metal_casing:4>)
                                      | CTPredicate.abilities(<mte_ability:IMPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1)
                                      | CTPredicate.abilities(<mte_ability:EXPORT_FLUIDS>).setMinGlobalLimited(1).setPreviewCount(1)
                                      | CTPredicate.abilities(<mte_ability:IMPORT_FLUIDS>).setMinGlobalLimited(1).setPreviewCount(1)
                                      | CTPredicate.abilities(<mte_ability:INPUT_ENERGY>).setMinGlobalLimited(1).setMaxGlobalLimited(2).setPreviewCount(1)
            )
            .build();
    } as IPatternBuilderFunction)
	    .withRecipeMap(
		FactoryRecipeMap.start("oildrill")
                        .minFluidInputs(1)
                        .maxFluidInputs(1)
                        .minInputs(1)
			.maxInputs(1)
			.minFluidOutputs(1)
                        .maxFluidOutputs(1)
                        .build())
		.withBaseTexture(<gregtech:metal_casing>.asBlock().definition.getStateFromMeta(4))
		.buildAndRegister();

// set optional properties
oildrill.hasMaintenanceMechanics = false;
oildrill.hasMufflerMechanics = false;

// Lang	
game.setLocalization(
    "multiblocktweaker.machine.oildrill.name",
    "Tier one drill base controller"
);
game.setLocalization(
    "multiblocktweaker.multiblock.oildrill.description",
    "i forgor"
);	

game.setLocalization(
    "recipemap.oildrill.name",
    "Tier one drill base"
);

// Controller Recipe
recipes.addShaped(
    <gregtech:machine:32005>,
    [
        [<gregtech:meta_item_1:143>,      <gregtech:machine:1612>,          <gregtech:meta_item_1:143>],
        [<ore:circuitGood>,               <gregtech:meta_block_frame_20:4>, <ore:circuitGood>],
        [<gregtech:fluid_pipe_small:324>, <gregtech:meta_rotor:323>,        <gregtech:fluid_pipe_small:324>]
    ]
);

oildrill
	.recipeMap
		.recipeBuilder()
    .duration(400)
	.EUt(100)
    .inputs(<contenttweaker:oildrill>)
	.fluidInputs(<liquid:plastic> * 1000)
    .fluidOutputs([<liquid:oil> * 6000])
    .buildAndRegister();
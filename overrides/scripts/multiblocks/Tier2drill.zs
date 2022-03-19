#priority 998

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
// Multiblock 



var loc = "mbt:tier_2_drill_base";

val tier_2_drill_base = Builder.start(loc)
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
                       return FactoryBlockPattern.start()
            .aisle(
                "F~F",
                "F~F",
				"F~F",
                "III")
            .aisle(
                "~~~",
				"~~~",
				"~~~",
                "IBI")
            .aisle(
                "F~F",
				"F~F",
				"F~F",
                "IEI")
            .where("E", controller.self())
            .where("~", CTPredicate.getAir())
			.where("F", <metastate:gregtech:meta_block_frame_20:4>)
			.where("B", <metastate:gregtech:meta_block_compressed_157:5>)
			.where("I", CTPredicate.states(<metastate:gregtech:metal_casing:4>)
                                      | CTPredicate.abilities(<mte_ability:IMPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1) // There is at least one IMPORT_ITEMS bus. JEI preview shows only one.
                                      | CTPredicate.abilities(<mte_ability:EXPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1)
                                      | CTPredicate.abilities(<mte_ability:IMPORT_FLUIDS>).setMinGlobalLimited(1).setPreviewCount(1)
                                      | CTPredicate.abilities(<mte_ability:INPUT_ENERGY>).setMinGlobalLimited(1).setMaxGlobalLimited(2).setPreviewCount(1) // There is at least one INPUT_ENERGY hatch and no more than three of it. JEI preview shows only one.
            )
            .build();
    } as IPatternBuilderFunction)
    .withRecipeMap(
        FactoryRecipeMap.start("tier_2_drill_base")
                        .minFluidInputs(1)
                        .maxFluidInputs(1)
                        .minInputs(1)
						.maxInputs(2)
						.minOutputs(1)
                        .maxOutputs(4)
                        .build())
    .withBaseTexture(<gregtech:metal_casing>.asBlock().definition.getStateFromMeta(4))
    .buildAndRegister();

// set optional properties
tier_2_drill_base.hasMaintenanceMechanics = false;
tier_2_drill_base.hasMufflerMechanics = false;


// Lang	
game.setLocalization(
    "multiblocktweaker.machine.tier_2_drill_base.name",
    "Tier two drill base controller"
);
game.setLocalization(
    "multiblocktweaker.multiblock.tier_2_drill_base.description",
    "i forgor"
);	

game.setLocalization(
    "recipemap.tier_2_drill_base.name",
    "Tier two drill base"
);

// Controller Recipe
recipes.addShaped(<gregtech:machine:32001>,
    [
        [<ore:plateSteel>,         <ore:ingotRedAlloy> ,        <ore:plateSteel>],
        [<ore:ingotRedAlloy> ,     <ore:circuitBasic> ,         <ore:ingotRedAlloy> ],
        [<ore:plateSteel> ,        <gregtech:meta_item_1:142> , <ore:plateSteel>]
    ]
);

// Recipes	
	
tier_2_drill_base
	.recipeMap
		.recipeBuilder()
    .duration(300)
	.EUt(16)
    .inputs(<contenttweaker:tierthreedrill>)
	.fluidInputs(<liquid:lubricant> * 2000)
    .outputs(<gregtech:ore_iron_0> * 20,
			 <gregtech:ore_tin_0> * 16,
	         <gregtech:ore_nickel_0> * 10,
	         <gregtech:ore_sphalerite_0> * 5)
    .buildAndRegister();
	
tier_2_drill_base
	.recipeMap
		.recipeBuilder()
    .duration(400)
	.EUt(24)
    .inputs(<contenttweaker:tierfourdrill>)
	.fluidInputs(<liquid:drilling_fluid> * 2000)
    .outputs(<gregtech:ore_aluminium_0> * 16,
	         <gregtech:ore_copper_0> * 10,
	         <gregtech:ore_gold_0> * 10,
			 <gregtech:ore_soapstone_0> * 10)
    .buildAndRegister();
	

//Merged biome drill into here
//.circuit() doesn't work properly for some reason

tier_2_drill_base
	.recipeMap
    .recipeBuilder()
    .duration(300)
	.EUt(30)
    .inputs(<contenttweaker:biomedrill>)
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration: 1}))
	.fluidInputs(<liquid:steam> * 4000)
    .outputs(<minecraft:sapling> * 5,
			 <minecraft:wheat_seeds> * 10,
	         <minecraft:reeds> * 10,
	         <minecraft:red_flower> * 10)
    .buildAndRegister();
	
tier_2_drill_base
	.recipeMap
    .recipeBuilder()
    .duration(300)
	.EUt(30)
    .inputs(<contenttweaker:biomedrill>)
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration: 2}))
	.fluidInputs(<liquid:steam> * 4000)
    .outputs(<minecraft:sponge> * 10,
			 <minecraft:dye> * 15)
    .buildAndRegister();
	
tier_2_drill_base
	.recipeMap
    .recipeBuilder()
    .duration(300)
	.EUt(30)
    .inputs(<contenttweaker:biomedrill>)
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration: 3}))
	.fluidInputs(<liquid:steam> * 4000)
    .outputs(<minecraft:deadbush> * 10,
		     <minecraft:sand:1> * 128,
			 <minecraft:cactus> * 5)
    .buildAndRegister();
	
tier_2_drill_base
	.recipeMap
    .recipeBuilder()
    .duration(300)
	.EUt(30)
    .inputs(<contenttweaker:biomedrill>)
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration: 4}))
	.fluidInputs(<liquid:steam> * 4000)
    .outputs(<minecraft:reeds> * 5,
			 <minecraft:vine> * 10,
			 <minecraft:red_flower:2> * 8)
    .buildAndRegister();
	
tier_2_drill_base
	.recipeMap
    .recipeBuilder()
    .duration(300)
	.EUt(30)
    .inputs(<contenttweaker:biomedrill>)
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration: 5}))
	.fluidInputs(<liquid:steam> * 4000)
    .outputs(<minecraft:sapling:3> * 10,
		     <minecraft:melon> * 3,
			<minecraft:dye:3> * 5)
    .buildAndRegister();
	
tier_2_drill_base
	.recipeMap
    .recipeBuilder()
    .duration(300)
	.EUt(30)
    .inputs(<contenttweaker:biomedrill>)
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration: 6}))
	.fluidInputs(<liquid:steam> * 4000)
    .outputs(<minecraft:sapling:2> * 5,
		     <minecraft:potato> * 3,
			 <minecraft:beetroot_seeds> * 5,
			 <minecraft:red_flower:3> * 10)
    .buildAndRegister();
	
tier_2_drill_base
	.recipeMap
    .recipeBuilder()
    .duration(300)
	.EUt(30)
    .inputs(<contenttweaker:biomedrill>)
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration: 7}))
	.fluidInputs(<liquid:steam> * 4000)
    .outputs(<minecraft:sapling:5> * 4,
			 <minecraft:yellow_flower> * 10)
    .buildAndRegister();
	
tier_2_drill_base
	.recipeMap
    .recipeBuilder()
    .duration(300)
	.EUt(30)
    .inputs(<contenttweaker:biomedrill>)
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration: 8}))
	.fluidInputs(<liquid:steam> * 4000)
    .outputs(<minecraft:sapling:4> * 4,
			 <minecraft:potato> * 10,
			 <minecraft:red_flower:1> * 10)
    .buildAndRegister();
	
tier_2_drill_base
	.recipeMap
    .recipeBuilder()
    .duration(300)
	.EUt(30)
    .inputs(<contenttweaker:biomedrill>)
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration: 9}))
	.fluidInputs(<liquid:steam> * 4000)
    .outputs(<minecraft:sapling:1> * 4,
			 <minecraft:pumpkin_seeds> * 5,
			 <minecraft:tallgrass:2> * 5,
			 <minecraft:double_plant:3> * 5)
    .buildAndRegister();

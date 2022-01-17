
import mods.gregtech.recipe.FactoryRecipeMap;
## This techincally falls under the tier two drill, but should have its own page give how many missions it has.

tier_two_drill_base
	.recipeMap
    .recipeBuilder()
    .duration(300)
	.EUt(30)
    .inputs(<contenttweaker:biomedrill>)
	.circuit(1)
	.fluidInputs(<liquid:steam> * 4000)
    .outputs(<minecraft:sapling> * 5,
			 <minecraft:wheat_seeds> * 10,
	         <minecraft:double_plant:2> * 10,
	         <minecraft:red_flower> * 10)
    .buildAndRegister();
	
tier_two_drill_base
	.recipeMap
    .recipeBuilder()
    .duration(300)
	.EUt(30)
    .inputs(<contenttweaker:biomedrill>)
	.circuit(2)
	.fluidInputs(<liquid:steam> * 4000)
    .outputs(<minecraft:sponge> * 10,
			 <minecraft:dye> * 15)
    .buildAndRegister();
	
tier_two_drill_base
	.recipeMap
    .recipeBuilder()
    .duration(300)
	.EUt(30)
    .inputs(<contenttweaker:biomedrill>)
	.circuit(3)
	.fluidInputs(<liquid:steam> * 4000)
    .outputs(<minecraft:deadbush> * 10,
		     <minecraft:sand:1> * 128,
			 <minecraft:cactus> * 5)
    .buildAndRegister();
	
tier_two_drill_base
	.recipeMap
    .recipeBuilder()
    .duration(300)
	.EUt(30)
    .inputs(<contenttweaker:biomedrill>)
	.circuit(4)
	.fluidInputs(<liquid:steam> * 4000)
    .outputs(<minecraft:reeds> * 5,
			 <minecraft:vine> * 10,
			 <minecraft:red_flower:2> * 8)
    .buildAndRegister();
	
tier_two_drill_base
	.recipeMap
    .recipeBuilder()
    .duration(300)
	.EUt(30)
    .inputs(<contenttweaker:biomedrill>)
	.circuit(5)
	.fluidInputs(<liquid:steam> * 4000)
    .outputs(<minecraft:sapling:3> * 10,
		     <minecraft:melon> * 3,
			<minecraft:dye:3> * 5)
    .buildAndRegister();
	
tier_two_drill_base
	.recipeMap
    .recipeBuilder()
    .duration(300)
	.EUt(30)
    .inputs(<contenttweaker:biomedrill>)
	.circuit(6)
	.fluidInputs(<liquid:steam> * 4000)
    .outputs(<minecraft:sapling:2> * 5,
		     <minecraft:potato> * 3,
			 <minecraft:beetroot_seeds> * 5,
			 <minecraft:red_flower:3> * 10)
    .buildAndRegister();
	
tier_two_drill_base
	.recipeMap
    .recipeBuilder()
    .duration(300)
	.EUt(30)
    .inputs(<contenttweaker:biomedrill>)
	.circuit(7)
	.fluidInputs(<liquid:steam> * 4000)
    .outputs(<minecraft:sapling:5> * 4,
			 <minecraft:yellow_flower> * 10)
    .buildAndRegister();
	
tier_two_drill_base
	.recipeMap
    .recipeBuilder()
    .duration(300)
	.EUt(30)
    .inputs(<contenttweaker:biomedrill>)
	.circuit(8)
	.fluidInputs(<liquid:steam> * 4000)
    .outputs(<minecraft:sapling:4> * 4,
			 <minecraft:potato> * 10,
			 <minecraft:red_flower:1> * 10)
    .buildAndRegister();
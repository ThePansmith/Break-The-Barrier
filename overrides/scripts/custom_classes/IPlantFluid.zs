#priority 500

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;

zenClass IPlantFluid{
	
	val Fluid as ILiquidStack;
	
	var amount as int;
	var time as int;
	
	zenConstructor(Fluid as ILiquidStack, amount as int, time as int){
		this.Fluid = Fluid;
		this.amount = amount;
		this.time = time;
	}
	
	function getColdFluid() as ILiquidStack{
		return (this.Fluid*amount);
	}
	
	function getDuration() as int{
		return this.time;
	}
}
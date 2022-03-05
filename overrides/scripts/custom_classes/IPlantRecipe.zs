#priority 500

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;

zenClass IPlantRecipe {
	
	val Input as IItemStack;
	val Output as IItemStack;
	val Output2 as IItemStack;
	val EUt as int;
	
	zenConstructor(Input as IItemStack, Output as IItemStack, Output2 as IItemStack, EUt as int){
		this.Input = Input;
		this.Output = Output;
		this.EUt = EUt;
	}
	
	function getInput() as IItemStack{
		return this.Input;
	}
	
	function getOutput() as IOreDictEntry{
		return this.Output;
	}
	
	function getOutput2() as IOreDictEntry{
		return this.Output2;
	}
	
	function getEUt() as int {
		return this.EUt;
	}
}
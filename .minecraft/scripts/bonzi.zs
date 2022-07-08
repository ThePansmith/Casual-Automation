import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.data.IData;
import scripts.CommonVars.makeShaped as makeShaped;
import mods.thermalexpansion.InductionSmelter;

recipes.remove(<bonsaitrees:bonsaipot>);
makeShaped("bonsaipot", <bonsaitrees:bonsaipot>,
	["   ",
	 "I I",
	 "III"],
	{ I : <ore:ingotInfusedMetal>
	  });

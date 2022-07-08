import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.data.IData;
import scripts.CommonVars.makeShaped as makeShaped;

// Plus lazyae2 but idc

// Fluix
mods.threng.Aggregator.removeRecipe(<appliedenergistics2:material:7>);
// Bad Recipe
mods.thermalexpansion.InductionSmelter.addRecipe(<contenttweaker:material_part:15>, <thermalfoundation:material:160>, <minecraft:redstone> * 8, 2000);
mods.thermalexpansion.InductionSmelter.addRecipe(<appliedenergistics2:material:7>, <appliedenergistics2:material:1>, <contenttweaker:material_part:11> * 2, 2000);
// Good Recipe
mods.threng.Aggregator.addRecipe(<appliedenergistics2:material:7>, <appliedenergistics2:material:1>, <minecraft:redstone> * 5, <thermalfoundation:material:132>);
mods.threng.Aggregator.addRecipe(<appliedenergistics2:material:7>, <appliedenergistics2:material:1>, <minecraft:redstone> * 5, <minecraft:coal>);

// Fluix Steel 
mods.thermalexpansion.InductionSmelter.addRecipe(<threng:material>, <thermalfoundation:material:160>, <appliedenergistics2:material:8>, 1000);

makeShaped("FluixSteelBlock", <contenttweaker:fluixsteelblock>,
	["FFF",
	 "FFF",
	 "FFF"],
	{ F: <threng:material>
	  });
recipes.addShapeless(<threng:material> * 9, [<contenttweaker:fluixsteelblock>]);

// Machines 
recipes.remove(<threng:machine>);
makeShaped("pulsecentrifuge", <threng:machine>,
	["SSS",
	 "GCG",
	 "SSS"],
	{ S : <threng:material>,
	  G : <appliedenergistics2:quartz_glass>,
	  C : <thermalexpansion:frame>
	  });

recipes.remove(<threng:machine:2>);
makeShaped("circuitetcher", <threng:machine:2>,
	["SPS",
	 "GCG",
	 "IBI"],
	{ S : <threng:material>,
	  G : <appliedenergistics2:quartz_vibrant_glass>,
	  C : <thermalexpansion:frame>,
	  P : <minecraft:piston>,
	  I : <ore:blockSteel>,
	  B : <contenttweaker:fluixsteelblock>
	  });
	  
	  
mods.threng.Etcher.addRecipe(<appliedenergistics2:material:23>, <appliedenergistics2:material>);

<contenttweaker:facade>.addTooltip(format.aqua("Check this item's JEI tab to see how AE2 facades and thermal covers are crafted"));
mods.jei.JEI.addDescription(<contenttweaker:facade>, "AE2 facades are crafted by surrounding your block of choice with cable anchors.", "", "Like so:","","  C ","CBC","  C "," ", "Where C is cable anchor and B is your block of choice."," ","Note that this does not work for most tile entities. (machines, chests, etc)", "For thermal covers, simply combine a structralduct with your block of choice in a crafting table");

// For a later update
mods.threng.Aggregator.removeRecipe(<threng:material:6>);

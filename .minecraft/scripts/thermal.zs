import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.data.IData;
import scripts.CommonVars.makeShaped as makeShaped;
import mods.thermalexpansion.InductionSmelter;

// Dynamos 

	  
// Machines
recipes.remove(<thermalexpansion:machine:3>);
makeShaped("inductionsmelter", <thermalexpansion:machine:3>,
	[" I ",
	 "SFS",
	 "CRC"],
	{ S : <ore:sand>,
	  I : <ore:gearIron>,
	  F : <thermalexpansion:frame>,
	  R : <thermalfoundation:material:513>
	  });
recipes.remove(<thermalexpansion:machine:5>);
makeShaped("compactor", <thermalexpansion:machine:5>,
	[" I ",
	 "SFS",
	 "CRC"],
	{ S : <ore:blockBronze>,
	  I : <minecraft:piston>,
	  F : <thermalexpansion:frame>,
	  R : <thermalfoundation:material:513>,
	  C : <ore:gearBronze>
	  });

recipes.remove(<thermalexpansion:machine:1>);
makeShaped("pulver", <thermalexpansion:machine:1>,
	["PIP",
	 "SFS",
	 "CRC"],
	{ S : <ore:gearSteel>,
	  I : <minecraft:piston>,
	  F : <thermalexpansion:frame>,
	  R : <thermalfoundation:material:513>,
	  C : <ore:blockSteel>,
	  P : <thermalfoundation:material:352>
	  });
	  
recipes.remove(<thermalexpansion:machine:9>);
makeShaped("charger", <thermalexpansion:machine:9>,
	["PLP",
	 "TFT",
	 "GRG"],
	{ P : <ore:plateSteel>,
	  L : <ore:gearLead>,
	  F : <thermalexpansion:frame>,
	  T : <thermalfoundation:material:514>,
	  R : <thermalfoundation:material:513>,
	  G : <ore:gearBronze>
	  });
	  
recipes.remove(<thermalexpansion:machine:6>);
makeShaped("magmacruc", <thermalexpansion:machine:6>,
	["PLP",
	 "TFT",
	 "GRG"],
	{ P : <ore:blockSteel>,
	  L : <minecraft:bucket>,
	  F : <thermalexpansion:frame>,
	  T : <minecraft:nether_brick>,
	  R : <thermalfoundation:material:513>,
	  G : <ore:gearInvar>
	  });

recipes.remove(<thermalexpansion:machine:8>);
makeShaped("fluidtrans", <thermalexpansion:machine:8>,
	["PLP",
	 "TFT",
	 "GRG"],
	{ P : <ore:plateSteel>,
	  L : <minecraft:bucket>,
	  F : <thermalexpansion:frame>,
	  T : <ore:blockGlass>,
	  R : <thermalfoundation:material:513>,
	  G : <ore:gearInvar>
	  });
// Devices

// Augments
recipes.remove(<thermalexpansion:augment:258>);
makeShaped("pyroaugment", <thermalexpansion:augment:258>,
	[" G ",
	 "PSP",
	 " B "],
	{ P : <ore:plateInvar>,
      S : <thermalfoundation:material:512>,
	  G : <ore:gearInfusedMetal>,
	  B : <minecraft:nether_brick>
	  });
// Crafting Parts/Misc
recipes.remove(<thermalexpansion:frame:128>);
makeShaped("frame", <thermalexpansion:frame:128>,
	["PGP",
	 "GLG",
	 "PGP"],
	{ P : <ore:plateBronze>,
      L : <thermalfoundation:material:259>,
	  G : <ore:blockGlass>
	  });
recipes.remove(<thermalexpansion:augment:576>);
makeShaped("boiler", <thermalexpansion:augment:576>,
	[" G ",
	 "PBP",
	 " F "],
	{ G : <ore:plateBronze>,
      P : <thermalfoundation:material:352>,
	  B : <minecraft:bucket>,
	  F : <appliedenergistics2:quartz_vibrant_glass>
	  });
	  
recipes.remove(<thermalexpansion:augment:640>);
makeShaped("turbine", <thermalexpansion:augment:640>,
	[" G ",
	 "PBP",
	 " F "],
	{ G : <thermalfoundation:material:291>,
      P : <thermalfoundation:material:354>,
	  B : <thermalfoundation:material:514>,
	  F : <thermalfoundation:material:160>
	  });
	  
recipes.remove(<thermaldynamics:relay>);
makeShaped("redstonerelay", <thermaldynamics:relay> * 4,
	["   ",
	 "NQN",
	 "LRL"],
	{ N : <ore:nuggetRedAlloy>,
      Q : <minecraft:quartz>,
	  L : <thermalfoundation:material:131>,
	  R : <minecraft:redstone>
	  });
	  
recipes.replaceAllOccurences(<thermalfoundation:material:515>, <thermalfoundation:material:513>, <thermalexpansion:cell>);


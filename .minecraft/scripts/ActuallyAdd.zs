import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.data.IData;
import scripts.CommonVars.makeShaped as makeShaped;
import mods.thermalexpansion.InductionSmelter;

// Machines
recipes.remove(<actuallyadditions:block_miner>);
makeShaped("aaminer", <actuallyadditions:block_miner>,
	["PHP",
	 "HIH",
	 "PDP"],
	{ H : <ore:blockRedAlloy>,
	  I : <thermalexpansion:frame>,
	  P : <thermalfoundation:storage_alloy:2>,
	  D : <thermalfoundation:material:656>
	  });
	  
recipes.remove(<actuallyadditions:block_atomic_reconstructor>);
makeShaped("atomicrecon", <actuallyadditions:block_atomic_reconstructor>,
	["PPP",
	 "HIL",
	 "PPP"],
	{ P : <ore:plateEmpoweredMetal>,
	  I : <actuallyadditions:block_misc:9>,
	  L : <actuallyadditions:item_misc:18>,
	  R : <ore:ingotRedAlloy>
	  });

recipes.remove(<actuallyadditions:block_empowerer>);
makeShaped("empowerer", <actuallyadditions:block_empowerer>,
	["   ",
	 "PCP",
	 "FEF"],
	{ P : <ore:plateEmpoweredMetal>,
	  C : <thermalexpansion:frame:128>,
	  F : <actuallyadditions:item_crystal>,
	  E : <actuallyadditions:block_display_stand>
	  });
	
recipes.remove(<actuallyadditions:block_empowerer>);
makeShaped("farmer", <actuallyadditions:block_empowerer>,
	["PSP",
	 "BFB",
	 "PBP"],
	{ P : <ore:plateInfusedMetal>,
	  S : <actuallyadditions:item_canola_seed>,
	  F : <thermalexpansion:frame>,
	  B : <actuallyadditions:block_misc:2>
	  });
	
// Misc
recipes.remove(<actuallyadditions:block_misc:9>);
makeShaped("ironcasing", <actuallyadditions:block_misc:9>,
	["PHP",
	 "HIH",
	 "PHP"],
	{ H : <appliedenergistics2:quartz_glass>,
	  I : <ore:blockIron>,
	  P : <ore:plateEmpoweredMetal>
	  });
	  
recipes.remove(<actuallyadditions:item_tele_staff>);
makeShaped("telestaff", <actuallyadditions:item_tele_staff>,
	["  G",
	 "RE ",
	 "SR "],
	{ S : <ore:ingotSteel>,
	  R : <thermalfoundation:material:514>,
	  E : <actuallyadditions:block_misc:6>,
	  G : <ore:ingotGold>
	  });

recipes.remove(<actuallyadditions:block_phantom_booster>);
makeShaped("phantombooster", <actuallyadditions:block_phantom_booster>,
	["PLP",
	 "DID",
	 "PDP"],
	{ P : <thermalfoundation:material:352>,
	  L : <minecraft:lapis_block>,
	  D : <minecraft:diamond>,
	  I : <thermalfoundation:material:162>
	  });
	  
recipes.remove(<actuallyadditions:item_misc:7>);
makeShaped("basiccoil", <actuallyadditions:item_misc:7>,
	[" RB",
	 "RIR",
	 "BR "],
	{ B : <ore:gemQuartzBlack>,
	  I : <actuallyadditions:item_crystal:5>,
	  R : <actuallyadditions:item_crystal>
	  });
	  
recipes.remove(<actuallyadditions:item_misc:8>);
makeShaped("advcoil", <actuallyadditions:item_misc:8>,
	["EIE",
	 "ICI",
	 "EIE"],
	{ E : <ore:nuggetEmpoweredMetal>,
	  I : <ore:nuggetInfusedMetal>,
	  C : <actuallyadditions:item_misc:7>
	  });
	  
// Empowered Crystals
for i in [0,1,2,3,4,5] as int[] {
	mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:item_crystal_empowered>.withDamage(i));
}

mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:item_crystal_empowered:3>, <actuallyadditions:item_crystal:3>, <thermalfoundation:material:160>, <thermalfoundation:material:802>, <minecraft:coal:1>, <actuallyadditions:item_misc:22>, 1000, 100, [0.5, 0.3, 0.2]);
mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:item_crystal_empowered:5>, <actuallyadditions:item_crystal:5>, <thermalfoundation:material:162>, <minecraft:dye:15>, <minecraft:quartz>, <ore:woolWhite>, 1000, 100, [0.5, 0.3, 0.2]);
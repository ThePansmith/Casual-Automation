import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.data.IData;
import scripts.CommonVars.makeShaped as makeShaped;
import mods.thermalexpansion.InductionSmelter;

// Bronze
recipes.remove(<thermalfoundation:material:99>);
// Invar
recipes.remove(<thermalfoundation:material:98>);
mods.thermalexpansion.InductionSmelter.removeRecipe(<thermalfoundation:material:133>, <thermalfoundation:material>);
mods.thermalexpansion.InductionSmelter.removeRecipe(<thermalfoundation:material:133>, <minecraft:iron_ingot>);
// Steel
mods.thermalexpansion.InductionSmelter.removeRecipe(<thermalfoundation:material:768>, <thermalfoundation:material>);
mods.thermalexpansion.InductionSmelter.removeRecipe(<thermalfoundation:material:769>, <thermalfoundation:material>);
mods.thermalexpansion.InductionSmelter.removeRecipe(<thermalfoundation:material:802>, <thermalfoundation:material>);
mods.thermalexpansion.InductionSmelter.removeRecipe(<thermalfoundation:material:768>, <minecraft:iron_ingot>);
mods.thermalexpansion.InductionSmelter.removeRecipe(<thermalfoundation:material:769>, <minecraft:iron_ingot>);
mods.thermalexpansion.InductionSmelter.removeRecipe(<thermalfoundation:material:802>, <minecraft:iron_ingot>);

mods.thermalexpansion.InductionSmelter.addRecipe(<thermalfoundation:material:160>, <minecraft:coal> * 4, <minecraft:iron_ingot>, 5000);
mods.thermalexpansion.InductionSmelter.addRecipe(<thermalfoundation:material:160>, <minecraft:coal> * 4, <thermalfoundation:material>, 5000);
mods.thermalexpansion.InductionSmelter.addRecipe(<thermalfoundation:material:160>, <thermalfoundation:material:768> * 4, <minecraft:iron_ingot>, 5000);
mods.thermalexpansion.InductionSmelter.addRecipe(<thermalfoundation:material:160>, <thermalfoundation:material:768> * 4, <thermalfoundation:material>, 5000);
mods.thermalexpansion.InductionSmelter.addRecipe(<thermalfoundation:material:160>, <thermalfoundation:material:802> * 2, <minecraft:iron_ingot>, 3500);
mods.thermalexpansion.InductionSmelter.addRecipe(<thermalfoundation:material:160>, <thermalfoundation:material:802> * 2, <thermalfoundation:material>, 3500);
// Infused Ingot
mods.thermalexpansion.Transposer.addFillRecipe(<contenttweaker:material_part:4>, <thermalfoundation:material:162>, <liquid:glowstone> * 1000, 500);
// Empowered Ingot
makeShaped("empoweredingot", <contenttweaker:material_part:10> * 8,
	["III",
	 "IBI",
	 "III"],
	{ I : <contenttweaker:material_part:4>,
	  B : <forge:bucketfilled>.withTag({FluidName: "refinedcanolaoil", Amount: 1000})
	  });
mods.thermalexpansion.Transposer.addFillRecipe(<contenttweaker:material_part:10>, <contenttweaker:material_part:4>, <liquid:empoweredoil> * 50, 500);
//Fluix Steel
// Actual recipe is located in ae2.zs
for i in [0,1,2,3,4] as int[] {
	recipes.replaceAllOccurences(<minecraft:ender_eye>, <threng:material>, <thermaldynamics:retriever>.withDamage(i));
}
recipes.replaceAllOccurences(<ore:enderpearl>, <threng:material>, <ore:blockElevator>);

// Electrium
recipes.remove(<thermalfoundation:material:97>);
mods.thermalexpansion.InductionSmelter.removeRecipe(<thermalfoundation:material:1>, <thermalfoundation:material:66>);
mods.thermalexpansion.InductionSmelter.removeRecipe(<thermalfoundation:material:1>, <thermalfoundation:material:130>);
mods.thermalexpansion.InductionSmelter.removeRecipe(<minecraft:gold_ingot>, <thermalfoundation:material:66>);
mods.thermalexpansion.InductionSmelter.removeRecipe(<minecraft:gold_ingot>, <thermalfoundation:material:130>);

mods.thermalexpansion.InductionSmelter.addRecipe(<thermalfoundation:material:161>, <thermalfoundation:material:1>, <contenttweaker:material_part:6>, 5000);
mods.thermalexpansion.InductionSmelter.addRecipe(<thermalfoundation:material:161>, <thermalfoundation:material:1>, <contenttweaker:material_part:10>, 5000);
mods.thermalexpansion.InductionSmelter.addRecipe(<thermalfoundation:material:161>, <minecraft:gold_ingot>, <contenttweaker:material_part:6>, 5000);
mods.thermalexpansion.InductionSmelter.addRecipe(<thermalfoundation:material:161>, <minecraft:gold_ingot>, <contenttweaker:material_part:10>, 5000);


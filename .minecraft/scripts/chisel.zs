import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.data.IData;
import scripts.CommonVars.makeShaped as makeShaped;

// Shoutouts to Pro_Triforcer for making the initial verison of this script for Break The Barrier 

//AE2 cables
mods.chisel.Carving.addGroup("ae2cables");
for i in [14,1,4,13,5,9,3,11,10,2,6,0,8,7,15,12,16] as int[] {
	mods.chisel.Carving.addVariation("ae2cables", <appliedenergistics2:part>.withDamage(i));
	mods.chisel.Carving.addVariation("ae2cables", <appliedenergistics2:part>.withDamage(i+20));
}

//AE2 interfaces
mods.chisel.Carving.addGroup("interfaces");
 val interfaces = [<appliedenergistics2:interface>,
<appliedenergistics2:fluid_interface>,
<appliedenergistics2:part:440>,
<appliedenergistics2:part:441>] as IItemStack[];

for ing in interfaces {
mods.chisel.Carving.addVariation("interfaces", ing);
}

// AA lasers 
mods.chisel.Carving.addGroup("AAlasers");
 val AAlasers = [<actuallyadditions:block_laser_relay>,
<actuallyadditions:block_laser_relay_fluids>,
<actuallyadditions:block_laser_relay_item>] as IItemStack[];

for ing in AAlasers {
mods.chisel.Carving.addVariation("AAlasers", ing);
}


//Remove metal block uncrafting recipes
recipes.removeByRecipeName("chisel:uncraft_blocksteel");
recipes.removeByRecipeName("chisel:uncraft_blockiron");
recipes.removeByRecipeName("chisel:uncraft_blocktin");
recipes.removeByRecipeName("chisel:uncraft_blockuranium");
recipes.removeByRecipeName("chisel:uncraft_blocksilver");
recipes.removeByRecipeName("chisel:uncraft_blockgold");
recipes.removeByRecipeName("chisel:uncraft_blocknickel");
recipes.removeByRecipeName("chisel:uncraft_blockcobalt");
recipes.removeByRecipeName("chisel:uncraft_blockplatinum");
recipes.removeByRecipeName("chisel:uncraft_blockcopper");
recipes.removeByRecipeName("chisel:uncraft_blockaluminum");
recipes.removeByRecipeName("chisel:uncraft_blocklead");
recipes.removeByRecipeName("chisel:uncraft_blockbronze");

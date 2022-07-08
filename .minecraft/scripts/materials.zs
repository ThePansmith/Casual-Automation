#loader contenttweaker

import mods.contenttweaker.MaterialSystem;
import mods.contenttweaker.Material;

var InfusedMetal = MaterialSystem.getMaterialBuilder().setName("Infused Metal").setColor(16770688).build();
var EmpoweredMetal = MaterialSystem.getMaterialBuilder().setName("Empowered Metal").setColor(10275286).build();
var RedAlloy = MaterialSystem.getMaterialBuilder().setName("Red Alloy").setColor(13369344).build();

var metal_list = [InfusedMetal, EmpoweredMetal, RedAlloy] as Material[];
var part_names = ["dust", "gear", "plate", "nugget", "ingot"] as string[];

for i, metal in metal_list {
metal.registerParts(part_names);

var blockData = metal.registerPart("block").getData();
blockData.addDataValue("hardness", "5");
blockData.addDataValue("resistance", "30");
 blockData.addDataValue("harvestTool", "pickaxe");
blockData.addDataValue("harvestLevel", "1");
}


#loader contenttweaker
#priority 101
 
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.Block;
import mods.contenttweaker.Color;
import mods.contenttweaker.Fluid;
import crafttweaker.potions.IPotion;
import mods.contenttweaker.AxisAlignedBB;
import mods.contenttweaker.IItemUpdate;
import crafttweaker.entity.IEntityLiving;

var fluixsteelblock = VanillaFactory.createBlock("fluixsteelblock", <blockmaterial:sand>);
fluixsteelblock.setBlockHardness(0.5);
fluixsteelblock.setBlockResistance(2.5);
fluixsteelblock.setToolClass("pickaxe");
fluixsteelblock.setToolLevel(1);
fluixsteelblock.setBlockSoundType(<soundtype:sand>);
fluixsteelblock.register();

var facade = VanillaFactory.createItem("facade");
facade.rarity = "epic";
facade.register();



import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.data.IData;
import scripts.CommonVars.makeShaped as makeShaped;


// haha oh wow
recipes.remove(<minecraft:flint_and_steel>);
recipes.addShapeless(<minecraft:flint_and_steel>, [<ore:ingotSteel>,<minecraft:flint>]);

recipes.addShapeless(<minecraft:flint>, [<minecraft:gravel>,<minecraft:gravel>,<minecraft:gravel>,<minecraft:gravel>]);
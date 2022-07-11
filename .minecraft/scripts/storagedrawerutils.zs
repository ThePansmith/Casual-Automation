import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.data.IData;
import crafttweaker.recipes.IRecipeFunction;

//strip XYZ data from sealed drawers
val stackEmUp = <storagedrawers:basicdrawers>.withTag({
    display: {
        Name: "§6Stack 'em up!",
        Lore: [
			"§fSealed drawers store information about their last placed position",
			"§fIt's useless and makes otherwise identical drawers not stackable",
			"§fThis recipe removes it and lists drawer contents"
        ]
    }, 
	tile: {id: "storagedrawers:basicdrawers.1"}
});

function getDrawerStorage(Drawers as IData) as string[]{
	var lore=[] as string[];
	for i in 0 to Drawers.length {
		if Drawers[i] == {} continue;
		val id=Drawers[i].Item.id.asString();
		val Damage=Drawers[i].Item.Damage.asInt();
		val Count=Drawers[i].Count.asInt();
		val tag=Drawers[i].Item.tag;
		val item=itemUtils.getItem(id).withDamage(Damage).withAmount(Count).withTag(tag);
		if item.amount<=64 {
			lore+="§6"+item.displayName + "§8 : §a" + item.amount;
		} else {
			lore+="§6"+item.displayName + "§8 : §a" + item.amount + " §7[" + item.amount / 64 + "x64 + " + item.amount % 64+"]";
		}
	}
	return lore;
}

for i in 0 to 5 {
	recipes.addShapeless("drawer_stack_"+i, stackEmUp.withDamage(i), 
		[<storagedrawers:basicdrawers>.withDamage(i).withTag({tile:{}}).marked("mark")],
		function(outputs, inputs, craftingInfo){
			val nbt = inputs.mark.tag as IData;
			val nbtRemove = {tile : {x:0, y:0, z:0, Dir:0}} as IData;
			val lore = {display: {Lore : ["§aStackable!"]}} as IData;
			val storage = getDrawerStorage(nbt.tile.Drawers);
			return inputs.mark.withTag(nbt-nbtRemove-lore+lore).withLore(storage) * 1;
		},null);

	recipes.addShapeless("drawer_stack_framed_"+i, <storagedrawers:customdrawers>.withDamage(i).withTag(stackEmUp.tag + {MatS: {id: "chisel:glowstone",Count: 1 as byte, Damage: 15 as short}}), 
		[<storagedrawers:customdrawers>.withDamage(i).withTag({tile:{}}).marked("mark")],
		function(outputs, inputs, craftingInfo){
			val nbt = inputs.mark.tag as IData;
			val nbtRemove = {tile : {x:0, y:0, z:0, Dir:0}} as IData;
			val lore = {display: {Lore : ["§aStackable!"]}} as IData;
			val storage = getDrawerStorage(nbt.tile.Drawers);
			return inputs.mark.withTag(nbt-nbtRemove-lore+lore).withLore(storage) * 1;
		},null);
}

//Frame drawers without a framing table
//All hail Eutro 
mods.jei.JEI.removeAndHide(<storagedrawers:framingtable>);

val framingMaterial as IIngredient = <*>.only(function(stack as IItemStack) as bool {
    if(!stack.isItemBlock) {
        return false;
    }
    return stack.asBlock().definition.getStateFromMeta(stack.metadata).opaqueCube;
});

val customDrawerOut = <storagedrawers:customdrawers>.withTag({
    display: {
        Name: "§6Frame your drawers by hand!",
        Lore: [
            "§cTop left: sides",
            "§aTop middle: trim",
            "§9Middle left: front"
        ]
    },
    MatS: {
        id: "minecraft:wool",
        Count: 1 as byte,
        Damage: 14 as short
    },
	MatT: {
        id: "minecraft:wool",
        Count: 1 as byte,
        Damage: 5 as short
    },
	MatF: {
        id: "minecraft:wool",
        Count: 1 as byte,
        Damage: 11 as short
    }
});

val dummyItem = <minecraft:barrier>.withTag({
	display: {
        Name: "This is an example recipe",
        Lore: [
            "This item is here to prevent conflicts with the real recipes.",
            "Just ignore it."
        ]
    }
});

function asData(stack as IItemStack) as IData {
    return {
        id: stack.definition.id,
        Count: 1 as byte,
        Damage: stack.metadata
    } as IData;
}

<ore:handFramedThree>.add(<storagedrawers:customdrawers:*>,
                          <framedcompactdrawers:framed_drawer_controller>, // remove these three if you don't have Framed Compacting Drawers
                          <framedcompactdrawers:framed_compact_drawer>,
                          <framedcompactdrawers:framed_slave>);

<ore:handFramed>.addAll(<ore:handFramedThree>);
<ore:handFramed>.add(<storagedrawers:customtrim>);

for side in [true, false] as bool[] {
	for front in [true, false] as bool[] {
		for trim in [true, false] as bool[] {
			if !side && !front && !trim continue;
			val ingredients as IIngredient[][] = [
				[
					side ? framingMaterial.marked("MatS") : null,
					trim ? framingMaterial.marked("MatT") : null
				],
				[
					front ? framingMaterial.marked("MatF") : null,
					(front ? <ore:handFramedThree> : <ore:handFramed>).marked("drawer")
				]
			];

			recipes.addHiddenShaped(
				"hand_framing_" + (trim ? "trim_" : "") + (front ? "front_" : "") + (side ? "side" : ""),
				customDrawerOut,
				ingredients,
				function(out, ins, cInfo) {
					var tag = {} as IData[string];
					for key, stack in ins {
						if(key != "drawer") {
							tag[key] = asData(stack);
						}
					}
					val ret as any[any] = tag;
					if ins.drawer.tag.tile {
						return ins.drawer.withTag(ins.drawer.tag+(ret as IData)+{tile: ret as IData}) * 1;
					} else {
						return ins.drawer.withTag(ins.drawer.tag+(ret as IData)) * 1;
					}
				} as IRecipeFunction
			);
		}
	}
}
//exaple recipes for JEI
for i in 0 to 5 {
	recipes.addShaped(
		"hand_framing_example"+i,
		customDrawerOut.withDamage(i),
		[[<minecraft:wool:14>,<minecraft:wool:5>, dummyItem],
		[<minecraft:wool:11>, <storagedrawers:customdrawers>.withDamage(i)]]
	);
}
recipes.addShaped(
	"hand_framing_example_trim",
	<storagedrawers:customtrim>.withTag(customDrawerOut.tag),
	[[<minecraft:wool:14>,<minecraft:wool:5>, dummyItem],
	[<minecraft:book>.withTag({display: {Name: "Trims don't have a front face"}}), <storagedrawers:customtrim>]]
);
recipes.addShaped(
	"hand_framing_example_compacting",
	<framedcompactdrawers:framed_compact_drawer>.withTag(customDrawerOut.tag),
	[[<minecraft:wool:14>, <minecraft:wool:5>, dummyItem],
	[<minecraft:wool:11>, <framedcompactdrawers:framed_compact_drawer>]]
);
recipes.addShaped(
	"hand_framing_example_controller",
	<framedcompactdrawers:framed_drawer_controller>.withTag(customDrawerOut.tag),
	[[<minecraft:wool:14>, <minecraft:wool:5>, dummyItem],
	[<minecraft:wool:11>, <framedcompactdrawers:framed_drawer_controller>]]
);
recipes.addShaped(
	"hand_framing_example_slave",
	<framedcompactdrawers:framed_slave>.withTag(customDrawerOut.tag),
	[[<minecraft:wool:14>, <minecraft:wool:5>, dummyItem],
	[<minecraft:wool:11>, <framedcompactdrawers:framed_slave>]]
);

for i in 0 to 5 {
recipes.addShaped("drawer_convert_"+i, <storagedrawers:customdrawers>.withDamage(i).withTag({tile: {id: "storagedrawers:basicdrawers.1"}}), //some junk data in tile{} to make it look taped
	[
	[<cyclicmagic:block_fragile_weak>, <storagedrawers:basicdrawers>.withDamage(i).marked("mark")]],
	function(outputs, inputs, craftingInfo){
		val nbt = inputs.mark.tag as IData;
		val nbtRemove = {material : "oak", tile : {Mat: "oak"}} as IData;
		val nbtAdd = {MatS: {id: "storagedrawers:trim", Count: 1 as byte, Damage: 0 as short}} as IData;
		val nbtAddTile = {tile :{MatS: {id: "storagedrawers:trim", Count: 1 as byte, Damage: 0 as short}}} as IData;
		if (nbt.tile) {
			return outputs.withDamage(i).withTag(nbt-nbtRemove+nbtAdd+nbtAddTile);
		} else {
			return outputs.withDamage(i).withTag(nbt-nbtRemove+nbtAdd);
		}
	},null);
}

recipes.removeByMod("framedcompactdrawers");
recipes.addShaped("drawer_convert_compact", <framedcompactdrawers:framed_compact_drawer>.withTag({tile: {id: "storagedrawers:basicdrawers.1"}}),
	[
	[<cyclicmagic:block_fragile_weak>, <storagedrawers:compdrawers>.marked("mark")]],
	function(outputs, inputs, craftingInfo){
		val nbt = inputs.mark.tag as IData;
		val nbtAdd = {MatS: {id: "storagedrawers:trim", Count: 1 as byte, Damage: 0 as short}} as IData;
		val nbtAddTile = {tile :{MatS: {id: "storagedrawers:trim", Count: 1 as byte, Damage: 0 as short}, Qua: 1 as byte}} as IData;
		if (nbt.tile) {
			return outputs.withTag(nbt+nbtAdd+nbtAddTile);
		} else {
			return outputs.withTag(nbt+nbtAdd);
		}
	},null);

recipes.addShaped("drawer_convert_controller", <framedcompactdrawers:framed_drawer_controller>,
	[
	[<cyclicmagic:block_fragile_weak>, <storagedrawers:controller>]]);

recipes.addShaped("drawer_convert_slave", <framedcompactdrawers:framed_slave>,
	[
	[<cyclicmagic:block_fragile_weak>, <storagedrawers:controllerslave>]]);
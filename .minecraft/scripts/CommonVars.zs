#priority 999
// preprocessor directive to load this file first so others have access to the definitions
// Modifed version of nomi's script. 
// If it isn't broke, don't fix it
/**
 * Global definitions for commonly referenced values.
 * This avoids any inconsistencies that may arise from different definitions in different files.
 */

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemCondition;
import crafttweaker.data.IData;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.recipes.IRecipeFunction;
import crafttweaker.recipes.IRecipeAction;



global isBasic      as IItemCondition = function(stack as IItemStack) { return stack.tag has {Level: 0 as byte} as IData && !(stack.tag has {Creative: 1 as byte} as IData); };
global isHardened   as IItemCondition = function(stack as IItemStack) { return stack.tag has {Level: 1 as byte} as IData && !(stack.tag has {Creative: 1 as byte} as IData); };
global isReinforced as IItemCondition = function(stack as IItemStack) { return stack.tag has {Level: 2 as byte} as IData && !(stack.tag has {Creative: 1 as byte} as IData); };
global isSignalum   as IItemCondition = function(stack as IItemStack) { return stack.tag has {Level: 3 as byte} as IData && !(stack.tag has {Creative: 1 as byte} as IData); };
global isResonant   as IItemCondition = function(stack as IItemStack) { return stack.tag has {Level: 4 as byte} as IData && !(stack.tag has {Creative: 1 as byte} as IData); };
global isCreative   as IItemCondition = function(stack as IItemStack) { return stack.tag has {Creative: 1 as byte, Level: 4 as byte} as IData; };


/*
 Converts a text representation of a crafting grid recipe into an array of
 ingredients.

 Example:
(3, [[null,null,null],
     [null,null,null],
     [null,null,null]], <minecraft:furnace>, ["AAA",
                                              "A A",
                                              "AAA"], { A : <minecraft:stone> })
 =>

[[<minecraft:stone>, <minecraft:stone>, <minecraft:stone>],
 [<minecraft:stone>,        null,       <minecraft:stone>],
 [<minecraft:stone>, <minecraft:stone>, <minecraft:stone>]]
*/
function textToIngredients(ingredients as IIngredient[][],
                           output as IItemStack,
                           recipe as string[],
                           replacements as IIngredient[string]) as IIngredient[][] {

    for i, str in recipe {
        for j in 0 .. str.length {
            var item = str[j];
            if " " != item { // blanks are nulls, ignore them
                ingredients[i][j] = replacements[item];
            }
        }
    }

    return ingredients;
}

/* Same as above, but for standard 3x3 shapeless recipes. */
function makeShapeless3FA(name as string,
                          output as IItemStack,
                          recipe as string[],
                          replacements as IIngredient[string],
                          recipeFunction as IRecipeFunction,
                          recipeAction as IRecipeAction) {

    var ingredients = [null,null,null,
                       null,null,null,
                       null,null,null] as IIngredient[];

    for i, str in recipe {
        for j in 0 .. str.length {
            var item = str[j];
            if " " != item { // blanks are nulls, ignore them
                ingredients[str.length*i+j] = replacements[item];
            }
        }
    }

    recipes.addShapeless(name, output, ingredients, recipeFunction, recipeAction);
}

// Support varying arities so RecipeFunction/Action may be optionally used
function makeShapeless3F(name as string,
                         output as IItemStack,
                         recipe as string[],
                         replacements as IIngredient[string],
                         recipeFunction as IRecipeFunction) {
    makeShapeless3FA(name, output, recipe, replacements, recipeFunction, null);
}

function makeShapeless3(name as string,
                        output as IItemStack,
                        recipe as string[],
                        replacements as IIngredient[string]) {
    makeShapeless3F(name, output, recipe, replacements, null);
}

/* 3x3 shapeless compacting recipe. */
function makeCompacting3(name as string,
                         output as IItemStack,
                         input as IIngredient) {
    recipes.addShapeless(name, output,
        [input,input,input,
         input,input,input,
         input,input,input] as IIngredient[]);
}

function makeShapedFA(name as string,
                      output as IItemStack,
                      recipe as string[],
                      replacements as IIngredient[string],
                      recipeFunction as IRecipeFunction,
                      recipeAction as IRecipeAction) {

    var ingredients =
        [[null,null,null],
         [null,null,null],
         [null,null,null]] as IIngredient[][];

    recipes.addShaped(name, output,
        textToIngredients(ingredients, output, recipe, replacements),
        recipeFunction, recipeAction);
}


// Support varying arities so RecipeFunction/Action may be optionally used
function makeShapedF(name as string,
                     output as IItemStack,
                     recipe as string[],
                     replacements as IIngredient[string],
                     recipeFunction as IRecipeFunction) {
    makeShapedFA(name, output, recipe, replacements, recipeFunction, null);
}

function makeShaped(name as string,
                    output as IItemStack,
                    recipe as string[],
                    replacements as IIngredient[string]) {
    makeShapedF(name, output, recipe, replacements, null);
}

function makeExtremeRecipe5(output as IItemStack,
                            recipe as string[],
                            replacements as IIngredient[string]) {

    var ingredients =
        [[null,null,null,null,null],
         [null,null,null,null,null],
         [null,null,null,null,null],
         [null,null,null,null,null],
         [null,null,null,null,null]] as IIngredient[][];

    mods.extendedcrafting.TableCrafting.addShaped(output,
        textToIngredients(ingredients, output, recipe, replacements));
}

function makeExtremeRecipe7(output as IItemStack,
                            recipe as string[],
                            replacements as IIngredient[string]) {

    var ingredients =
        [[null,null,null,null,null,null,null],
         [null,null,null,null,null,null,null],
         [null,null,null,null,null,null,null],
         [null,null,null,null,null,null,null],
         [null,null,null,null,null,null,null],
         [null,null,null,null,null,null,null],
         [null,null,null,null,null,null,null]] as IIngredient[][];

    mods.extendedcrafting.TableCrafting.addShaped(output,
        textToIngredients(ingredients, output, recipe, replacements));
}

function makeExtremeRecipe9(output as IItemStack,
                            recipe as string[],
                            replacements as IIngredient[string]) {

    var ingredients =
        [[null,null,null,null,null,null,null,null,null],
         [null,null,null,null,null,null,null,null,null],
         [null,null,null,null,null,null,null,null,null],
         [null,null,null,null,null,null,null,null,null],
         [null,null,null,null,null,null,null,null,null],
         [null,null,null,null,null,null,null,null,null],
         [null,null,null,null,null,null,null,null,null],
         [null,null,null,null,null,null,null,null,null],
         [null,null,null,null,null,null,null,null,null]] as IIngredient[][];

    mods.extendedcrafting.TableCrafting.addShaped(output,
        textToIngredients(ingredients, output, recipe, replacements));
}
//
//  PrepBibleViewModel.swift
//  MetaCocktails
//
//  Created by James on 8/9/23.
//

import SwiftUI
import Observation

@Observable final class PrepBibleViewModel{
    
    
    let richDem = Prep(prepIngredientName: "Rich Demerara Syrup", prepRecipe:[Instruction(step: 1, method: "Weigh out two parts Demerara sugar to one part water and combine in a pot."),
                                                                              Instruction(step: 2, method: "Bring to a boil and then immediately take off heat."),
                                                                              Instruction(step: 3, method: "Let cool before bottling.")]   )
    
    let cucumberSyrup = Prep(prepIngredientName: "Cucumber Syrup", prepRecipe:[Instruction(step: 1, method:  "Make a rich simple syrup (2 parts sugar to 1 part water, weighed out) and let cool down completely"),
                                                                               Instruction(step: 2, method:  "Juice washed english cucumbers"),
                                                                               Instruction(step: 3, method:  "Combine equal parts cucumber juice to rich simple."),
                                                                               Instruction(step: 4, method:  "Store in the fridge for up to a week."),
                                                                               Instruction(step: 5, method:  "This is about a 40 bricks syrup. Adjust proportions to fit your needs. The key here is not to cook the cucumbers.")])
    
    let gingerSyrup = Prep(prepIngredientName: "Ginger Syrup", prepRecipe:[Instruction(step: 1, method:  "Make a ginger syrup")] )
    
    let orgeat = Prep(prepIngredientName: "Orgeat", prepRecipe: [Instruction(step: 1, method:  "Make orgeat, orNot.")])
    
    let grapefruitShrub = Prep(prepIngredientName: "Grapefruit Shrub", prepRecipe: [Instruction(step: 1, method:  "For 500ml: Add 250ml white sugar to 150g grapefruit peels."),
                                                                                    Instruction(step: 2, method: "Let sit in a mason jar for 24 hours in a semi-warm place."),
                                                                                    Instruction(step: 3, method: " Add 250g fresh grapefruit juice and shake until the oleo emulsifies with the grapefruit juice."),
                                                                                    Instruction(step: 4, method: "Strain the peels out. Keeps for 1 week in the fridge.")])
    
    let peanutButterVodka = Prep(prepIngredientName: "Peanut Butter Vodka", prepRecipe:[Instruction(step: 1, method:"Add 150g of skippy creamy peanut butter into a deli and add a 750 ml. bottle of vodka."),
                                                                                        Instruction(step: 2, method: " Then just whisk in the peanut butter until it dissolves. Keeps forever, probably.")] )
    
    let morgenthalersGingerSyrup = Prep(prepIngredientName: "Morgenthaler's Ginger Syrup", prepRecipe:[Instruction(step: 1, method:  "Roughly chop 8 ounces washed, unpeeled ginger (each piece about the size of your pinkie-tip). "),
                                                                                                       Instruction(step: 2, method: "Put in a blender and combine with equal parts sugar and boiling water."),
                                                                                                       Instruction(step: 3, method: " Blend on high until mixture is smooth, then fine-strain")])
    
    let honeySyrup = Prep(prepIngredientName: "Honey Syrup", prepRecipe:[Instruction(step: 1, method: "Weigh out two parts honey to one part boiling water and combine."),
                                                                         Instruction(step: 2, method: "Let cool before bottling.")]   )
    
    let agaveSyrup = Prep(prepIngredientName: "Agave Syrup", prepRecipe:[Instruction(step: 1, method: "Weigh out three parts agave nectar to one part boiling water and combine."),
                                                                         Instruction(step: 2, method: "Let cool before bottling.")]   )
    
    let raspberrySyrup = Prep(prepIngredientName: "Raspberry Syrup", prepRecipe: [Instruction(step: 1, method:  "Weigh out one part raspberries to two parts sugar and add them to a pot."),
                                                                                  Instruction(step: 2, method: "Get some gloves on a smash the berries and sugar together. This is easiest with your hands, but if you don't have gloves you can use a spatula or a muddler."),
                                                                                  Instruction(step: 3, method: " Let this macerate for 1 to 2 hours"),
                                                                                  Instruction(step: 4, method: "Add the same weight of the raspberries of water."),
                                                                                  Instruction(step: 5, method: "Give it a quick stir and put it all on low heat, stirring occasionally."),
                                                                                  Instruction(step: 6, method: "You want the lowest heat possible here, just so the sugar dissolves. Do not let it come to a boil or you will ruin the bright floral flavor of the raspberries. This shouldn't take longer than 10 minutes."),
                                                                                  Instruction(step: 7, method: "Take off heat as soon as you can and let cool before straining the pulp out of the syrup and bottling.")])
    
    let richSimple = Prep(prepIngredientName: "Rich Simple Syrup", prepRecipe:[Instruction(step: 1, method: "Weigh out two parts sugar to one part water and combine in a pot."),
                                                                                 Instruction(step: 2, method: "Bring to a boil and then immediately take off heat."),
                                                                                 Instruction(step: 3, method: "Let cool before bottling.")]   )
}

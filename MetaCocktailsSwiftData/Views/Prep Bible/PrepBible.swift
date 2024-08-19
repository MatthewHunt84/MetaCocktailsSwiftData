//
//  PrepBibleViewModel.swift
//  MetaCocktails
//
//  Created by James on 8/9/23.
//

import SwiftUI


final class PrepBible{
    
    static let demSyrupPrep = Prep(prepIngredientName: "Demerara syrup",
                                   prepRecipe:[Instruction(step: 1, method: "Combine one part Demerara sugar to one part water by weight into a pot."),
                                               Instruction(step: 2, method: "Bring to a boil and then immediately take off heat."),
                                               Instruction(step: 3, method: "Let cool before bottling.")])
    
    static let richDem = Prep(prepIngredientName: "Rich Demerara syrup",
                              prepRecipe:[Instruction(step: 1, method: "Combine two parts Demerara sugar to one part water by weight into a pot."),
                                          Instruction(step: 2, method: "Bring the mixture to a boil and then immediately take it off heat."),
                                          Instruction(step: 3, method: "Let it cool before bottling.")])
    
    static let simpleSyrupPrep = Prep(prepIngredientName: "Simple syrup",
                                      prepRecipe:[Instruction(step: 1, method: "Combine one part sugar to one part water by weight into a pot."),
                                                  Instruction(step: 2, method: "Bring to a boil and then immediately take off heat."),
                                                  Instruction(step: 3, method: "Let cool before bottling.")])
    
    static let richSimple = Prep(prepIngredientName: "Rich simple syrup",
                                 prepRecipe:[Instruction(step: 1, method: "Combine two parts sugar to one part water by weight into a pot."),
                                             Instruction(step: 2, method: "Bring to a boil and then immediately take off heat."),
                                             Instruction(step: 3, method: "Let cool before bottling.")])
    
    
    
    static let richCinnamonAndVanillaSyrupPrep = Prep(prepIngredientName: "Rich cinnamon and vanilla syrup",
                                                      prepRecipe: [Instruction(step: 1, method: "Combine 150g of water, 300g of white sugar, one whole vanilla bean (or 1 tablespoon vanilla extract or vanilla bean paste but these options are not preferred), and three cinnamon sticks into a pot."),
                                                                   Instruction(step: 2, method: "Heat on a stove top until it comes to a boil and immediately turn the heat off."),
                                                                   Instruction(step: 3, method: "Let it rest for about twenty minutes checking the flavor every ten minutes. if you like a stronger vanilla and cinnamon flavor, let it steep longer. Take the vanilla bean and cinnamon out when you've found the right flavor."),
                                                                   Instruction(step: 6, method: "Let it cool and strain before bottling.")])
    
    static let cucumberSyrup = Prep(prepIngredientName: "Cucumber syrup",
                                    prepRecipe:[Instruction(step: 1, method:  "Make a rich simple syrup (two parts sugar to one part water by weight) and let cool down completely"),
                                                Instruction(step: 2, method:  "Juice washed english cucumbers"),
                                                Instruction(step: 3, method:  "Combine equal parts cucumber juice to rich simple."),
                                                Instruction(step: 4, method:  "Store in the fridge for up to a week."),
                                                Instruction(step: 5, method:  "This is about a 40 bricks syrup. Adjust proportions to fit your needs. The key here is not to cook the cucumbers.")])
    
    static let gingerSyrup = Prep(prepIngredientName: "Ginger syrup",
                                  prepRecipe:[Instruction(step: 1, method:  "This requires juicing fresh ginger, which can be a strain on household juicers."),
                                              Instruction(step: 2, method:  "Add equal parts fresh ginger juice and sugar to a pot and bring to a boil while stirring. Some prefer Demerara sugar for a darker and more robust flavor. You can use plain white sugar for a brighter and sharper flavor."),
                                              Instruction(step: 3, method:  "Take off heat immediately after boiling and let cool."),
                                              Instruction(step: 4, method:  "Add 1oz(30ml) vodka to every 750ml of syrup to stabilize.")] )
    
    static let morgenthalersGingerSyrup = Prep(prepIngredientName: "Morgenthaler's ginger syrup",
                                               prepRecipe:[Instruction(step: 1, method: "Roughly chop 8 ounces washed, unpeeled ginger (each piece about the size of your pinkie-tip). "),
                                                           Instruction(step: 2, method: "Put in a blender and combine with equal parts sugar and boiling water."),
                                                           Instruction(step: 3, method: "Blend on high until mixture is smooth, then fine-strain")])
    
    static let orgeat = Prep(prepIngredientName: "Orgeat",
                             prepRecipe: [Instruction(step: 1, method: "Makes 300ml: This is the Milk and Honey recipe."),
                                          Instruction(step: 2, method: "Lightly toast 220g of slivered almonds in the oven. They toast quick, do not burn them."),
                                          Instruction(step: 3, method: "Grind the almonds in a food processor to a coarse powder."),
                                          Instruction(step: 4, method: "Add 300g white sugar and 200ml water into a pot and bring to a boil over low heat stirring constantly."),
                                          Instruction(step: 5, method: "Add the ground toasted almonds and cook for another 3 minutes while continuing to stir."),
                                          Instruction(step: 6, method: "Remove from heat and cover. Let sit for up to 6 hours."),
                                          Instruction(step: 7, method: "Transfer the syrup to a jelly bag or nut bag and strain into a spouted measuring cup."),
                                          Instruction(step: 8, method: "Add 1 oz.(30ml) vodka and 1 teaspoon orange flower water and stir to combine."),
                                          Instruction(step: 9, method: "Cover and refrigerate. Keeps for about a month.")])
    
    static let grapefruitShrub = Prep(prepIngredientName: "Grapefruit shrub",
                                      prepRecipe: [Instruction(step: 1, method:  "For 500ml: Add 250g white sugar to 150g grapefruit peels."),
                                                   Instruction(step: 2, method: "Let sit in a mason jar for 24 hours in a semi-warm place. This will be our oleo saccharum."),
                                                   Instruction(step: 3, method: "Add 250g fresh grapefruit juice and shake until the oleo is completely emulsified."),
                                                   Instruction(step: 4, method: "Strain the peels out. Keeps for 1 week in the fridge.")]) 
    
    static let clementineShrub = Prep(prepIngredientName: "Clementine shrub",
                                      prepRecipe: [Instruction(step: 1, method:  "For 500ml: Add 250g white sugar to 150g of orange peels."),
                                                   Instruction(step: 2, method: "Let sit in a mason jar for 24 hours in a semi-warm place. This will be our oleo saccharum."),
                                                   Instruction(step: 3, method: " Add 250g fresh clementine juice and shake until the oleo is completely emulsified."),
                                                   Instruction(step: 4, method: "Strain the peels out. Keeps for 1 week in the fridge.")])
    
    static let limeCordial = Prep(prepIngredientName: "Lime cordial",
                                  prepRecipe: [Instruction(step: 1, method:  "We're using Morganthaler's recipe here. For 500ml: Add 250g white sugar to 240g of hot water to a blender to make a slightly sweeter simple."),
                                               Instruction(step: 2, method: "Add 45g fresh lime juice, 25g citric acid, and 8g of fresh grated lime peel."),
                                               Instruction(step: 3, method: "Blend on medium for about 30 seconds."),
                                               Instruction(step: 4, method: "Strain and refrigerate.")])
    
    static let peanutButterVodka = Prep(prepIngredientName: "Peanut butter vodka",
                                        prepRecipe:[Instruction(step: 1, method:"Add 150g of Skippy creamy peanut butter into a deli and add a 750 ml. bottle of vodka."),
                                                    Instruction(step: 2, method: "Then just whisk in the peanut butter until it dissolves. Keeps forever, probably.")] )
    
    
    
    static let honeySyrup = Prep(prepIngredientName: "Honey syrup",
                                 prepRecipe:[Instruction(step: 1, method: "Weigh out three parts honey to one part boiling water and combine."),
                                             Instruction(step: 2, method: "Let cool before bottling.")])
    
    static let agaveSyrup = Prep(prepIngredientName: "Agave syrup",
                                 prepRecipe:[Instruction(step: 1, method: "Weigh out three parts agave nectar to one part boiling water and combine."),
                                             Instruction(step: 2, method: "Let cool before bottling.")])
    
    static let raspberrySyrup = Prep(prepIngredientName: "Raspberry syrup",
                                     prepRecipe: [Instruction(step: 1, method: "This is Julie Reiner's recipe. Weigh out one part raspberries to two parts sugar and add them to a pot."),
                                                  Instruction(step: 2, method: "Get some gloves on a smash the berries and sugar together. This is easiest with your hands, but if you don't have gloves you can use a spatula or a muddler."),
                                                  Instruction(step: 3, method: "Let it macerate for one to two hours"),
                                                  Instruction(step: 4, method: "Add the same weight of the raspberries of water."),
                                                  Instruction(step: 5, method: "Give it a quick stir and put it all on low heat, stirring occasionally."),
                                                  Instruction(step: 6, method: "You want the lowest heat possible here, just so the sugar dissolves. Do not let it come to a boil or you will ruin the bright floral flavor of the raspberries. This shouldn't take longer than 10 minutes."),
                                                  Instruction(step: 7, method: "Take off heat as soon as you can and let cool before straining the pulp out of the syrup and bottling.")])
    
    
    
    static let angoCream = Prep(prepIngredientName: "Angostura cream",
                                prepRecipe:[Instruction(step: 1, method: "Add 8oz.(240ml) heavy cream, 1oz.(30ml) simple syrup, and 2 dashes of angostura to a 20oz. squeeze bottle."),
                                            Instruction(step: 2, method: "Shake until it doubles in size. The cream needs to be thickened but still fluid."),
                                            Instruction(step: 3, method: "Keep refrigerated.")])
    
    static let violetteSyrup = Prep(prepIngredientName: "Violette syrup",
                                    prepRecipe:[Instruction(step: 1, method: "Add two ounces (60ml) gin, one ounce (30ml) violet syrup such as Monin, and one ounce (30ml) simple syrup together."),
                                                Instruction(step: 2, method: "Keep refrigerated for up to a month.")])
    
    static let mineralSaline = Prep(prepIngredientName: "Mineral saline",
                                    prepRecipe: [Instruction(step: 1, method: "Add 68g of kosher salt to one liter of mineral water, warmed."),
                                                 Instruction(step: 2, method: "Keep refrigerated for up to a month.")])
    
    static let gommeSyrup = Prep(prepIngredientName: "Gomme syrup",
                                 prepRecipe: [Instruction(step: 1, method: "Measure out 200g water and 50g of gum arabic powder and whisk together at room temp for a couple of minutes."),
                                              Instruction(step: 2, method: "The easier way to do this is with time, by letting it sit for 8 hours or so until the gum arabic is dissolved. "),
                                              Instruction(step: 3, method: "If you're on a time crunch, you can use hot water and whisk it together for ten minutes like your life depends on it. Though, you'll still have to let it sit for a couple of hours to fully dissolve. "),
                                              Instruction(step: 4, method: "Pour your gum arabic and water solution in a saucepan over very low heat and add 200g of sugar. Stir the sugar into the solution until all the sugar has dissolved. If you want a rich 2:1 syrup, just double up on the sugar but use the same amount of gum arabic. Don't let it come to a boil! "),
                                              Instruction(step: 5, method: "Let it cool before bottling. If there's still some gum arabic floating around, you'll want to strain it out before bottling."),
                                              Instruction(step: 6, method: "This will keep for several weeks in the fridge.")])
    
    static let whitePeachPuree = Prep(prepIngredientName: "White peach puree",
                                      prepRecipe: [Instruction(step: 1, method: "Combine one white peach, skin left on, pitted and sliced, one ounce (30 ml) fresh Meyer lemon juice, and one ounce (30 ml) simple syrup in a food processor and purée."),
                                                   Instruction(step: 2, method: "Strain through a fine-mesh sieve. "),
                                                   Instruction(step: 3, method: "Use immediately, or cover and refrigerate for up to 2 days.")])
    
    static let aPPBitters = Prep(prepIngredientName: "A.P.P. bitters",
                                 prepRecipe: [Instruction(step: 1, method: "Equal parts Angostura, Peychaud's and Dale DeGroff's Pimento Bitters.")])
    
    static let houseOrangeBitters = Prep(prepIngredientName: "House orange bitters",
                                         prepRecipe: [Instruction(step: 1, method: "Equal parts Fee Brothers West Indian Orange Bitters and Regan's No. 6 bitters.")])
    
    
    static let pineappleGommeSyrup = Prep(prepIngredientName: "Pineapple gomme syrup",
                                          prepRecipe: [Instruction(step: 1, method: "Measure out 200g water and 50g of gum arabic powder and whisk together at room temp for a couple of minutes."),
                                                       Instruction(step: 2, method: "The easier way to do this is with time, by letting it sit for 8 hours or so until the gum arabic is dissolved. "),
                                                       Instruction(step: 3, method: "If you're on a time crunch, you can use hot water and whisk it together for ten minutes like your life depends on it. Though, you'll still have to let it sit for a couple of hours to fully dissolve. "),
                                                       Instruction(step: 4, method: "Pour your gum arabic and water solution in a saucepan over very low heat and add 200g of sugar, one cup of pineapple chunks, and two tablespoons of pineapple juice."),
                                                       Instruction(step: 5, method: "Stir the sugar into the solution until all the sugar has dissolved. If you want a rich 2:1 syrup, just double up on the sugar but use the same amount of gum arabic. Don't let it come to a boil! "),
                                                       Instruction(step: 6, method: "Let it cool before straining and bottling."),
                                                       Instruction(step: 7, method: "This will keep for about a month in the fridge.")])
    
    static let cinnamonSyrup = Prep(prepIngredientName: "Cinnamon syrup",
                                    prepRecipe: [Instruction(step: 1, method: "For 500ml: Combine 250g of water, 250g of white sugar, and three to four cinnamon sticks into a pot."),
                                                 Instruction(step: 2, method: "Heat on a stove top until it comes to a boil and immediately turn the heat off."),
                                                 Instruction(step: 3, method: "Let it rest for about twenty minutes checking the flavor every ten minutes. if you like a stronger cinnamon flavor, let it steep longer. Take the cinnamon sticks out when you've found the right flavor."),
                                                 Instruction(step: 4, method: "Let it cool and strain before bottling.")])
    
    static let vanillaSyrup = Prep(prepIngredientName: "Vanilla syrup",
                                   prepRecipe: [Instruction(step: 1, method: "For 500ml: Combine 250g of water, 250g of white sugar, and one whole vanilla bean (or one tablespoon vanilla extract or vanilla bean paste but these options are not preferred) into a pot."),
                                                Instruction(step: 2, method: "Heat on a stove top until it comes to a boil and immediately turn the heat off."),
                                                Instruction(step: 3, method: "Let it rest for about twenty minutes checking the flavor every ten minutes. if you like a stronger vanilla flavor, let it steep longer. Take the vanilla bean out when you've found the right flavor."),
                                                Instruction(step: 4, method: "Let it cool and strain before bottling."),
                                                Instruction(step: 5, method: "If you used a bean paste, strain the syrup through a coffee filter."),])
    
    static let jasmineTeaInfusedGin = Prep(prepIngredientName: "Jasmine tea infused gin",
                                           prepRecipe:[Instruction(step: 1, method:"Add 45g of Jasmine tea to one 750ml bottle of Woody Creek gin."),
                                                       Instruction(step: 2, method: "Shake after 30 min"),
                                                       Instruction(step: 3, method: "strain after an hour and twenty minutes")] )
    
    static let grenadine = Prep(prepIngredientName: "Grenadine",
                                prepRecipe: [Instruction(step: 1, method: "This is one of Morganthaler's recipes. It makes about a liter: Combine 500g each of fresh pomegranate juice (or POM) and white sugar into a pot."),
                                             Instruction(step: 2, method: "Add 60ml pomegranate molasses and heat just enough to dissolve the sugar. Do not let it boil."),
                                             Instruction(step: 3, method: "Let it cool completely and then add a bar spoon of orange flower water. Give it a quick stir."),
                                             Instruction(step: 4, method: "Bottle and keep in the fridge")])
    
    static let passionfruitSyrupPrep = Prep(prepIngredientName: "Passionfruit syrup",
                                            prepRecipe: [Instruction(step: 1, method: "Combine 500g each of passionfruit pulp (fresh if you can find it. But frozen works great here as well), white sugar, and water into a pot."),
                                                         Instruction(step: 2, method: "Heat just enough to dissolve the sugar. Do not let it boil."),
                                                         Instruction(step: 3, method: "Let it cool completely then strain and bottle. Keep refrigerated.")])
}

//
//  Builds.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 12/13/24.
//

import Foundation

// MARK: Historic

let brambleBuild =  Build(instructions: [Instruction(step: 1, method: "Build in glass."),
                                         Instruction(step: 2, method: "Add pebble ice to a double old fashioned glass and add the ingredients to that."),
                                         Instruction(step: 3, method: "Drizzle the creme de mûre over the top."),
                                         Instruction(step: 4, method: "Garnish with blackberry and lemon wheel.")])

let elDiabloBuild = Build(instructions: [Instruction(step: 1, method: "Shake everything but the ginger ale with ice."),
                                         Instruction(step: 2, method: "Strain into a Collins glass full of ice and top with the ginger ale.")])

let fogCutterBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the sherry, into a tin and shake with ice."),
                                          Instruction(step: 2, method: "Strain into a tiki mug and add pebble ice."),
                                          Instruction(step: 3, method: "Garnish with a mint bouquet and then float the sherry on top.")])

let gimletMcElhoneBuild = Build(instructions: [Instruction(step: 1, method: "Stir and serve in same glass. Can be iced if desired. 'A very popular beverage of the Navy.' -Harry McElhone")])


let ginFizzBuild  = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the sparkling water, into a tin and shake with ice."),
                                         Instruction(step: 2, method: "Strain into a small chilled highball glass and top with sparkling water."),
                                         Instruction(step: 3, method: "Give a gentle stir."),
                                         Instruction(step: 4, method: "make it a silver fizz by adding egg whites and a dry shake before shaking with ice. This is the preferred method for most. In this case, add a lemon expression to the final product (See 'Silver Gin Fizz').")])

let hotBrandyToddyBuild = Build(instructions: [Instruction(step: 1, method: "Place sugar in a small shaker tin."),
                                               Instruction(step: 2, method: "Fill the large shaker tin half full of near boiling water then float the small tin on top, bain-marie style."),
                                               Instruction(step: 3, method: "At the same time, heat your toddy glass up by adding hot water to it."),
                                               Instruction(step: 4, method: "After your sugar is dissolved, add the brandy. When all the ingredients are hot enough, dump the old water from the toddy glass and pour in the heated cocktail.")])

let silverGinFizzBuild  = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the seltzer water, into a tin and dry shake."),
                                               Instruction(step: 2, method: "Shake with ice."),
                                               Instruction(step: 3, method: "Strain the cocktail into a chilled glass."),
                                               Instruction(step: 4, method: "Top with seltzer water.")])


// MARK: House Cocktails

let houseBrambleBuild =  Build(instructions: [Instruction(step: 1, method: "Muddle blackberries and raspberries."),
                                              Instruction(step: 2, method: "Shake all the ingredients with ice."),
                                              Instruction(step: 3, method: "Strain into a double old fashioned glass and add pebble ice."),
                                              Instruction(step: 4, method: "Garnish with skewered blackberries and raspberries.")])

let houseSilverGinFizzBuild  = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the sparkling water, into a tin and dry shake."),
                                                    Instruction(step: 2, method: "Shake with ice."),
                                                    Instruction(step: 3, method: "Add soda to the glass then strain the cocktail over the soda."),
                                                    Instruction(step: 4, method: "Express the lemon peel then garnish with the peel.")])

// MARK: Milk and Honey

let americanTrillogyBuild = Build(instructions: [Instruction(step: 1, method: "Add the bitters, a sugar cube, and a splash of soda into a double old fashioned glass and muddle. The soda just breaks down the sugar cube."),
                                                 Instruction(step: 2, method: "Add the rye and Laird's Bonded into the glass."),
                                                 Instruction(step: 3, method: "With the back end of a bar spoon, guide a large rock into the glass so that it doesn't make a splash."),
                                                 Instruction(step: 4, method: "Stir until chilled and then garnish with an orange peel.")])

let asburyParkSwizzleBuild = Build(instructions: [Instruction(step: 1, method: "Combine two mint sprigs, lemon juice, honey syrup, and apple liqueur in a cocktail shaker and gently muddle."),
                                                  Instruction(step: 2, method: "Add the applejack and mineral saline, then swirl to incorporate."),
                                                  Instruction(step: 3, method: "Pour the cocktail into a Collins glass and add pebble ice to come just under the rim of the glass."),
                                                  Instruction(step: 4, method: "Add both bitters and lightly swizzle the drops into a red layer on top of the ice."),
                                                  Instruction(step: 5, method: "Top with more ice, shaping it into a cone, and garnish with a mint sprig.")])

let bicycleThiefBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients except for the soda into a tin and shake with ice."),
                                             Instruction(step: 2, method: "Strain into a Collins glass over ice and top with soda."),
                                             Instruction(step: 3, method: "Give a gentle stir.")])

let binAndGittersBuild = Build(instructions: [Instruction(step: 1, method: "Add lime, simple, and gin into a tin and shake with ice."),
                                              Instruction(step: 2, method: "Strain into a double old fashioned glass and then pack the glass with pebble ice."),
                                              Instruction(step: 3, method: "Float the bitters on top and add a lime wedge for garnish.")])

let bottlerocketBuild = Build(instructions: [Instruction(step: 1, method: "Combine the tequila, lime juice, honey syrup, and jalapeño in a cocktail shaker, fill the shaker with ice, and shake vigorously until the drink is sufficiently chilled."),
                                             Instruction(step: 2, method: "Strain into a Collins glass filled with ice and top with the club soda.")])

let cafeConLecheFlipBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients into a tin and dry shake to emulsify."),
                                                 Instruction(step: 2, method: "Add a few Kold Draft cubes and shake until cold."),
                                                 Instruction(step: 3, method: "Immediately after shaking, pop the tin and double strain into a flip glass. (As noted in Sasha Petraske's 'Regarding Cocktails', use a chilled sour glass.)"),
                                                 Instruction(step: 4, method: "Grate some nutmeg over the top.")])

let calvados75Build = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the Champagne, into a tin and shake with ice."),
                                           Instruction(step: 2, method: "Strain over cracked ice and top with Champagne."),
                                           Instruction(step: 3, method: "Give a gentle stir.")])

let cobbleHillBuild = Build(instructions: [Instruction(step: 1, method: "Gently muddle two cucumber slices in a mixing glass."),
                                           Instruction(step: 2, method: "Add the rest of the ingredients with ice and stir."),
                                           Instruction(step: 3, method: "Strain into a chilled coupe and garnish with a cucumber slice.")])

let croquePetraskeBuild = Build(instructions: [Instruction(step: 1, method: "To make the Monsieur cocktail, pour the Campari over two medium ice cubes in a frozen highball glass and top with club soda. Stir to combine."),
                                               Instruction(step: 2, method: "To make the Madame, prepare the drink the same way, but add the gin and garnish with an orange twist.")])

let dominicanaBuild = Build(instructions: [Instruction(step: 1, method: "Add the coffee liqueur and the rum into a mixing glass and stir with ice."),
                                           Instruction(step: 2, method: "Strain into a chilled coupe and top with a thin layer of the lightly whipped cream.")])

let eskimosKissBuild = Build(instructions: [Instruction(step: 1, method: "Combine the mint leaves and sugar cubes in a cocktail shaker and soak the sugar in the lime juice and simple syrup."),
                                            Instruction(step: 2, method: "Muddle gently— ideally crushing the sugar into a paste, without more than lightly bruising the mint."),
                                            Instruction(step: 3, method: "Add the rum and swirl the shaker to combine."),
                                            Instruction(step: 4, method: "Pour the drink into a large glass and fill to the top with chunky pebble ice."),
                                            Instruction(step: 5, method: "Garnish with a mint bouquet."),
                                            Instruction(step: 6, method: "Add two straws, then drink with someone you want to touch noses with.")])

let fakerFaceBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the soda, into a tin and shake with ice."),
                                          Instruction(step: 2, method: "Strain into a chilled coupe and top with soda.")])

let french75MnHBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the Champagne, into a tin and shake with ice."),
                                            Instruction(step: 2, method: "Strain over into a Champagne flute and top with Champagne."),
                                            Instruction(step: 3, method: "Give a gentle stir.")])

let gabriellaBuild = Build(instructions: [Instruction(step: 1, method: "Hull one half of the strawberry. Combine it with the lemon juice in a cocktail shaker and muddle gently."),
                                          Instruction(step: 2, method: "Add the simple syrup, pisco, and one large ice cube and shake vigorously until the drink is sufficiently chilled."),
                                          Instruction(step: 3, method: "Strain into a rocks glass and add pebble ice until a 'high and dry' mountain is formed."),
                                          Instruction(step: 4, method: "Garnish with the remaining strawberry half and the pinch of salt.")])

let gordonsBreakfastBuild = Build(instructions: [Instruction(step: 1, method: "Combine all ingredients in a cocktail shaker."),
                                                 Instruction(step: 2, method: "Add 1 cup (240 ml) cracked ice and shake vigorously until the drink is sufficiently chilled."),
                                                 Instruction(step: 3, method: "Pour into a chilled rocks glass."),
                                                 Instruction(step: 4, method: "Finish with a pinch each of salt and freshly ground pepper.")])

let gordonsCupBuild = Build(instructions: [Instruction(step: 1, method: "Combine the lime wedges, cucumber, simple syrup, and gin in a cocktail shaker and muddle to extract the juice from the lime without pulverizing the fruit."),
                                           Instruction(step: 2, method: "Fill the shaker with ice and give it 5 to 6 good shakes."),
                                           Instruction(step: 3, method: "Open the shaker and pour its contents back and forth, separating the lime and cucumber slices from the ice and cocktail; pour the lime and cucumber into a frozen rocks glass, then top with the ice and liquid. (The muddled lime and cucumber should be at the bottom of the glass; if need be, push the solids to the bottom.)"),
                                           Instruction(step: 4, method: "Add a cocktail straw and a sprinkling of salt and pepper. -Sasha Petraske, Regarding Cocktails")])

let grapefruitCollinsBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the soda, into a tin and shake with ice."),
                                                  Instruction(step: 2, method: "Strain over column ice and top with soda."),
                                                  Instruction(step: 3, method: "Give a gentle stir and then garnish with a grapefruit peel after expression.")])

let harvestOldFashionedBuild = Build(instructions: [Instruction(step: 1, method: "Put the sugar cube in an old fashioned glass and soak with both bitters. Add club soda and muddle until a paste forms."),
                                                    Instruction(step: 2, method: "Add the brandy and whiskey."),
                                                    Instruction(step: 3, method: "Add one large rock and stir the drink slowly 9 times or so to lightly chill."),
                                                    Instruction(step: 4, method: "Finish with the lemon and orange twists. -Sasha Petraske, Regarding Cocktails")])

let hayesFizzBuild = Build(instructions: [Instruction(step: 1, method: "Combine the lemon juice, simple syrup, and gin in a cocktail shaker."),
                                          Instruction(step: 2, method: "Add one large ice cube and shake vigorously until the drink is sufficiently chilled."),
                                          Instruction(step: 3, method: "Put a large Collins-length ice cube in a chilled Collins glass and rinse with absinthe."),
                                          Instruction(step: 4, method: "Strain the cocktail into the glass and garnish with the orange slice and cherry.")])

let holeInTheCupBuild = Build(instructions: [Instruction(step: 1, method: "Add all of the ingredients into cocktail shaker."),
                                             Instruction(step: 2, method: "Add 12 large pieces of solid ice and shake vigorously until the drink is sufficiently chilled."),
                                             Instruction(step: 3, method: "Strain into a frosted coupe, pouring from high enough to create a nice, fluffy head."),
                                             Instruction(step: 4, method: "Garnish with a cucumber slice. -Sasha Petraske, Regarding Cocktails")])

let jFKHarrisBuild = Build(instructions: [Instruction(step: 1, method: "Combine the rum, lemon juice, simple syrup, and mint in a cocktail shaker, fill with ice, and shake vigorously until the drink is sufficiently chilled."),
                                          Instruction(step: 2, method: "Strain into a double rocks glass filled with a single large ice cube."),
                                          Instruction(step: 3, method: "Slowly float a finger of red wine on top.")])

let kentuckyMaidBuild = Build(instructions: [Instruction(step: 1, method: "Gently muddle the cucumber, lime, and simple together."),
                                             Instruction(step: 2, method: "Add the rest of the ingredients and shake with ice."),
                                             Instruction(step: 3, method: "Double strain over a large cube."),
                                             Instruction(step: 4, method: "Garnish with a mint sprig skewered through a cucumber slice.")])

let ktCollinsBuild = Build(instructions: [Instruction(step: 1, method: "Muddle the celery in a cocktail shaker."),
                                          Instruction(step: 2, method: "Fill the shaker with ice, add the lemon juice, simple syrup, salt, and gin, and shake vigorously until the drink is sufficiently chilled."),
                                          Instruction(step: 3, method: "Strain into a Collins glass filled with ice. Top with club soda.")])

let maloneyParkBuild = Build(instructions: [Instruction(step: 1, method: "Combine the mint leaves, lime juice, and simple syrup in a cocktail shaker and gently muddle."),
                                            Instruction(step: 2, method: "Add the rum, then transfer to a chilled Collins glass, making sure that the mint is firmly settled at the bottom of the glass."),
                                            Instruction(step: 3, method: "Fill three quarters of the glass with pebble ice, and lightly swizzle."),
                                            Instruction(step: 4, method: "Float the bitters and lightly swizzle again to get a tricolor effect."),
                                            Instruction(step: 5, method: "Top with more pebble ice and garnish with a mint bouquet.")])


let mojitoBuildMnH = Build(instructions: [Instruction(step: 1, method: "Combine the mint, lime juice, simple syrup, and sugar cube in a cocktail shaker and gently muddle (bruise, but don't abuse!)."),
                                          Instruction(step: 2, method: "Add the rum and pour into a chilled rocks glass."),
                                          Instruction(step: 3, method: "Top with pebble ice and garnish with a mint bouquet.")])

let nocheBuenaBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients except for the Champagne into a tin and dry shake to emulsify."),
                                           Instruction(step: 2, method: "Add a few Kold Draft cubes and shake until cold."),
                                           Instruction(step: 3, method: "Immediately after shaking, pop the tin and double strain into a coupe."),
                                           Instruction(step: 4, method: "Top with Champagne and grate some cinnamon over the top.")])

let palmaFizzBuild = Build(instructions: [Instruction(step: 1, method: "Squeeze ½ oz (15 ml) of lime juice into a Collins glass (or a Moscow Mule mug) and drop in the empty half lime shell."),
                                          Instruction(step: 2, method: "Add 2 or 3 ice cubes, pour in the vodka, and fill with the ginger beer."),
                                          Instruction(step: 3, method: "Add a few drops of rosewater or spray the rosewater over the cocktail.")])

let penicillinBuild = Build(instructions: [Instruction(step: 1, method: "Mix all ingredients except the peated Islay Scotch together in a tin and shake with ice."),
                                           Instruction(step: 2, method: "Strain over ice."),
                                           Instruction(step: 3, method: "Float the Islay whisky on top of the cocktail."),
                                           Instruction(step: 4, method: "Garnish with candied ginger.")])

let piscoSourBuildMnH = Build(instructions: [Instruction(step: 1, method: "Add all ingredients except for the bitters into a tin and dry shake to emulsify."),
                                             Instruction(step: 2, method: "Add a few Kold Draft cubes and shake until cold. Do not over dilute."),
                                             Instruction(step: 3, method: "Immediately after shaking (with vigor), pop the tin and double strain very carefully into a stemmed glass. Create the least amount of turbulence here so that you create a smooth and even surface for the design with the bitters."),
                                             Instruction(step: 4, method: "Wait approximately 30 seconds after straining before proceeding with bitters decoration (this will allow for the egg white to settle).")])

let queensParkMnHBuild = Build(instructions: [Instruction(step: 1, method: "Combine the mint leaves, simple syrup, and lime juice in a cocktail shaker and gently muddle."),
                                              Instruction(step: 2, method: "Add the rum, then transfer to a chilled Collins glass, making sure that the mint is firmly settled at the bottom of the glass."),
                                              Instruction(step: 3, method: "Add pebble ice to come three-quarters of the way up the sides of the glass and lightly swizzle."),
                                              Instruction(step: 4, method: "Float the bitters and lightly swizzle again to get a tricolor effect."),
                                              Instruction(step: 5, method: "Top with pebble ice and garnish with a mint bouquet.")])

let queensParkLightMnHBuild = Build(instructions: [Instruction(step: 1, method: "Combine the mint, sugar cube, lime juice, and simple syrup in a cocktail shaker and gently muddle."),
                                                   Instruction(step: 2, method: "Add the rum and swirl to combine."),
                                                   Instruction(step: 3, method: "Pour the cocktail into a rocks glass and add pebble ice to come to just under the rim of the glass."),
                                                   Instruction(step: 4, method: "Add the bitters and lightly swizzle into a red layer on top of the drink, then top with more ice, shaping it into a cone."),
                                                   Instruction(step: 5, method: "Garnish with the mint sprig (tap it on the side of your hand to release the essential oils for the optimum aroma).")])

let rossCollinsBuild = Build(instructions: [Instruction(step: 1, method: "Combine the whiskey, lemon juice, simple syrup, 2 orange slices, and bitters in a cocktail shaker, fill with ice, and shake vigorously until the drink is sufficiently chilled."),
                                            Instruction(step: 2, method: "Strain into a Collins glass and top with club soda."),
                                            Instruction(step: 3, method: "Garnish with an orange slice and a brandied cherry.")])

let salditoBuild = Build(instructions: [Instruction(step: 1, method: "Combine the mezcal, honey syrup, and lime juice in a cocktail shaker, add one large ice cube, and shake vigorously until the drink is sufficiently chilled."),
                                        Instruction(step: 2, method: "Strain into a chilled coupe and garnish with a pinch each of cayenne pepper and sea salt.")])

let savoirFaireBuild = Build(instructions: [Instruction(step: 1, method: "Combine everything but the orange blossom water into a mixing glass and stir with ice."),
                                            Instruction(step: 2, method: "Prep a chilled coupe by spraying the orange blossom water into the glass before adding the stirred cocktail."),
                                            Instruction(step: 3, method: "Twist the lemon peel over the cocktail and add the twist in.")])

let siGueyBuild = Build(instructions: [Instruction(step: 1, method: "Build the drink over a large cube in a double old fashioned glass, starting with the bitters and ending with tequila."),
                                       Instruction(step: 2, method: "Stir."),
                                       Instruction(step: 3, method: "Float the whisky on top.")])

let silverFoxBuild = Build(instructions: [Instruction(step: 1, method: "Combine the egg white, orgeat syrup, lemon juice, and gin in a cocktail shaker and shake to emulsify the mixture."),
                                          Instruction(step: 2, method: "Add one large ice cube and shake vigorously until the drink is sufficiently chilled."),
                                          Instruction(step: 3, method: "Strain into a chilled 9-oz (270 ml) highball glass."),
                                          Instruction(step: 4, method: "Top with soda and float the amaretto or Faretti on top. Serve with a straw.")])

let silverLiningBuild = Build(instructions: [Instruction(step: 1, method: "Combine the whiskey, egg white, lemon juice, and Licor 43 in a cocktail shaker and shake to emulsify the mixture."),
                                             Instruction(step: 2, method: "Add one large ice cube and shake vigorously until the drink is sufficiently chilled."),
                                             Instruction(step: 3, method: "Strain into a chilled Collins glass filled with a long Collins ice cube."),
                                             Instruction(step: 4, method: "Top with club soda until the froth reaches the rim of the glass."),
                                             Instruction(step: 5, method: "Let stand for a moment so the foam settles, then add more club soda to raise the froth just over the rim of the glass.")])

let springForwardBuild = Build(instructions: [Instruction(step: 1, method: "Combine all the ingredients into a mixing glass and gently muddle the spring onion. Over-muddling will result in a bitter flavor."),
                                              Instruction(step: 2, method: "Add ice and stir."),
                                              Instruction(step: 3, method: "Strain into a chilled coupe and garnish with a spring onion.")])

let strawberryFixBuild = Build(instructions: [Instruction(step: 1, method: "Taste a piece of quartered strawberry for sweetness and tartness."),
                                              Instruction(step: 2, method: "Add the quartered strawberries to a chilled double rocks glass and muddle very gently to create a layer of strawberry 'jam' on the bottom of the glass."),
                                              Instruction(step: 3, method: "Fill the glass with pebble ice."),
                                              Instruction(step: 4, method: "Combine the lemon juice, simple syrup, and bourbon in a cocktail shaker and shake to mix."),
                                              Instruction(step: 5, method: "Pour over the pebble ice in the rocks glass. garnish with the whole strawberry, and serve with a straw."),
                                              Instruction(step: 6, method: "Garnish with a strawberry and serve with a straw.")])

let streetAndFlynnSpecialBuild = Build(instructions: [Instruction(step: 1, method: "Combine the rum, dram, ginger syrup, and lime juice in a cocktail shaker and shake vigorously until the drink is sufficiently chilled."),
                                                      Instruction(step: 2, method: "Strain into a Collins glass filled with 3 medium ice cubes and top with club soda."),
                                                      Instruction(step: 3, method: "Serve with a straw.")])

let tarzanCocktailBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients except for the soda into a tin and shake with ice."),
                                               Instruction(step: 2, method: "Strain into a Collins glass over ice and top with soda."),
                                               Instruction(step: 3, method: "Give a gentle stir.")])

let temperanceGrapefruitCollinsBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients except for the soda into a tin and shake with ice."),
                                                            Instruction(step: 2, method: "Strain over column ice and top with soda."),
                                                            Instruction(step: 3, method: "Give a gentle stir and then garnish with a grapefruit wedge.")])

let temperanceIrishBuild = Build(instructions: [Instruction(step: 1, method: "Heat up your mug with hot water."),
                                                Instruction(step: 2, method: "Dump the water then add all the ingredients, leaving the cream to float on top.")])

let theMedicinaLatinaBuild = Build(instructions: [Instruction(step: 1, method: "Mix all ingredients, except the smoky mezcal, together in a tin and shake with ice."),
                                                  Instruction(step: 2, method: "Strain over ice."),
                                                  Instruction(step: 3, method: "Float with mezcal."),
                                                  Instruction(step: 4, method: "Garnish with a piece of candied ginger.")])

let theSeaPlaneBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients except for the Champagne and absinthe into a tin and shake with ice."),
                                            Instruction(step: 2, method: "Strain into an absinthe-rinsed flute and top with Champagne."),
                                            Instruction(step: 3, method: "Give a gentle stir.")])

let theStarkBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except the bitters, into a tin and shake with ice."),
                                         Instruction(step: 2, method: "Strain into a double old fashioned glass and then fill the glass with cracked ice."),
                                         Instruction(step: 3, method: "Float the bitters on top.")])

let theTieBinderBuild = Build(instructions: [Instruction(step: 1, method: "Combine the purée and gin in a Champagne flute."),
                                             Instruction(step: 2, method: "Slowly top with the Champagne, stirring gently to incorporate.")])

let tritterCollinsBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients except for the soda into a tin and shake with ice."),
                                               Instruction(step: 2, method: "Strain over column ice and top with soda."),
                                               Instruction(step: 3, method: "Give a gentle stir and then garnish with a grapefruit peel after expression.")])

let tritterRickeyBuild = Build(instructions: [Instruction(step: 1, method: "Combine the lime juice, simple syrup, and gin in a cocktail shaker, add 1 large ice cube, and shake vigorously until the drink is sufficiently chilled."),
                                              Instruction(step: 2, method: "Put a large Collins ice cube in a chilled Collins glass and rinse with absinthe."),
                                              Instruction(step: 3, method: "Strain the cocktail into the glass and garnish with a mint sprig and top with soda.")])

let uSSRussellPunchBuild = Build(instructions: [Instruction(step: 1, method: "Start by peeling and juicing the lemons. Then set the peels aside to make an oleo saccharum."),
                                                Instruction(step: 2, method: "Combine the lemon peels and sugar in a large punch bowl and let stand for 1½ to 4 hours."),
                                                Instruction(step: 3, method: "Discard 80 percent of the peels from the sugar, brushing any sugar clinging to the peels back into the bowl."),
                                                Instruction(step: 4, method: "Add the lemon juice to the sugar; then add the 750ml bottles of Jamaican, white, and dark rums and gently whisk."),
                                                Instruction(step: 5, method: "Top with 2 to 3 bottles of Prosecco; add the nutmeg and whisk again."),
                                                Instruction(step: 6, method: "Add a 5-inch (13 cm) square block of ice and the cinnamon sticks and cloves. Refresh the punch with more Prosecco over the course of the party."),
                                                Instruction(step: 7, method: "Makes 10 liters. -Sasha Petraske, Regarding Cocktails.")])

let weddingPunchBuild = Build(instructions: [Instruction(step: 1, method: "Combine the 750ml bottles of liqueur, vermouth, and prosecco in a punch bowl large enough to hold an 8-inch (20 cm) square block of ice."),
                                             Instruction(step: 2, method: "Add the ice and garnish with the berries and citrus wheels."),
                                             Instruction(step: 3, method: "Makes 10.75 liters.")])

// MARK: Williams and Graham Classics

let bloodyMaryWnGBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients along with the ice and toss from tin to tin."),
                                              Instruction(step: 2, method: "Dirty dump.")])

let brambleWGBuild = Build(instructions: [Instruction(step: 1, method: "Shake all ingredients, except for the crème de cassis, in a tin with ice."),
                                          Instruction(step: 2, method: "Strain into a double old fashioned glass and add pebble ice."),
                                          Instruction(step: 3, method: "Drizzle the crème de mûre over the top."),
                                          Instruction(step: 4, method: "Garnish with a lemon wheel.")])

let cloverClubBuildWnG = Build(instructions: [Instruction(step: 1, method: "Muddle the raspberries then add the rest of the ingredients, except for the bitters, and dry shake."),
                                              Instruction(step: 2, method: "Add a few Kold Draft cubes and shake until cold. Do not over dilute."),
                                              Instruction(step: 3, method: "Immediately after shaking (with vigor), pop the tin and double strain very carefully into a stemmed glass."),
                                              Instruction(step: 4, method: "Drop bitters on top to make a design. Don't add too much bitters here."),
                                              Instruction(step: 5, method: "Garnish with a skewered raspberry.")])

let elDiabloBuildOrderWnG = Build(instructions: [Instruction(step: 1, method: "Shake everything but the ginger beer with ice."),
                                                 Instruction(step: 2, method: "Strain into a Collins glass full of ice and top with ginger beer.")])

let elksClubBuildWnG = Build(instructions: [Instruction(step: 1, method: "Add all ingredients except the soda water and dry shake."),
                                            Instruction(step: 2, method: "Add a few Kold Draft cubes and shake until cold."),
                                            Instruction(step: 3, method: "Immediately after shaking (with vigor), pop the tin and double strain into the soda."),
                                            Instruction(step: 4, method: "You can also choose to top with soda, but we find that the head doesn't get as fluffy that way."),
                                            Instruction(step: 5, method: "Express the lemon and then discard.")])

let espressoMartiniBuildWnG = Build(instructions: [Instruction(step: 1, method: "Add everything but the cream to a tin with ice and shake."),
                                                   Instruction(step: 2, method: "Strain into a chilled cocktail glass."),
                                                   Instruction(step: 3, method: "Float the Angostura cream and make a pretty design."),
                                                   Instruction(step: 4, method: "Garnish with 3 espresso beans.")])

let fogCutterWGBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients to a tin, except for the sherry, and shake with ice."),
                                            Instruction(step: 2, method: "Strain into a Collins glass and add pebble ice."),
                                            Instruction(step: 3, method: "Garnish with a mint bouquet and orange slices and then float the sherry on top.")])

let hotToddyWnGBuild = Build(instructions: [Instruction(step: 1, method: "Place all ingredients except the hot water in a small shaker tin."),
                                            Instruction(step: 2, method: "Fill the large shaker tin half full of near boiling water then float the small tin on top, bain-marie style."),
                                            Instruction(step: 3, method: "At the same time, heat your toddy glass up by adding hot water to it."),
                                            Instruction(step: 4, method: "After your ingredients are hot enough, dump the old water from the toddy glass and pour in the heated cocktail."),
                                            Instruction(step: 5, method: "Top it off with fresh hot water and garnish.")])

let irishCoffeeWnGBuild = Build(instructions: [Instruction(step: 1, method: "Pre-whip the cream so that it doubles in volume."),
                                               Instruction(step: 2, method: "Heat up the coffee and demerara sugar in a small shaker tin."),
                                               Instruction(step: 3, method: "Fill the large shaker tin half full of near boiling water then float the small tin on top, bain-marie style."),
                                               Instruction(step: 4, method: "At the same time, heat your toddy glass up by adding hot water to it."),
                                               Instruction(step: 5, method: "After your ingredients are hot enough, dump the old water from the toddy glass and pour in the heated cocktail."),
                                               Instruction(step: 6, method: "Add fresh hot coffee and top with stiff cream.")])

let majorBaileyBuildWnG = Build(instructions: [Instruction(step: 1, method: "Muddle mint before shaking, or simply shake with high quality ice cubes (Kold Draft or Hoshizaki) for the same effect."),
                                               Instruction(step: 2, method: "Double strain the shaken cocktail over ice in the glass."),
                                               Instruction(step: 3, method: "Garnish with a mint bouquet.")])

let morningGloryFizzWnGBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients except the soda water and dry shake."),
                                                    Instruction(step: 2, method: "Add a few Kold Draft cubes and shake until cold."),
                                                    Instruction(step: 3, method: "Immediately after shaking (with vigor), pop the tin and double strain into the soda."),
                                                    Instruction(step: 4, method: "You can also choose to top with soda, but we find that the head doesn't get as fluffy that way."),
                                                    Instruction(step: 5, method: "Express the lemon and then discard.")])

let NewYorkSourBuildWnG = Build(instructions: [Instruction(step: 1, method: "Mix all ingredients, except the red wine, together in a tin and dry shake to emulsify."),
                                               Instruction(step: 2, method: "Shake with ice being careful not to over dilute."),
                                               Instruction(step: 3, method: "Carefully strain into a chilled cocktail glass."),
                                               Instruction(step: 4, method: "Carefully float the red wine on top of the cocktail so that there's a clear separation between the wine and the rest of the cocktail.")])

let oldCubanWnGBuild = Build(instructions: [Instruction(step: 1, method: "Shake all of the ingredients, except for the sparkling wine, in a tin. Use Kold Draft or Hoshizaki cubes and the mint will be muddled while you're shaking."),
                                            Instruction(step: 2, method: "Double strain the shaken cocktail over the ice then top with Prosecco."),
                                            Instruction(step: 3, method: "Garnish with a mint sprig. Serve with a straw.")])

let oldFashionedWGBuild = Build(instructions: [Instruction(step: 1, method: "Add bitters, a sugar cube, and a splash of soda into a double old fashioned glass and muddle. The soda is just to break down the sugar cube."),
                                               Instruction(step: 2, method: "Add the whiskey, lemon expression, and lemon peel into the glass."),
                                               Instruction(step: 3, method: "With the back end of a bar spoon, guide a large rock into the glass so that it doesn't make a splash and stir until chilled.")])

let penicillinBuildWnG = Build(instructions: [Instruction(step: 1, method: "Mix all ingredients, except the Islay Scotch, together in a tin and shake with ice."),
                                              Instruction(step: 2, method: "Strain over ice."),
                                              Instruction(step: 3, method: "Float the peated Islay whisky on top of the cocktail."),
                                              Instruction(step: 4, method: "Garnish with a lemon wheel.")])

let piscoSourBuildWnG = Build(instructions: [Instruction(step: 1, method: "Add all ingredients except for the bitters into a tin and dry shake to emulsify."),
                                             Instruction(step: 2, method: "Add a few Kold Draft cubes and shake until cold. Do not over dilute."),
                                             Instruction(step: 3, method: "Immediately after shaking (with vigor), pop the tin and double strain very carefully into a stemmed glass. Create the least amount of turbulence here so that you create a smooth and even surface for the design with the bitters."),
                                             Instruction(step: 4, method: "Wait approximately 30 seconds after straining before proceeding with bitters decoration (this will allow for the egg white to settle).")])

let queensParkBuildWnG = Build(instructions: [Instruction(step: 1, method: "Add mint to the bottom of the Collins glass and gently press to release mint oils. Do not muddle."),
                                              Instruction(step: 2, method: "Pack the glass with pebble ice and add the rest of the ingredients, besides the Angostura bitters, and swizzle. Try to keep the mint at the bottom of the glass."),
                                              Instruction(step: 3, method: "Pack the glass with more ice to fill and then add the Angostura bitters."),
                                              Instruction(step: 4, method: "Garnish with a mint sprig.")])

let sazeracBuildWnG = Build(instructions: [Instruction(step: 1, method: "Muddle your sugar cube and bitters together in a mixing glass with a splash of soda water to help the sugar dissolve."),
                                           Instruction(step: 2, method: "Add the whiskey and ice and stir."),
                                           Instruction(step: 3, method: "Add your cocktail to the frozen absinthe-rinsed glass."),
                                           Instruction(step: 4, method: "Garnish with a lemon twist."),
                                           Instruction(step: 5, method: "The original was made with Cognac - it's excellent.")])

let sherryCobblerWnGBuild = Build(instructions: [Instruction(step: 1, method: "Muddle 4-6 seasonal berries and 2 orange moons."),
                                                 Instruction(step: 2, method: "Add the rest of your ingredients and shake."),
                                                 Instruction(step: 3, method: "Double strain over pebble ice and then garnish.")])

let sloeGinFizzBuildWnG = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the sparkling water, into a tin and dry shake."),
                                               Instruction(step: 2, method: "Shake with ice."),
                                               Instruction(step: 3, method: "Add soda to the glass then strain the cocktail over the soda."),
                                               Instruction(step: 4, method: "Express the lemon peel then garnish with the peel.")])

let tomCollinsWnGBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the soda, into a tin and shake with ice."),
                                              Instruction(step: 2, method: "Strain over cracked ice and top with soda."),
                                              Instruction(step: 3, method: "Give a gentle stir.")])

let whiskeySourBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients except for the bitters into a tin and dry shake to emulsify."),
                                            Instruction(step: 2, method: "Add a few Kold Draft cubes and shake until cold. Do not over dilute."),
                                            Instruction(step: 3, method: "Immediately after shaking (with vigor), pop the tin and double strain very carefully into a stemmed glass. Create the least amount of turbulence here so that you create a smooth and even surface for the design with the bitters. The bitters are optional here, but we think they add a bit of needed complexity to the cocktail."),
                                            Instruction(step: 4, method: "Wait approximately 30 seconds after straining before proceeding with bitters decoration (this will allow for the egg white to settle).")])

let airMailBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the Champagne, into a tin and shake with ice."),
                                        Instruction(step: 2, method: "Add Champagne to the glass first. This seems to be the best way to preserve the carbonation. A common alternative is to add the bubbles to the tin then strain it into the glass. If you do this, make sure you aren't double straining with a tea strainer and immediately killing the carbonation."),
                                        Instruction(step: 3, method: "Add the shaken cocktail to that.")])

let aperolSpritzBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients to the wine glass."),
                                             Instruction(step: 2, method: "Add cubed ice for less dilution and to retain its effervescence."),
                                             Instruction(step: 3, method: "Give a gentle stir and garnish with an orange twist.")])

let bizzyIzzyHighballBuild = Build(instructions: [Instruction(step: 1, method: "We tried to keep the recipe as close to the one in the book. Though the book doesn't have soda in the recipe (so feel free to omit), it still labels it as a highball and doesn't mention any sort of garnish."),
                                                  Instruction(step: 2, method: "However, if you do add the sparkling water, add it last after you've shaken and strained the cocktail.")])

let bloodyMaryBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients along with the ice and toss from tin to tin or shake gently."),
                                           Instruction(step: 2, method: "Dirty dump."),
                                           Instruction(step: 3, method: "Go nuts with the garnish if you'd like to.")])

let blueBlazerBuild = Build(instructions: [Instruction(step: 1, method: "Heat your Blue Blazer mugs and toddy glass with boiling water. Place the whisky in the small tin in a large tin on top of the boiling water."),
                                           Instruction(step: 2, method: "After your glass is sufficiently warm, dump the old water and add two oz of fresh hot water to your toddy glass."),
                                           Instruction(step: 3, method: "Add the bitters, lemon peel, and sugar cubes and muddle."),
                                           Instruction(step: 4, method: "Pour out the hot water from the blue blazer mugs leaving two oz of hot water in one."),
                                           Instruction(step: 5, method: "Add the overproof Scotch to the hot water in one of the mugs. The trick here is to have a scotch that's over 54% ABV."),
                                           Instruction(step: 6, method: "Tilt the mug and set ablaze."),
                                           Instruction(step: 7, method: "With the handles pointing towards your body, hold the mugs like you would hold a gun. This is a Sean Kenyon tip."),
                                           Instruction(step: 8, method: "Start the transfer of fiery liquid from one mug to the other slowly and with little distance between the two, gradually increasing the distance with each pull."),
                                           Instruction(step: 9, method: "After ten plus pulls, and when everyone is sufficiently dazzled, the toddy should be ready to transfer to your glass.")])

let brandyCrustaBuild = Build(instructions: [Instruction(step: 1, method: "The glass for this cocktail needs to be prepared ahead of time. It's a narrow-mouthed, stemmed cocktail glass, fitted with a wide ribbon of lemon peel around the rim. Rim the peel and glass with sugar and chill the glass."),
                                             Instruction(step: 2, method: "This is a stirred cocktail. So stir and then strain into the prepared glass.")])

let caipirinhaBuild = Build(instructions: [Instruction(step: 1, method: "Cut half of a lime into 6 pieces and add the pieces into a tin along with the sugar and simple."),
                                           Instruction(step: 2, method: "Muddle until you get all the juice out of the lime. Granulated sugar helps extract the oils from the lime skin."),
                                           Instruction(step: 3, method: "Add the cachaça and ice and shake with vigor! This is a cocktail that does well with a little extra shaking."),
                                           Instruction(step: 4, method: "Pour all of the contents of the tin into your double old fashioned glass and serve with a straw.")])

let cloverClubBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients into a tin and dry shake to emulsify."),
                                           Instruction(step: 2, method: "Add a few Kold Draft cubes and shake until cold. Do not over dilute."),
                                           Instruction(step: 3, method: "Immediately after shaking (with vigor), pop the tin and double strain very carefully into a stemmed glass."),
                                           Instruction(step: 4, method: "Garnish with a raspberry.")])

let darkNStormyBuild = Build(instructions: [Instruction(step: 1, method: "Build in glass starting with the ice, ginger beer, and lime."),
                                            Instruction(step: 2, method: "Float the dark rum and add a lime wheel for garnish.")])

let elksOwnCocktailBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients and dry shake."),
                                                Instruction(step: 2, method: "Add a few Kold Draft cubes and shake until cold."),
                                                Instruction(step: 3, method: "Strain into a chilled stemmed glass.")])

let french75Build = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the Champagne, into a tin and shake with ice."),
                                         Instruction(step: 2, method: "Strain over cracked ice and top with Champagne."),
                                         Instruction(step: 3, method: "Give a gentle stir.")])

let french75CognacBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the Champagne, into a tin and shake with ice."),
                                               Instruction(step: 2, method: "Strain into the flute and top with Champagne."),
                                               Instruction(step: 3, method: "Give a gentle stir.")])

let harveyWallbangerBuild = Build(instructions: [Instruction(step: 1, method: "Build in glass."),
                                                 Instruction(step: 2, method: "Float the Galliano.")])

let irishCoffeeBuild = Build(instructions: [Instruction(step: 0, method: "This recipe was reverse engineered in San Francisco to create the famous Irish Coffee at Buena Vista Cafe."),
                                            Instruction(step: 1, method: "Pre-whip the cream so that it doubles in volume."),
                                            Instruction(step: 2, method: "Warm your Irish Coffee glass up by adding hot water to it then drain."),
                                            Instruction(step: 3, method: "Add 2 demerara or brown sugar cubes to the glass then add the hot coffee and stir to dissolve the sugar."),
                                            Instruction(step: 4, method: "Add fresh hot coffee and top with stiff cream.")])

let majorBaileyBuild = Build(instructions: [Instruction(step: 1, method: "Muddle mint before shaking, or simply shake with high quality ice cubes (Kold Draft or Hoshizaki) for the same effect."),
                                            Instruction(step: 2, method: "Double strain the shaken cocktail over ice in the glass."),
                                            Instruction(step: 3, method: "Garnish with a mint sprig.")])

let mintJulepBuild = Build(instructions: [Instruction(step: 1, method: "In a highball or julep cup, gently muddle 8-10 mint leaves along with the simple syrup. I mean very gently."),
                                          Instruction(step: 2, method: "Add pebble or crushed ice and then add the spirit of choice. Cognac or Armagnac was common during its conception but American whiskey has become more popular in recent years."),
                                          Instruction(step: 3, method: "Use a swizzle stick or bar spoon to stir until the outside of the glass starts to get frosty."),
                                          Instruction(step: 4, method: "Add ice to the rim of the cup and stir a couple more times."),
                                          Instruction(step: 5, method: "Add the straw and then snow cone the top of the cocktail with ice so that the straw does not disturb the ice on top. Optional: Float funky Jamaican rum and use French brandy as a base!"),
                                          Instruction(step: 6, method: "Garnish with a mint bouquet. Optional: Top mint with powdered sugar.")])

let mojitoBuild = Build(instructions: [Instruction(step: 1, method: "Add all of the ingredients except for the soda to the shaker tin."),
                                       Instruction(step: 2, method: "Muddle mint before shaking, or simply shake with high quality ice cubes (Kold Draft or Hoshizaki) for the same effect."),
                                       Instruction(step: 3, method: "Add the ice then soda to the glass. Try not to pour the soda directly over the ice."),
                                       Instruction(step: 4, method: "Double strain the shaken cocktail over the soda and ice."),
                                       Instruction(step: 5, method: "Garnish with a mint bouquet. Serve with a straw.")])

let morningGloryFizzBuild = Build(instructions: [Instruction(step: 1, method: "'Shake well in shaker and strain; fill balance of glass with seltzer or Vichy water.'")])

let newYorkSourBuild = Build(instructions: [Instruction(step: 1, method: "Mix all ingredients, except the red wine, together in a tin and shake with ice."),
                                            Instruction(step: 2, method: "Strain into a chilled cocktail glass."),
                                            Instruction(step: 3, method: "Carefully float the red wine on top of the cocktail so that there's a clear separation between the wine and the rest of the cocktail.")])

let palomaBuild = Build(instructions: [Instruction(step: 1, method: "While this is typically a built cocktail, feel free to shake all ingredients except the soda to make it extra cold."),
                                       Instruction(step: 2, method: "We like to add saline into the cocktail rather than a pinch of salt. Some prefer a salt rim. Either way is fine.")])

let piscoSourBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients except for the bitters into a tin and dry shake to emulsify."),
                                          Instruction(step: 2, method: "Add a few Kold Draft cubes and shake until cold. Do not over dilute."),
                                          Instruction(step: 3, method: "Immediately after shaking (with vigor), pop the tin and double strain very carefully into a stemmed glass. Create the least amount of turbulence here so that you create a smooth and even surface for the design with the bitters."),
                                          Instruction(step: 4, method: "Wait approximately 30 seconds after straining before proceeding with bitters decoration (this will allow for the egg white to settle).")])

let queensParkBuild = Build(instructions: [Instruction(step: 0, method: "The original recipe calls for the 'juice of half a lime and 15ml of sugar syrup.' Interpret that how you will."),
                                           Instruction(step: 1, method: "Add all ingredients to a tall glass and swizzle."),
                                           Instruction(step: 2, method: "Garnish with mint.")])

let saturnBuildOrder = Build(instructions: [Instruction(step: 1, method: "Skewer the lemon peel around the cherry to make it look like the rings of Saturn. The original cocktail was blended. So, blend if you must.")])

let sazeracBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients except for the absinthe into a mixing glass with ice and stir until cold."),
                                        Instruction(step: 2, method: "Spray your frozen single old fashioned glass with 5 spritzes of absinthe. Another option is to add 1/4 oz into the glass and spin to glaze the inside."),
                                        Instruction(step: 3, method: "Add your cocktail to the rinsed glass."),
                                        Instruction(step: 4, method: "Garnish with a lemon twist.")])

let sherryCobblerBuild = Build(instructions: [Instruction(step: 1, method: "Muddle 2 orange moons and then add your lemon peel."),
                                              Instruction(step: 2, method: "Add the rest of your ingredients and shake with cubed ice."),
                                              Instruction(step: 3, method: "Double strain over pebble ice and then garnish.")])

let sloeGinFizzBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the sparkling water, and shake with ice."),
                                            Instruction(step: 2, method: "Add soda to the glass then strain the cocktail over the soda."),
                                            Instruction(step: 3, method: "Garnish with a lemon peel after expression.")])

let southSideFizzBuild = Build(instructions: [Instruction(step: 1, method: "Add all of the ingredients except for the soda to the shaker tin."),
                                              Instruction(step: 2, method: "Muddle mint before shaking, or simply shake with high quality ice cubes (Kold Draft or Hoshizaki) for the same effect."),
                                              Instruction(step: 3, method: "Add soda to the glass."),
                                              Instruction(step: 4, method: "Double strain the shaken cocktail over the soda.")])

let tiPunchBuildOrder = Build(instructions: [Instruction(step: 1, method: "Think of this as an old fashioned without the bitters. The ice is optional."),
                                             Instruction(step: 2, method: "Build in glass.")])

let tomCollinsBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the soda, into a tin and shake with ice."),
                                           Instruction(step: 2, method: "Strain over cracked ice and top with soda."),
                                           Instruction(step: 3, method: "Give a gentle stir.")])

let wardEightBuild = Build(instructions: [Instruction(step: 1, method: "It says the orange juice or orange Curaçao is optional. But this seems to be a common modern through line. So, we added it to the spec."),
                                          Instruction(step: 2, method: "However you make it, add the sparkling water last after you've shaken and strained the cocktail.")])

let whiskeySmashBuild = Build(instructions: [Instruction(step: 0, method: "For a classic recipe, substitute a few lemon wedges in place of squeezed lemon juice. Then muddle them with the mint before adding the other ingredients."),
                                             Instruction(step: 1, method: "In a tin, gently muddle the mint if you don't have sizable ice cubes to do the muddling for you while shaking."),
                                             Instruction(step: 2, method: "Double strain over pebble ice."),
                                             Instruction(step: 3, method: "Garnish with mint sprig.")])

let whiskeySourOGBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients except for the bitters into a tin and dry shake to emulsify."),
                                              Instruction(step: 2, method: "Add a few Kold Draft cubes and shake until cold. Do not over dilute."),
                                              Instruction(step: 3, method: "Immediately after shaking (with vigor), pop the tin and double strain into a stemmed glass.")])

// MARK: MiscModernCocktails

let skyRocketBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the soda, into a tin and shake with ice."),
                                          Instruction(step: 2, method: "Add soda and ice into the glass and top with the shaken cocktail.")])

let caucasianBuild = Build(instructions: [Instruction(step: 1, method: "Add everything but the cream to a frozen fizz glass or small highball and stir."),
                                          Instruction(step: 2, method: "Top with cream.")])

let eastSideBuild = Build(instructions: [Instruction(step: 1, method: "Muddle the cucumber in a tin. If you have large cubed ice like Kold Draft, you can shake in the mint; otherwise give the mint a gentle muddle."),
                                         Instruction(step: 2, method: "Shake all of the ingredients except for the soda in a tin."),
                                         Instruction(step: 3, method: "Add the ice then soda to the glass. Try not to pour the soda directly over the ice."),
                                         Instruction(step: 4, method: "Double strain the shaken cocktail over the soda and ice."),
                                         Instruction(step: 5, method: "Garnish with a mint bouquet. Serve with a straw.")])

let oldCubanBuild = Build(instructions: [Instruction(step: 1, method: "Add all of the ingredients except for the Champagne to the shaker tin."),
                                         Instruction(step: 2, method: "Muddle mint before shaking, or simply shake with high quality ice cubes (Kold Draft or Hoshizaki) for the same effect."),
                                         Instruction(step: 3, method: "Double strain the shaken cocktail over the Champagne in a chilled glass."),
                                         Instruction(step: 4, method: "Garnish with a mint sprig. Serve with a straw.")])

let prizefighterNo1Build = Build(instructions: [Instruction(step: 1, method: "Muddle the mint and lemon wedges together with the simple, putting the force mostly on the lemon wedges. Try not to muddle the mint too much. If you'd rather just use lemon juice, just use 3/4 of an ounce while still shaking in the fresh mint."),
                                                Instruction(step: 2, method: "Add all of the rest of the ingredients and shake."),
                                                Instruction(step: 3, method: "Double strain the shaken cocktail into double old fashioned glass and top with pebble or cracked ice."),
                                                Instruction(step: 4, method: "Garnish with a mint bouquet.")])

let whiteLinenBuild = Build(instructions: [Instruction(step: 1, method: "Muddle the cucumber into a mixing tin."),
                                           Instruction(step: 2, method: "Add all of the ingredients, leaving the soda for after you're done shaking."),
                                           Instruction(step: 3, method: "Double strain the shaken cocktail into an ice-filled Collins glass and top with soda."),
                                           Instruction(step: 4, method: "Garnish with cucumber.")])

let starfishAndCoffeeBuild = Build(instructions: [Instruction(step: 1, method: "Place large ice cube into glass."),
                                                  Instruction(step: 2, method: "Pour 3oz tonic over the ice."),
                                                  Instruction(step: 3, method: "Shake remaining ingredients vigorously."),
                                                  Instruction(step: 4, method: "Pour carefully from shaker, layering contents so they float on top of the tonic.")])

// MARK: Williams and Graham house cocktails

let americanGothicBuild = Build(instructions: [Instruction(step: 1, method: "Combine all ingredients, except for the absinthe, into a mixing glass with ice and stir."),
                                               Instruction(step: 2, method: "Rinse a double old fashioned glass with absinthe."),
                                               Instruction(step: 3, method: "Strain the cocktail into the glass over a large rock.")])

let beckyWithTheGoodHairBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients into a tin and dry shake to emulsify."),
                                                     Instruction(step: 2, method: "Add a few Kold Draft cubes and shake until cold."),
                                                     Instruction(step: 3, method: "Immediately after shaking, pop the tin and double strain into a flip glass."),
                                                     Instruction(step: 4, method: "Grate some nutmeg over the top.")])

let blackberrySageSmashBuild = Build(instructions: [Instruction(step: 1, method: "In a tin, muddle 4 blackberries and a small pinch of sage."),
                                                    Instruction(step: 2, method: "Add your ingredients and shake with ice."),
                                                    Instruction(step: 3, method: "Double strain over pebble ice."),
                                                    Instruction(step: 4, method: "Garnish with blackberry and sage.")])

let cellarDoorBuild = Build(instructions: [Instruction(step: 1, method: "Place all ingredients in a small shaker tin."),
                                           Instruction(step: 2, method: "Fill the large shaker tin half full of near-boiling water then float the small tin on top, bain-marie style."),
                                           Instruction(step: 3, method: "At the same time, heat your tea cup by adding hot water to it. Remove water before adding the cocktail."),
                                           Instruction(step: 4, method: "After the cocktail is sufficiently heated, emulsify with a small electric milk-frother and then pour into the tea cup."),
                                           Instruction(step: 5, method: "Grate cinnamon on top and add almonds and raisins to the saucer for garnish.")])

let coffeeAndCigsBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients besides the cream over a large rock into a double old fashioned glass and stir in glass."),
                                              Instruction(step: 2, method: "Float the stiff cream on top."),
                                              Instruction(step: 3, method: "Garnish with grated nutmeg.")])

let easternDiplomatBuild = Build(instructions: [Instruction(step: 1, method: "Combine all ingredients, except for the absinthe, into a mixing glass with ice and stir."),
                                                Instruction(step: 2, method: "Rinse a coupe glass with absinthe."),
                                                Instruction(step: 3, method: "Strain the cocktail into the prepared glass.")])

let easyStreetBuild = Build(instructions: [Instruction(step: 1, method: "In a tin, muddle 1 blackberry and 1 raspberry."),
                                           Instruction(step: 2, method: "Add all ingredients, except for bitters and port, and shake with ice."),
                                           Instruction(step: 3, method: "Double strain over pebble ice in a double old fashioned glass."),
                                           Instruction(step: 4, method: "Float Peychaud's and port."),
                                           Instruction(step: 5, method: "Garnish with mint sprig and berries.")])

let featheredHatFlipBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except the bitters, into a tin and dry shake to emulsify."),
                                                 Instruction(step: 2, method: "Add a few Kold Draft cubes and shake until cold."),
                                                 Instruction(step: 3, method: "Immediately after shaking, pop the tin and double strain into a flip glass."),
                                                 Instruction(step: 4, method: "Make a design with Angostura on top.")])

let featheredHatFlip2Build = Build(instructions: [Instruction(step: 1, method: "Add all ingredients into a tin and dry shake to emulsify."),
                                                  Instruction(step: 2, method: "Add a few Kold Draft cubes and shake until cold."),
                                                  Instruction(step: 3, method: "Immediately after shaking, pop the tin and double strain into a flip glass.")])

let heartOfGoldBuild = Build(instructions: [Instruction(step: 1, method: "Combine all ingredients, except for the Ardbeg Scotch, into a mixing glass with ice and stir."),
                                            Instruction(step: 2, method: "Rinse your stemmed glassware with the Ardbeg."),
                                            Instruction(step: 3, method: "Strain the cocktail into the prepared glass.")])

let irishGoodbyeBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the absinthe, into a mixing glass with ice and stir."),
                                             Instruction(step: 2, method: "Prepare a double old fashioned glass by rinsing it with absinthe. We use about 5 spritzes but you can swirl 1/4 oz of absinthe in the glass if you don't have an atomizer."),
                                             Instruction(step: 3, method: "Add a large rock and strain the cocktail into the prepared glass.")])

let longWayDownBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except the bitters, into a tin and shake with ice."),
                                            Instruction(step: 2, method: "Strain into a Collins glass and then fill the glass with pebble ice."),
                                            Instruction(step: 3, method: "Add a mint sprig for garnish and float the bitters on top of the ice.")])

let peaksOfReykjavicBuild = Build(instructions: [Instruction(step: 1, method: "Add mint to the bottom of the Collins glass and gently press to release mint oils. Do not muddle."),
                                                 Instruction(step: 2, method: "Pack the glass with pebble ice and add the rest of the ingredients, besides the bitters, and swizzle. Try to keep the mint at the bottom of the glass."),
                                                 Instruction(step: 3, method: "Pack the glass with more ice to fill and then add the bitters."),
                                                 Instruction(step: 4, method: "Garnish with a raspberry and mint sprig.")])

let peanutButterFalconBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients except the bitters into a tin and shake with ice."),
                                                   Instruction(step: 2, method: "Strain into a stemmed glass."),
                                                   Instruction(step: 3, method: "Dash the bitters over the top of the glass so that it makes an X. The black walnut bitters will float to make the design.")])

let reyonVertBuild = Build(instructions: [Instruction(step: 1, method: "Add the basil to a tin and nitro muddle (muddle with liquid nitrogen)."),
                                          Instruction(step: 2, method: "Add the rest of the ingredients excluding the absinthe and shake."),
                                          Instruction(step: 3, method: "Rinse the glass with absinthe (4-5 spritzes with an atomizer)."),
                                          Instruction(step: 4, method: "Double strain over a large rock."),
                                          Instruction(step: 5, method: "Garnish with a basil sprig.")])

let shokuninBuild = Build(instructions: [Instruction(step: 1, method: "Stir the sake, vermouth and Campari."),
                                         Instruction(step: 2, method: "Flame the orange into the chilled glass then add the stirred cocktail."),
                                         Instruction(step: 3, method: "Add pebble ice."),
                                         Instruction(step: 4, method: "Drop chili oil over the ice and serve. No straw.")])

let smokingMonkeyBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients except the bitters and dry shake."),
                                              Instruction(step: 2, method: "Shake with ice."),
                                              Instruction(step: 3, method: "Double strain the shaken cocktail into stemmed glassware."),
                                              Instruction(step: 4, method: "Decorate with a design of Angostura and Peychaud's bitters.")])

let spanishRevivalBuild = Build(instructions: [Instruction(step: 1, method: "Combine all ingredients, except for the absinthe, into a tin with ice and shake."),
                                               Instruction(step: 2, method: "Rinse your stemmed glassware with the absinthe."),
                                               Instruction(step: 3, method: "Strain the cocktail into the prepared glass and garnish with a grapefruit peel.")])

let sunnySideBuild = Build(instructions: [Instruction(step: 1, method: "Prepare your glass with the absinthe rinse. Two spritzes with an atomizer works well."),
                                          Instruction(step: 2, method: "Muddle mint before shaking, or simply shake with high quality ice cubes (Kold Draft or Hoshizaki) for the same effect."),
                                          Instruction(step: 3, method: "Double strain the shaken cocktail over one large rock."),
                                          Instruction(step: 4, method: "Garnish with a mint bouquet tucked between the rock and the wall of the glass.")])

let stagPartyBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, besides the cream, to a mixing glass and stir."),
                                          Instruction(step: 2, method: "Strain into a frozen single old fashioned glass."),
                                          Instruction(step: 3, method: "Float the stiff cream on top and garnish with an orange peel.")])

let whereEaglesFlyBuild = Build(instructions: [Instruction(step: 1, method: "Gently muddle the basil."),
                                               Instruction(step: 2, method: "Add the rest of the ingredients except for the Prosecco."),
                                               Instruction(step: 3, method: "Shake and then double strain over ice."),
                                               Instruction(step: 4, method: "Top with Prosecco."),
                                               Instruction(step: 5, method: "Garnish with a lemon wheel and basil.")])

let zombie129Build = Build(instructions: [Instruction(step: 1, method: "Put all ingredients, except for the bitters and absinthe, in a tin and shake with ice."),
                                          Instruction(step: 2, method: "Strain into a tiki mug that's been rinsed with absinthe and add pebble ice."),
                                          Instruction(step: 3, method: "Garnish with pineapple fronds and finish with a spray of Angostura bitters on top of the cocktail.")])

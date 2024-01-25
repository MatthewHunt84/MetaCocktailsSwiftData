//
//  BrandyCrusta.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var brandyCrusta = Cocktail(cocktailName: "Brandy Crusta",
                            glasswareType: .crustaGlass,
                            author:Author(person: AuthorNames.jerryThomas.rawValue,
                                          place: AuthorPlaces.howToMixDrinksJT.rawValue,
                                          year: "1862"),
                            spec: brandyCrustaSpec,
                            buildOrder: brandyCrustaBuild,
                            tags: brandyCrustaTags)

var brandyCrustaSpec    = [CocktailIngredient(.juices(.lemon), value: 0.5, unit: .teaspoon),
                           CocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 1, unit: .teaspoon),
                           CocktailIngredient(.syrups(.richSimple), value: 1, unit: .teaspoon),
                           CocktailIngredient(.bitters(.angosturaBitters), value:2, unit: .dashes),
                           CocktailIngredient(.brandies(.brandyAny), value:2)]

var brandyCrustaTags     = Tags(textures: [.rich],
                                styles: [.sour, .stirred])

var brandyCrustaBuild = Build(instructions: [Instruction(step: 1, method: "The glass for this cocktail needs to be prepared ahead of time. It's a narrow mouthed, stemmed cocktail glass, fitted with a wide ribbon of lemon peel around the rim. Rim the peel and glass with sugar and chill the glass."),
                                             Instruction(step: 2, method: "This is a stirred cocktail. So stir and then strain into the prepared glass.")])





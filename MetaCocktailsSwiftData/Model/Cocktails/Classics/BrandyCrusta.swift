//
//  BrandyCrusta.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var brandyCrusta = Cocktail(cocktailName: "Brandy Crusta",
                            glasswareType: .crustaGlass,
                            author: jerryThomas,
                            spec: brandyCrustaSpec,
                            buildOrder: brandyCrustaBuild,
                            tags: brandyCrustaTags,
                            variation: .brandyCrusta,
                            collection: .originals,
                            titleCocktail: true)

var brandyCrustaSpec    = [OldCocktailIngredient(.juices(.lemon), value: 1, unit: .dashes),
                           OldCocktailIngredient(.liqueurs(.orangeCuracao), value: 2, unit: .dashes),
                           OldCocktailIngredient(.syrups(.gommeSyrup), value: 4, unit: .dashes, prep: PrepBible.gommeSyrup),
                           OldCocktailIngredient(.bitters(.angosturaBitters), value:1, unit: .dashes),
                           OldCocktailIngredient(.brandies(.brandyAny), value:2)]

var brandyCrustaTags     = Tags(profiles: [.spiritForward, .rich, .fruity],
                                styles: [.sour, .stirred])

var brandyCrustaBuild = Build(instructions: [Instruction(step: 1, method: "The glass for this cocktail needs to be prepared ahead of time. It's a narrow mouthed, stemmed cocktail glass, fitted with a wide ribbon of lemon peel around the rim. Rim the peel and glass with sugar and chill the glass."),
                                             Instruction(step: 2, method: "This is a stirred cocktail. So stir and then strain into the prepared glass.")])





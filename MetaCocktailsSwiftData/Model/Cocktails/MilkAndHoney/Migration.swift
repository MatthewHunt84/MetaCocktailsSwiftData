//
//  Migration.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/9/24.
//

import Foundation

var migration = Cocktail(cocktailName: "Migration",
                         glasswareType: .doubleOld,
                         garnish: [.grapefruitPeel],
                         ice: .bigRock,
                         author: sashaPetraske,
                         spec: migrationSpec,
                         tags: migrationTags,
                         collection: .milkAndHoney)

var migrationSpec  = [OldCocktailIngredient(.rums(.goslingsBlackSeal), value: 0.75),
                      OldCocktailIngredient(.rums(.cruzanBlackstrap), value: 0.75),
                      OldCocktailIngredient(.fortifiedWines(.cocchiDeTorino), value: 0.75),
                      OldCocktailIngredient(.amari(.cynar), value: 0.75)]

var migrationTags   = Tags(profiles: [.bitter, .spiritForward,],
                           styles: [.stirred, .negroni])



//
//  CocktailMenuViewModel.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/25/24.
//

import SwiftUI
import Observation

@Observable final class RecipeViewModel {
    
    init(cocktail: Cocktail) {
        self.cocktail = cocktail
        self.cocktailGlassImage = cocktail.glasswareType.glassImage(cocktail: cocktail)
        self.methodString = getMethodText(cocktail: cocktail)
    }
    
    var cocktail: Cocktail
    var cocktailGlassImage: Image
    var methodString: String?
    var currentIngredientRecipe: Prep = PrepBible.demSyrupPrep
    var isShowingIngredientRecipe: Bool = false 
    
    var backDegree = -90.0
    var frontDegree = 0.0
    var isFlipped = false
    let durationAndDelay: CGFloat = 0.25
    
    func flipCard() {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.easeIn(duration: durationAndDelay)) {
                frontDegree = 90
            }
            withAnimation(.snappy(duration: durationAndDelay).delay(durationAndDelay)) {
                backDegree = 0
            }
        } else {
            withAnimation(.easeIn(duration: durationAndDelay)) {
                backDegree = -90
            }
            withAnimation(.snappy(duration: durationAndDelay).delay(durationAndDelay)) {
                frontDegree = 0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                self.isShowingIngredientRecipe = false
            }
        }
    }
    
//    func findPrepItems() -> [Ingredient] {
//        var prepItems: [Ingredient] = []
//        for ingredient in cocktail.spec {
//            if ingredient.ingredientBase.name == Syrup.honeySyrup.rawValue ||
//               ingredient.ingredientBase.name == Syrup.agaveSyrup.rawValue ||
//               ingredient.ingredientBase.name == Syrup.cinnamonSyrup.rawValue ||
//               ingredient.ingredientBase.name == Syrup.cucumberSyrup.rawValue ||
//               ingredient.ingredientBase.name == Syrup.gingerSyrup.rawValue ||
//               ingredient.ingredientBase.name == Syrup.grapefruitShrub.rawValue ||
//               ingredient.ingredientBase.name == Syrup.grenadine.rawValue ||
//               ingredient.ingredientBase.name == Syrup.morenthalersGingerSyrup.rawValue ||
//               ingredient.ingredientBase.name == Syrup.orgeat.rawValue ||
//               ingredient.ingredientBase.name == Syrup.passionfruitSyrup.rawValue ||
//               ingredient.ingredientBase.name == Syrup.raspberrySyrup.rawValue ||
//               ingredient.ingredientBase.name == Syrup.richDem.rawValue ||
//               ingredient.ingredientBase.name == Syrup.richSimple.rawValue ||
//               ingredient.ingredientBase.name == Syrup.vanilla.rawValue ||
//               ingredient.ingredientBase.name == Vodka.peanutButterVodka.rawValue {
//                prepItems.append(ingredient)
//            }
//    }
//        
//        return prepItems
//        
//    }
    
    func getMethodText(cocktail: Cocktail) -> String? {
        if let styles = cocktail.compiledTags.styles?.sorted() {
            if styles.contains([.blended, .shaken]) { return "Shake or blend" }
            else if styles.contains(.built) { return "Build in glass" }
            else if styles.contains(.shaken) { return "Shake" }
            else if styles.contains(.stirred) { return "Stir" }
            else if styles.contains(.swizzle) { return "Swizzle" }
        }
        return nil
    }
}

struct NavigationLinkWithoutIndicator<Label: View, Destination: View>: View {
    let label: () -> Label
    let destination: () -> Destination

    init(@ViewBuilder label: @escaping () -> Label,
         @ViewBuilder destination: @escaping () -> Destination) {
        self.label = label
        self.destination = destination
    }

    var body: some View {
        ZStack {
            NavigationLink {
                self.destination()
            } label: {
                EmptyView()
            }
            .opacity(0)
            self.label()
        }
        
    }
}



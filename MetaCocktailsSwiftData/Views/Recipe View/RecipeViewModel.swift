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
        }
    }
    
    func findPrepItems() -> [CocktailIngredient] {
        var prepItems: [CocktailIngredient] = []
        for ingredient in cocktail.spec {
            if ingredient.ingredient.name == Syrup.honeySyrup.rawValue || ingredient.ingredient.name == Syrup.agaveSyrup.rawValue || ingredient.ingredient.name == Syrup.cinnamonSyrup.rawValue || ingredient.ingredient.name == Syrup.cucumberSyrup.rawValue || ingredient.ingredient.name == Syrup.gingerSyrup.rawValue || ingredient.ingredient.name == Syrup.grapefruitShrub.rawValue || ingredient.ingredient.name == Syrup.grenadine.rawValue || ingredient.ingredient.name == Syrup.morenthalersGingerSyrup.rawValue || ingredient.ingredient.name == Syrup.orgeat.rawValue || ingredient.ingredient.name == Syrup.passionfruitSyrup.rawValue || ingredient.ingredient.name == Syrup.raspberrySyrup.rawValue || ingredient.ingredient.name == Syrup.richDem.rawValue || ingredient.ingredient.name == Syrup.richSimple.rawValue || ingredient.ingredient.name == Syrup.vanilla.rawValue || ingredient.ingredient.name == Vodka.peanutButterVodka.rawValue {
                prepItems.append(ingredient)
            }
    }
        
        return prepItems
        
    }
    
    func getMethodText(cocktail: Cocktail) -> String? {
        if let styles = cocktail.compiledTags.styles?.sorted() {
            if styles.contains([.blended, .shaken]) { return "Build in glass" }
            else if styles.contains(.built) { return "Shake or Blend" }
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



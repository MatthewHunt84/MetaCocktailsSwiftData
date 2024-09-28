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
        isFlipped.toggle()
        
        if isFlipped {
            withAnimation(.easeInOut(duration: durationAndDelay)) {
                frontDegree = 90
            }
            withAnimation(.easeInOut(duration: durationAndDelay).delay(durationAndDelay)) {
                backDegree = 0
            }
        } else {
            withAnimation(.easeInOut(duration: durationAndDelay)) {
                backDegree = -90
            }
            withAnimation(.easeInOut(duration: durationAndDelay).delay(durationAndDelay)) {
                frontDegree = 0
            }
        }
    }
    
    func getMethodText(cocktail: Cocktail) -> String? {
        if let styles = cocktail.compiledTags.styles?.sorted() {
            if styles.contains([.blended, .shaken]) { return "Shake or blend" }
            else if styles.contains(.built) { return "Build in glass" }
            else if styles.contains(.shaken) { return "Shake" }
            else if styles.contains(.blended) { return "Blended" }
            else if styles.contains(.stirred) { return "Stir" }
            else if styles.contains(.swizzle) { return "Swizzle" }
        }
        return nil
    }
    
    func contentSize(for borderHeight: CGFloat) -> CGFloat {
        switch borderHeight {
        case 0..<650:
            return borderHeight * 0.896
        case 651..<672:
            return borderHeight * 0.90
        default:
            return borderHeight * 0.91
        }
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



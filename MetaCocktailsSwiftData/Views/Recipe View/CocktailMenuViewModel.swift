//
//  CocktailMenuViewModel.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/25/24.
//

import SwiftUI

final class CocktailMenuViewModel: ObservableObject {
    var cocktail: Cocktail
    var cocktailGlassImage: Image

    init(cocktail: Cocktail) {
        self.cocktail = cocktail
        self.cocktailGlassImage = cocktail.glasswareType.glassImage(cocktail: cocktail)
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

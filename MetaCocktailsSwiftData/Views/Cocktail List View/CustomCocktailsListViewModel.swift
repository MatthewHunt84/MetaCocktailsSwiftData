//
//  CustomCocktailsListViewModel.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 8/29/24.
//

import SwiftUI
import SwiftData

@Observable class CustomCocktailsListViewModel: ObservableObject {
    var customCocktails: [Cocktail] = []
    var variationNames: Set<String> = []

    struct CocktailGroup: Identifiable {
        let id = UUID()
        let name: String
        let cocktails: [Cocktail]
    }

    func updateCocktails(_ cocktails: [Cocktail]) {
        self.customCocktails = cocktails
        updateVariationNames()
    }

    private func updateVariationNames() {
        variationNames = Set(customCocktails.compactMap { $0.customVariation })
    }

    func groupedCocktails() -> [CocktailGroup] {
        var groups: [CocktailGroup] = []
        var usedCocktails = Set<UUID>()

        // First, group all cocktails that are variations or have variations
        for cocktail in customCocktails {
            if !usedCocktails.contains(cocktail.id) {
                let groupName = cocktail.customVariation ?? cocktail.cocktailName
                let groupCocktails = customCocktails.filter {
                    $0.cocktailName == groupName ||
                    $0.customVariation == groupName ||
                    $0.cocktailName == cocktail.customVariation
                }
                
                if groupCocktails.count > 1 {
                    groups.append(CocktailGroup(name: groupName, cocktails: groupCocktails))
                    usedCocktails.formUnion(groupCocktails.map { $0.id })
                }
            }
        }

        // Then, add any remaining cocktails as standalone items
        for cocktail in customCocktails {
            if !usedCocktails.contains(cocktail.id) {
                groups.append(CocktailGroup(name: cocktail.cocktailName, cocktails: [cocktail]))
                usedCocktails.insert(cocktail.id)
            }
        }

        return groups.sorted { $0.name < $1.name }
    }
}

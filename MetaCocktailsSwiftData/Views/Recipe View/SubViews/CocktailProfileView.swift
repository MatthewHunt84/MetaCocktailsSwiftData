//
//  CocktailMenuView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/24/24.
//

import SwiftUI



struct IngredientView: View {
    let cocktail: Cocktail
    var ingredientsString = ""
    var profileString = ""
    
    
    init(cocktail: Cocktail, ingredientsString: String = "") {
        self.cocktail = cocktail
        
        let ingredients = cocktail.spec
        
        for ingredient in ingredients.reversed() {
            self.ingredientsString += " \(ingredient.ingredient.name),"
        }
        
        if let profiles = cocktail.compiledTags.profiles {
            for profile in profiles {
                self.profileString += " \(profile.rawValue),"
            }
        }
        if profileString != "" {
            self.profileString.removeLast()
        }
        
        self.ingredientsString.removeLast()
        
    }
    
    var body: some View {
        VStack {
            Text(cocktail.cocktailName)
                .dynamicTypeSize(.xxxLarge).bold()
                .multilineTextAlignment(.center)
                .padding(10)
            Text("Ingredients:")
                .dynamicTypeSize(.xLarge).bold()
            Text("\(ingredientsString)")
                .multilineTextAlignment(.center)
                .dynamicTypeSize(.xLarge)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            Text("Profile:")
                .dynamicTypeSize(.xLarge).bold()
            Text("\(profileString)")
                .multilineTextAlignment(.center)
                .dynamicTypeSize(.xLarge)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            if cocktail.author != nil {
                AuthorView(cocktail: cocktail)
            }
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
}
struct CocktailProfileView: View {

    var profileString = ""
    let cocktail: Cocktail
    
    init(cocktail: Cocktail) {
        self.cocktail = cocktail
        
        //let ingredients = cocktail.spec
        
        
        
        if let profiles = cocktail.compiledTags.profiles {
            for profile in profiles {
                self.profileString += " \(profile.rawValue),"
            }
        }
        if profileString != "" {
            self.profileString.removeLast()
        }
    }
    var body: some View {
        VStack(alignment: .leading) {
            Text("Profile:")
                .dynamicTypeSize(.xLarge).bold()
            Text("\(profileString)")
                .multilineTextAlignment(.center)
                .dynamicTypeSize(.xLarge)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            
        }
    }
    
    
    
    
}

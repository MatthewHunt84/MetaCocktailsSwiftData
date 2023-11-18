//
//  RecipeIngredientsView.swift
//  MetaCocktails
//
//  Created by James on 8/9/23.
//

import SwiftUI

struct RecipeIngredientsView: View {
    var cocktail: Cocktail
    let recipeSpacing: CGFloat = 2
    
    var body: some View {
        
        Text(cocktail.cocktailName.uppercased())
            .font(.title2)
        
        Text("GW: \(cocktail.glasswareType.rawValue)")
        
        ForEach(cocktail.spec, id: \.self) { ingredient in
            Text("\(ingredient.value, specifier: "%.2f") oz. \(ingredient.ingredient.rawValue)")
                .padding(recipeSpacing)
        }
        
        if let garnishes = cocktail.garnish {
            ForEach(garnishes, id: \.self) { garnish in
                Text("G: \(garnish.rawValue)")
            }
        }
        
        TagView(for: cocktail)
    }
}

struct TagView: View {
    
    let cocktail: Cocktail
    var baseString = ""
    var flavorsString = ""
    var texturesString = ""
    var profileString = ""
    
    init(for cocktail: Cocktail) {
        
        self.cocktail = cocktail
        
        let tags = cocktail.CompileTags()

        if let bases = tags.bases {
            for base in bases {
                baseString += " \(base.rawValue),"
            }
            baseString.removeLast()
            print(baseString)
        } else {
            baseString = "NO BOOZE"
        }


        if let flavors = tags.flavors {
            for flavor in flavors {
                flavorsString += " \(flavor.rawValue),"
            }
            flavorsString.removeLast()
            print(flavorsString)
        } else {
            flavorsString = "NO FLAVORS"
        }


        if let textures = tags.textures {
            for texture in textures {
                texturesString += " \(texture.rawValue),"
            }
            texturesString.removeLast()
            print(texturesString)
        } else {
            texturesString = "NO TEXTURES"
        }

        if let profiles = tags.profiles {
            for profile in profiles {
                profileString += " \(profile.rawValue)"
            }
            profileString.removeLast()
            print(profileString)
        } else {
            texturesString = "NO TEXTURES"
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack(spacing: 10) {
                Text("BOOZE:")
                Text(baseString)
                    .foregroundStyle(.green)
                    .fontWeight(.light)
            }
            HStack(spacing: 10) {
                Text("FLAVORS:")
                Text(flavorsString)
                    .foregroundStyle(.pink)
                    .fontWeight(.light)
            }
            HStack(spacing: 10) {
                Text("TEXTURES:")
                Text(texturesString)
                    .foregroundStyle(.purple)
                    .fontWeight(.light)
            }
            HStack(spacing: 10) {
                Text("PROFILES:")
                Text(profileString)
                    .foregroundStyle(.cyan)
                    .fontWeight(.light)
            }
        }
        .padding(.top, 25)
    }
}

struct RecipeIngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeIngredientsView(cocktail: aperolSpritz)
    }
}

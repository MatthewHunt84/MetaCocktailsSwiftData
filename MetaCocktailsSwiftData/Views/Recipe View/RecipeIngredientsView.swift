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
    var styleString = ""
    
    init(for cocktail: Cocktail) {
        
        self.cocktail = cocktail
        
        let tags = cocktail.CompileTags()
        
        

        if let agaveBases = tags.agave  {
            for base in agaveBases {
                baseString += " \(base.rawValue),"
            }
            
            print(baseString)
        }
        if let amariBases = tags.amari  {
            for base in amariBases {
                baseString += " \(base.rawValue),"
            }
           
            print(baseString)
        }
        if let brandyBases = tags.brandy  {
            for base in brandyBases {
                baseString += " \(base.rawValue),"
            }
            
            print(baseString)
        }
        if let fortBases = tags.fortifiedWine  {
            for base in fortBases {
                baseString += " \(base.rawValue),"
            }
            
            print(baseString)
        }
        if let ginBases = tags.gin  {
            for base in ginBases {
                baseString += " \(base.rawValue),"
            }
            
            print(baseString)
        }
        if let liqueurBases = tags.liqueur  {
            for base in liqueurBases {
                baseString += " \(base.rawValue),"
            }
            
            print(baseString)
        }
        if let bittersBases = tags.bitters  {
            for base in bittersBases {
                baseString += " \(base.rawValue),"
            }
           
            print(baseString)
        }
        if let otherBases = tags.other {
            for base in otherBases {
                baseString += " \(base.rawValue),"
            }
            
            print(baseString)
        }
        if let rumBases = tags.rum  {
            for base in rumBases {
                baseString += " \(base.rawValue),"
            }
            
            print(baseString)
        }
        if let vodkaBases = tags.vodka  {
            for base in vodkaBases {
                baseString += " \(base.rawValue),"
            }
            
            print(baseString)
        }
        if let wineBases = tags.wine  {
            for base in wineBases {
                baseString += " \(base.rawValue),"
            }
           
            print(baseString)
        }
        if let whiskeyBases = tags.whiskies  {
            for base in whiskeyBases {
                baseString += " \(base.rawValue),"
            }
          
            print(baseString)
        }
        
        baseString.removeLast()


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
                profileString += " \(profile.rawValue),"
            }
            profileString.removeLast()
            print(profileString)
        } else {
            profileString = "NO PROFILES"
        }
        
        if let styles = tags.styles {
            for style in styles {
                styleString += " \(style.rawValue),"
            }
            styleString.removeLast()
            print(styleString)
        } else {
            texturesString = "NO STYLE"
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
            HStack(spacing: 10) {
                Text("STYLES:")
                Text(styleString)
                    .foregroundStyle(.brandPrimaryOrange)
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

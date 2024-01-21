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
        
        VStack{
            
            Text(cocktail.cocktailName)
                .font(.largeTitle).bold()
                .multilineTextAlignment(.center)
            VStack{
                Text("Glassware:")
                    .font(.title3).bold()
                Text(cocktail.glasswareType.rawValue)
            }
            .padding(10)
            VStack{
                Text("Buid:")
                    .font(.title3).bold()
                    
                
                    ForEach(cocktail.spec, id: \.id) { ingredient in
                        let number = NSNumber(value: ingredient.value)
                        Text("\(number) \(ingredient.unit.rawValue) \(ingredient.ingredient.name)")
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
                        .multilineTextAlignment(.center)
                        
                    }
                
            }
            
            if  cocktail.garnish != nil {
                VStack{
                    Text("Garnish:")
                        .font(.title3).bold()
                    if let garnishes = cocktail.garnish {
                        ForEach(garnishes, id: \.self) { garnish in
                            Text(garnish.rawValue)
                                .multilineTextAlignment(.center)
                        }
                        
                    }
                }
                .padding(10)
            }
            
           
            
            
            if let buildOrder = cocktail.buildOrder {
                NavigationLink("Build Order") {
                    BuildOrderView(buildOrder: buildOrder)
                }
                .buttonStyle(whiteButton())
                .padding(EdgeInsets(top: 50, leading: 0, bottom: 50, trailing: 0))
                
                
            }
            if cocktail.author != nil {
                AuthorView(cocktail: cocktail)
                    
                    
            }
            
            //        TagView(for: cocktail)
            
        }
    }
 
}

struct AuthorView: View {
    var authors = ""
    let cocktail: Cocktail
    
    init(cocktail: Cocktail) {
        
        self.cocktail = cocktail
        
        if let authorsVar = cocktail.author {
            let authorsCombined = authorsVar.reduce("") { $0 + ", " + $1}
            authors = authorsCombined
        }
        if authors != "" {
            authors.removeFirst()
        }
    }
    var body: some View {
        VStack {
            Text("Author:")
                .font(.title3).bold()
            Text(authors)
                .multilineTextAlignment(.center)
        }
    }
}

//struct TagView: View {
//    
//    let cocktail: Cocktail
//    var baseString = ""
//    var flavorsString = ""
//    var texturesString = ""
//    var profileString = ""
//    var styleString = ""
//    
//    init(for cocktail: Cocktail) {
//        
//        self.cocktail = cocktail
//        
//        let tags = cocktail.compiledTags
//        
//        if let boozeBottles = tags.booze {
//            for booze in boozeBottles {
//                baseString +=  " \(booze.name),"
//            }
//            print(baseString)
//            baseString.removeLast()
//        } else {
//            baseString = "NO BOOZE"
//        }
//
//
//        if let flavors = tags.flavors {
//            for flavor in flavors {
//                flavorsString += " \(flavor.rawValue),"
//            }
//            //flavorsString.removeLast()
//            print(flavorsString)
//        } else {
//            flavorsString = "NO FLAVORS"
//        }
//
//
//        if let textures = tags.textures {
//            for texture in textures {
//                texturesString += " \(texture.rawValue),"
//            }
//            texturesString.removeLast()
//            print(texturesString)
//        } else {
//            texturesString = "NO TEXTURES"
//        }
//
//        if let profiles = tags.profiles {
//            for profile in profiles {
//                profileString += " \(profile.rawValue),"
//            }
//            //profileString.removeLast()
//            print(profileString)
//        } else {
//            profileString = "NO PROFILES"
//        }
//        
//        if let styles = tags.styles {
//            for style in styles {
//                styleString += " \(style.rawValue),"
//            }
//            styleString.removeLast()
//            print(styleString)
//        } else {
//            texturesString = "NO STYLE"
//        }
//    }
    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 15) {
//            HStack(spacing: 10) {
//                Text("BOOZE:")
//                Text(baseString)
//                    .foregroundStyle(.green)
//                    .fontWeight(.light)
//            }
//            HStack(spacing: 10) {
//                Text("FLAVORS:")
//                Text(flavorsString)
//                    .foregroundStyle(.pink)
//                    .fontWeight(.light)
//            }
//            HStack(spacing: 10) {
//                Text("TEXTURES:")
//                Text(texturesString)
//                    .foregroundStyle(.purple)
//                    .fontWeight(.light)
//            }
//            HStack(spacing: 10) {
//                Text("PROFILES:")
//                Text(profileString)
//                    .foregroundStyle(.cyan)
//                    .fontWeight(.light)
//            }
//            HStack(spacing: 10) {
//                Text("STYLES:")
//                Text(styleString)
//                    .foregroundStyle(.brandPrimaryOrange)
//                    .fontWeight(.light)
//            }
//        }
//        .padding(.top, 25)
//    }
//}

struct RecipeIngredientsView_Previews: PreviewProvider {
   
    static var previews: some View {
        RecipeIngredientsView(cocktail: beckyWithTheGoodHair)
            
    }
}

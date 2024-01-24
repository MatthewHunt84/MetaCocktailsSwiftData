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
        GeometryReader{ geo in
            VStack{
                VStack{
                    Text(cocktail.cocktailName)
                        .font(.title).bold()
                        //.dynamicTypeSize(.xxxLarge).bold()
                        .multilineTextAlignment(.center)
                        //.minimumScaleFactor(0.2)
                        //.lineLimit(2)
                        .padding(10)
                        
                    
                        Text("Glassware:")
                            .dynamicTypeSize(.xLarge).bold()
                        Text(cocktail.glasswareType.rawValue)
                            .dynamicTypeSize(.large)
                            .multilineTextAlignment(.center)
                    
                        
                }
                .frame(width: geo.size.width, height: geo.size.height * 0.25, alignment: .top)
                .padding(10)
                VStack {
                    
                        Text("Build:")
                        .dynamicTypeSize(.xLarge).bold()
                        
                        ForEach(cocktail.spec, id: \.id) { ingredient in
                            let number = NSNumber(value: ingredient.value)
                            Text("\(number) \(ingredient.unit.rawValue) \(ingredient.ingredient.name)")

                                .multilineTextAlignment(.center)
                                .dynamicTypeSize(.large)
                            
                        }
                        
                        if  cocktail.garnish != nil {
                            VStack{
                                Text("Garnish:")
                                    .dynamicTypeSize(.xLarge).bold()
                                if let garnishes = cocktail.garnish {
                                    ForEach(garnishes, id: \.self) { garnish in
                                        Text(garnish.rawValue)
                                            .multilineTextAlignment(.center)
                                            .dynamicTypeSize(.large)
                                    }
                                    
                                }
                            }
                            .padding(10)
                        }
                        
                    
                }
                .frame(width: geo.size.width, height: geo.size.height * 0.45, alignment: .center)

                if let buildOrder = cocktail.buildOrder {
                    NavigationLink("Build Order") {
                        BuildOrderView(buildOrder: buildOrder)
                            
                            
                    }
                    
                    .buttonStyle(whiteButton())
                    
 
                }
                if cocktail.author != nil {
                    AuthorView(cocktail: cocktail)
                        .frame(width: geo.size.width, height: geo.size.height * 0.2, alignment: .center)
                        .offset(CGSize(width: 0, height: -10.0))
 
                }
                
                //        TagView(for: cocktail)
                
            }
            
        }
    }
 
}

struct AuthorView: View {
    var author = ""
    var place = ""
    var year = ""
    let cocktail: Cocktail
    
    init(cocktail: Cocktail) {
        
        self.cocktail = cocktail
        
        if let authorsVar = cocktail.author {
            if let authorPerson = authorsVar.person {
                author = authorPerson
            }
            if let authorPlace = authorsVar.place {
                place = authorPlace
                
            }
            if let authorYear = authorsVar.year {
                year = authorYear
            }
        }
        
    }
    var body: some View {
        VStack {
            Text("Author:")
                .dynamicTypeSize(.xLarge).bold()
            if author != "" {
                Text(author)
                    .multilineTextAlignment(.center)
                    .dynamicTypeSize(.large)
            }
            VStack {
            if place != "" {
                
                    Text(place)
                        .dynamicTypeSize(.large)
                        .multilineTextAlignment(.center)
                }
                if year != "" {
                    Text("\(year)")
                        .dynamicTypeSize(.large)
                }
            }
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
        RecipeIngredientsView(cocktail: airMailWnG)
            
    }
}

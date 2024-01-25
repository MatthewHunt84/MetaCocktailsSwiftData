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
    var cocktailFrameSize = CGFloat(125)
    
    
    var body: some View {
        
        VStack{
            Text(cocktail.cocktailName)
                .dynamicTypeSize(.xxLarge).bold()
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.2)
                .lineLimit(2)
                .padding(10)
                
            
            VStack{
                Text("Glassware:")
                    .dynamicTypeSize(.xLarge).bold()
                    .minimumScaleFactor(0.02)
                Text(cocktail.glasswareType.rawValue)
                    .dynamicTypeSize(.large)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.02)
            }
            .padding(10)
            
            
            //.frame(width: geo.size.width, height: geo.size.height * 0.2, alignment: .bottom)
            
            
            VStack {
                
                Text("Cocktail Spec:")
                    .dynamicTypeSize(.xLarge).bold()
                
                ForEach(cocktail.spec, id: \.id) { ingredient in
                    let number = NSNumber(value: ingredient.value)
                    Text("\(number) \(ingredient.unit.rawValue) \(ingredient.ingredient.name)")
                    
                        .multilineTextAlignment(.center)
                        .dynamicTypeSize(.large)
                        .minimumScaleFactor(0.02)
                        
                    }
                    if let stirShakeBuild = cocktail.tags.styles {
                        if stirShakeBuild.contains(.built) {
                            Text("Build in glass")
                                .multilineTextAlignment(.center)
                                .dynamicTypeSize(.large).bold()
                                .minimumScaleFactor(0.02)
                              
                        }
                        if stirShakeBuild.contains(.shaken) {
                            Text("Shake")
                                .multilineTextAlignment(.center)
                                .dynamicTypeSize(.large).bold()
                                .minimumScaleFactor(0.02)
                                
                        }
                        if stirShakeBuild.contains(.stirred) {
                            Text("Stir")
                                .multilineTextAlignment(.center)
                                .dynamicTypeSize(.large).bold()
                                .minimumScaleFactor(0.02)
                                
                        }
                    }
                        
                    
                    if let ice = cocktail.ice?.rawValue {
                        HStack {
                            Text("Ice: ")
                                .dynamicTypeSize(.xLarge).bold()
                                .minimumScaleFactor(0.02)
                            Text(ice)
                                .dynamicTypeSize(.large)
                                .multilineTextAlignment(.center)
                                .minimumScaleFactor(0.02)
                        }
                    }
                    
                    
                    if  cocktail.garnish != nil {
                        VStack{
                            Text("Garnish:")
                                .dynamicTypeSize(.xLarge).bold()
                                .minimumScaleFactor(0.02)
                            if let garnishes = cocktail.garnish {
                                ForEach(garnishes, id: \.self) { garnish in
                                    Text("\(garnish.rawValue)")
                                        .multilineTextAlignment(.center)
                                        .dynamicTypeSize(.large)
                                        .minimumScaleFactor(0.02)
                                    
                                }
                                
                            }
                        }
                        .padding(10)
                    }
                    if let buildOrder = cocktail.buildOrder {
                        NavigationLink("Build Order") {
                            BuildOrderView(buildOrder: buildOrder)
                        }
                        //.frame(width: geo.size.width, height: geo.size.height * 0.05, alignment: .center)

                        .buttonStyle(whiteButton())
                    }
                    
                    
                }
                //.frame(width: geo.size.width * 0.9, height: geo.size.height * 0.7, alignment: .center)
                
            if cocktail.author != nil {
                AuthorView(cocktail: cocktail)
            }
                
              
                
                //        TagView(for: cocktail)
                
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
                .minimumScaleFactor(0.02)
            if author != "" {
                Text(author)
                    .multilineTextAlignment(.center)
                    .dynamicTypeSize(.large)
                    .minimumScaleFactor(0.02)
            }
            VStack {
            if place != "" {
                
                    Text(place)
                        .dynamicTypeSize(.large)
                        .multilineTextAlignment(.center)
                        .minimumScaleFactor(0.02)
                }
                if year != "" {
                    Text("\(year)")
                        .dynamicTypeSize(.large)
                        .minimumScaleFactor(0.02)
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
        RecipeIngredientsView(cocktail: aFlightSouthOfTheBorder)
            
    }
}

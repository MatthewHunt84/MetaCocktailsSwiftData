//
//  RecipeIngredientsView.swift
//  MetaCocktails
//
//  Created by James on 8/9/23.
//

import SwiftUI

struct RecipeIngredientsView: View {
    
    var viewModel: CocktailMenuViewModel
    let recipeSpacing: CGFloat = 2
    var cocktailFrameSize = CGFloat(125)
    
    
    var body: some View {
        
        VStack{
            Text(viewModel.cocktail.cocktailName)
                .dynamicTypeSize(.xxLarge).bold()
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.2)
                .lineLimit(2)
                .padding(10)
            
            
            VStack{
                Text("Glassware:")
                    .dynamicTypeSize(.xLarge).bold()
                    .minimumScaleFactor(0.02)
                Text(viewModel.cocktail.glasswareType.rawValue)
                    .dynamicTypeSize(.large)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.02)
            }
            .padding(10)
            
            VStack {
                
                Text("Cocktail Spec:")
                    .dynamicTypeSize(.xLarge).bold()
                
                ForEach(viewModel.cocktail.spec, id: \.id) { ingredient in
                    let number = NSNumber(value: ingredient.value)
                    Text("\(number) \(ingredient.unit.rawValue) \(ingredient.ingredient.name)")
                    
                        .multilineTextAlignment(.center)
                        .dynamicTypeSize(.large)
                        .minimumScaleFactor(0.02)
                    
                }
                if let stirShakeBuild = viewModel.cocktail.tags.styles {
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
                
                
                if let ice = viewModel.cocktail.ice?.rawValue {
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
                
                
                if  viewModel.cocktail.garnish != nil {
                    VStack{
                        Text("Garnish:")
                            .dynamicTypeSize(.xLarge).bold()
                            .minimumScaleFactor(0.02)
                        if let garnishes = viewModel.cocktail.garnish {
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
                if let buildOrder = viewModel.cocktail.buildOrder {
                    NavigationLink("Build Order") {
                        BuildOrderView(buildOrder: buildOrder)
                    }
                    
                    
                    .buttonStyle(whiteButton())
                }
                
                
            }
            if viewModel.cocktail.author != nil {
                AuthorView(cocktail: viewModel.cocktail)
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

struct RecipeIngredientsView_Previews: PreviewProvider {
   
    static var previews: some View {
        RecipeIngredientsView(viewModel: CocktailMenuViewModel(cocktail: aFlightSouthOfTheBorder))
            
    }
}

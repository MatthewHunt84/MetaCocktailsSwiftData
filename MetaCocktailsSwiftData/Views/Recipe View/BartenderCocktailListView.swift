//
//  CocktailListRecipeIngredientsView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/26/24.
//

import SwiftUI

struct BartenderCocktailListView: View {
    
    let recipeSpacing: CGFloat = 2
    var cocktailFrameSize = CGFloat(125)
    @State var cocktails: [Cocktail] = []
    @State var cocktailName: String = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        VStack{
            HStack{
                Button{
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                    Text("Back")
                }
                Spacer()
            }
            TabView {
                ForEach($cocktails, id: \.self) { cocktail in
                    VStack {
                        Text(cocktail.cocktailName.wrappedValue)
                            .dynamicTypeSize(.xxLarge).bold()
                            .multilineTextAlignment(.center)
                            .minimumScaleFactor(0.2)
                            .lineLimit(2)
                            .padding(10)
                        
                        
                        VStack{
                            Text("Glassware:")
                                .dynamicTypeSize(.xLarge).bold()
                                .minimumScaleFactor(0.02)
                            Text(cocktail.glasswareType.wrappedValue.rawValue)
                                .dynamicTypeSize(.large)
                                .multilineTextAlignment(.center)
                                .minimumScaleFactor(0.02)
                        }
                        .padding(10)
                        
                        VStack {
                            
                            Text("Cocktail Spec:")
                                .dynamicTypeSize(.xLarge).bold()
                            
                            ForEach(cocktail.spec.wrappedValue, id: \.id) { ingredient in
                                let number = NSNumber(value: ingredient.value)
                                Text("\(number) \(ingredient.unit.rawValue) \(ingredient.ingredient.name)")
                                
                                    .multilineTextAlignment(.center)
                                    .dynamicTypeSize(.large)
                                    .minimumScaleFactor(0.02)
                                
                            }
                            if let stirShakeBuild = cocktail.tags.styles.wrappedValue {
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
                                if stirShakeBuild.contains(.swizzle) {
                                    Text("Swizzle")
                                        .multilineTextAlignment(.center)
                                        .dynamicTypeSize(.large).bold()
                                        .minimumScaleFactor(0.02)
                                    
                                }
                            }
                            
                            
                            if let ice = cocktail.ice.wrappedValue?.rawValue {
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
                            
                            
                            if  cocktail.garnish.wrappedValue != nil {
                                VStack{
                                    Text("Garnish:")
                                        .dynamicTypeSize(.xLarge).bold()
                                        .minimumScaleFactor(0.02)
                                    if let garnishes = cocktail.garnish.wrappedValue {
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
                            if let buildOrder = cocktail.buildOrder.wrappedValue {
                                NavigationLink("Build Order") {
                                    BuildOrderView(buildOrder: buildOrder)
                                }
                                
                                
                                .buttonStyle(whiteButton())
                            }
                            
                            
                        }
                        if cocktail.author.wrappedValue != nil {
                            AuthorView(cocktail: cocktail.wrappedValue)
                        }
                    }
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .interactive))
            
        }
    }
}
        
        #Preview {
            BartenderCocktailListView(cocktails:  CocktailListViewModel.getBartenderViewCocktails()[3].cocktailVariations , cocktailName: CocktailListViewModel.getBartenderViewCocktails()[3].cocktailName)
}
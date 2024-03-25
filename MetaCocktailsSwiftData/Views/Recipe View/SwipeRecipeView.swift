//
//  SwipeRecipeView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/20/24.
//

import SwiftUI

struct SwipeRecipeView: View {
    
    let recipeSpacing: CGFloat = 2
    var cocktailFrameSize = CGFloat(125)
    @State var variations: [Cocktail]
    @State private var cocktailTitle = "Placeholder"
    
    var body: some View {
        NavigationStack {
            GeometryReader{ geo in
                VStack{
                    HStack {
                        BackButton()
                        RecipeTitleView(title: cocktailTitle)
                    }
                    TabView {
                        ForEach($variations, id: \.self) { cocktail in
                            
                            ScrollView(.vertical){
                                ZStack {
                                    Border()
                                        .frame(minHeight: geo.size.height)
                                    VStack(alignment: .leading, spacing: 20) {
                                        
                                        GlasswareView(cocktail: cocktail.wrappedValue)
                                        
                                        CocktailProfileView(cocktail: cocktail.wrappedValue)
                                        
                                        SpecView(cocktail: cocktail.wrappedValue)
                                        
                                        GarnishView(cocktail: cocktail.wrappedValue)
                                        
                                        MethodIceView(cocktail: cocktail.wrappedValue)
                                        
                                        
                                        
                                        if cocktail.author.wrappedValue != nil {
                                            AuthorView(cocktail: cocktail.wrappedValue)
                                                .frame(maxWidth: .infinity, alignment: .center)
                                                .padding(.bottom, 50)
                                        }
                                        if let buildOrder = cocktail.buildOrder.wrappedValue {
                                            NavigationLink("Build Order") {
                                                BuildOrderView(buildOrder: buildOrder)
                                                    .padding()
                                            }
                                            .frame(maxWidth: .infinity, alignment: .center)
                                            .padding(.bottom, 50)
                                            
                                            .buttonStyle(whiteButton())
                                        }
                                        
//                                        BatchButton(cocktail: cocktail.wrappedValue)
//                                            .padding()
//                                        
                                        
                                        
                                      
                                        
                                    }
                                    .padding(.top, 50)
                                    .padding(.bottom, 20)
                                    .frame(width: geo.size.width * 0.75)
                                    .onAppear {
                                       cocktailTitle = cocktail.wrappedValue.cocktailName
                                    }
                                }
                            }
//                            .navigationBarTitleDisplayMode(.inline)
//                            .toolbar {
//                                ToolbarItem(placement: .principal) {
//                                    RecipeTitleView(title: cocktail.wrappedValue.cocktailName)
//                                }
//                                ToolbarItem(placement: .topBarLeading) {
//                                    
//
//                                }
//                            }
                            
                            
                        }
                    }
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                
            }
        }
    }
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    return SwipeRecipeView(variations: [cloverClub, airMail, airMailWnG, peanutButterFalcon])
        .modelContainer(preview.container)
       
}


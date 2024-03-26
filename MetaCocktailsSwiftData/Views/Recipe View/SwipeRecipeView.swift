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
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                
                TabView {
                    
                    ForEach($variations, id: \.self) { cocktail in
                        
                        ZStack {
                            Border()
                                .frame(height: UIScreen.main.bounds.height)
                                .padding(.bottom, 50)
                            
                            VStack(alignment: .leading, spacing: 20) {
                                
                                GlasswareView(cocktail: cocktail.wrappedValue)
                                
                                CocktailProfileView(cocktail: cocktail.wrappedValue)
                                
                                SpecView(cocktail: cocktail.wrappedValue)
                                
                                GarnishView(cocktail: cocktail.wrappedValue)
                                
                                MethodIceView(cocktail: cocktail.wrappedValue)
                                
                                if let buildOrder = cocktail.buildOrder.wrappedValue {
                                    NavigationLink("Build Order") {
                                        BuildOrderView(buildOrder: buildOrder)
                                            .padding()
                                    }
                                    .buttonStyle(.custom)
                                }
                                
                                if cocktail.author.wrappedValue != nil {
                                    AuthorView(cocktail: cocktail.wrappedValue)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .padding(.bottom, 80)
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width * 0.75)
                            .navigationBarTitleDisplayMode(.inline)
                            .toolbar {
                                ToolbarItem(placement: .principal) {
                                    RecipeTitleView(title: cocktail.wrappedValue.cocktailName)
                                }
                            }
                        }
                    }
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .frame(minHeight: UIScreen.main.bounds.height)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    VStack(alignment: .leading) {
                        Button{
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.backward")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 9)
                                .bold()
                                .tint(.cyan)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    return SwipeRecipeView(variations: [savoirFaire, zombie129, cloverClub, zombie, airMailWnG, peanutButterFalcon, brandyAlexander])
        .modelContainer(preview.container)
       
}


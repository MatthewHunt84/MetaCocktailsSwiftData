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
            GeometryReader{ geo in
               // ScrollView{
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
                                        
                                        
                                        //                                        BatchButton(cocktail: cocktail.wrappedValue)
                                        //                                            .padding()
                                        //
                                        
                                        
                                        
                                        
                                    }
                                    .padding(.top, 50)
                                    .padding(.bottom, 20)
                                    .frame(width: geo.size.width * 0.75)
                                    .navigationBarTitleDisplayMode(.inline)
                                    .toolbar {
                                        ToolbarItem(placement: .principal) {
                                            RecipeTitleView(title: cocktail.wrappedValue.cocktailName)
                                            
                                            
                                        }
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
                        
                    }
                    .tabViewStyle(.page)
                    .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                    .frame(minHeight: geo.size.height)
               // }
                
            }
        }
    }
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    return SwipeRecipeView(variations: [cloverClub, zombie, airMailWnG, peanutButterFalcon])
        .modelContainer(preview.container)
       
}


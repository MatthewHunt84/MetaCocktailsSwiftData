//
//  ListCocktailMenuView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/26/24.
//

import SwiftUI

struct GuestCocktailListView: View {
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
                ForEach(cocktails, id: \.self) { cocktail in
                    VStack {
                        cocktail.glasswareType.glassImage(cocktail: cocktail)
                            .resizable()
                            .frame(width: 125, height: 125, alignment: .center)
                        
                            .padding(10)
                        IngredientView(cocktail: cocktail)
                            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                    }
                    
                    
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .interactive))
            
            
            
        }
        
        
    }
}

#Preview {
    GuestCocktailListView(cocktails: CocktailListViewModel.getBartenderViewCocktails()[3].cocktailVariations , cocktailName: CocktailListViewModel.getBartenderViewCocktails()[3].cocktailName)
}

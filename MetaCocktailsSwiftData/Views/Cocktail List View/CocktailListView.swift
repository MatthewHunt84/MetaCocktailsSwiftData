//
//  CocktailListView.swift
//  MetaCocktails
//
//  Created by James on 8/8/23.
//

import SwiftUI
import SwiftData

struct CocktailListView: View {
    @EnvironmentObject var criteria: SearchCriteriaViewModel
    @StateObject var viewModel = CocktailListViewModel.shared
    @State var isShowingIngredientsList = false
    @State private var colorNumber = 0
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Cocktail.cocktailName) var swiftDataCocktails: [Cocktail]
    private var alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    
    var body: some View {
        NavigationStack{
            ZStack {
                VStack{
                    ScrollView {
                        ScrollViewReader { value in
                            HStack{
                                List{
                                    ForEach(alphabet, id: \.self) { letter in
                                        Section {
                                            ForEach(swiftDataCocktails) { cocktail in
                                                if cocktail.cocktailName.hasPrefix(letter) {
                                                    //ForEach(swiftDataCocktails { $0.cocktailName.hasPrefix(letter) }, id: \.self) { cocktail in
                                                    NavigationLink {
                                                        RecipeIngredientsView(cocktail: cocktail)
                                                    } label: {
                                                        Text(cocktail.cocktailName)
                                                    }
                                                }
                                            }
                                        } header: {
                                            Text("\(letter)")
                                                .fontWeight(.bold)
                                                .font(.title)
                                        }.id(letter)
                                    }
                                }
                                .listStyle(.plain)
                                HStack{
                                    VStack {
                                        ForEach(0..<alphabet.count, id: \.self) { i in
                                            Button(action: {
                                                withAnimation {
                                                    value.scrollTo(alphabet[i])
                                                }
                                            }, label: {
                                                Text("\(alphabet[i])")
                                                    .font(.headline)
                                                    .frame(width: 35, height: 16)
                                            })
                                            .foregroundStyle(Color(.black))
                                            .buttonStyle(ScaleButtonStyle())
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .scrollDisabled(true)
                }
            }
            .navigationBarTitle("Cocktails", displayMode: .large)
            .toolbar {
                Button("add Cocktails", action: addCocktails)
            }
        }
    }
    
    func addCocktails() {
        for cocktail in viewModel.cocktails {
            modelContext.insert(cocktail)
        }
    }
}

struct CocktailListView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailListView()
            .environmentObject(SearchCriteriaViewModel())
    }
}
struct ScaleButtonStyle : ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        configuration.label.scaleEffect(configuration.isPressed ? 2.5 : 1)
            .shadow(radius: 30)
        
    }
}

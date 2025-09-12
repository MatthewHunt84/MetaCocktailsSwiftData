//
//  SpecifiedListView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/10/24.
//

//import SwiftUI
//
//struct SpecifiedListView: View {
//    
//    @EnvironmentObject var viewModel: CocktailListViewModel
//    var cocktails: [Cocktail]
//    
//    var body: some View {
//        ForEach(viewModel.cocktailListAlphabet, id: \.self) { letter in
//            Section{
//                ForEach(cocktails.filter({$0.cocktailName.hasPrefix(letter)}) , id: \.cocktailName) { item in
//                    NavigationLink {
//                        RecipeView(viewModel: RecipeViewModel(cocktail: item))
//                          .navigationBarBackButtonHidden(true)
//                    } label: {
//                        Text(item.cocktailName)
//                        
//                    }
//                }
//            } header: {
//                Text("\(letter)")
//                    .fontWeight(.bold)
//                    .font(.title)
//            }
//            .id(letter)
//            .listRowBackground(Color.clear)
//        }
//    }
//}
//

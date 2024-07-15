//
//  BasicSearchViewWithDataQuery.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 7/14/24.
//

import SwiftUI
import SwiftData

struct BasicSearchViewWithDataQuery: View {
    @Bindable var viewModel = SearchViewModel()
    @Query(sort: \IngredientBase.name) var ingredients: [IngredientBase]
    @State var filteredIngredients: [IngredientBase] = []
    @FocusState var keyboardFocused: Bool
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack{
                    
                    HStack {
                        Text("Search Ingredients")
                            .font(.largeTitle).bold()
                            .padding(EdgeInsets(top: 0, leading: 12, bottom: -7, trailing: 0))
                       Spacer()
                       
                        
                    }
                    Form{
                        Section("Name") {
                            VStack{
                                TextField("Flavor or Ingredient", text: $viewModel.currentComponentSearchName)
                                    .focused($keyboardFocused)
                                    .onChange(of: viewModel.currentComponentSearchName, initial: true) { old, new in
                                        viewModel.currentComponentSearchName = new
                                        filteredIngredients = viewModel.matchAllIngredients(ingredients: ingredients)
                                        
                                    }
                            }
                            
                            if keyboardFocused {
                                List {
                                    ForEach($filteredIngredients, id: \.name) { ingredient in
                                        
                                        PreferencesThumbsCell(ingredient: ingredient)
                                        
                                        
                                    }
                                    .listStyle(.plain)
                                    .listRowBackground(Color.black)
                                    
                                }
                                .scrollContentBackground(.hidden)
                            } else {
                                EmptyView()
                            }
                            
                        }
                    }
                    
//                    ZStack{
//                        
//                        BasicIngredientSearchListView(viewModel: viewModel)
//                        
//                        
//                        SearchButtonView()
//                            .frame(width: geometry.size.width / 3, height: geometry.size.height * 0.81, alignment: .bottomTrailing)
//                            .offset(x: 90)
//                        
//                    }
                }
            }
        }
    }
}

#Preview {
    BasicSearchViewWithDataQuery()
        .environmentObject(SearchCriteriaViewModel())
}

//struct BasicIngredientSearchListView: View {
//    @Bindable var viewModel: SearchViewModel
//    
//
//
//
//    var body: some View {
//        
//    }
//}
//

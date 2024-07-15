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
    @FocusState var keyboardFocused: Bool
    @Query(sort: \IngredientBase.name) var ingredients: [IngredientBase]
    
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
                        ThumbsUpOrDownIngredientSearchList(viewModel: viewModel, keyboardFocused: _keyboardFocused)
                        SearchForCocktailsButton(viewModel: viewModel)
                        ResetButton(viewModel: viewModel)
                    }
                    
                }
                .task {
                    for ingredient in ingredients {
                        ingredient.isPrefered = false
                        ingredient.isUnwanted = false
                    }
                    viewModel.preferredCount = 0
                    keyboardFocused = true
                }
            }
        }
    }
}

#Preview {
    BasicSearchViewWithDataQuery()
        .environmentObject(SearchCriteriaViewModel())
}

struct ThumbsUpOrDownIngredientSearchList: View {
    @Bindable var viewModel: SearchViewModel
    @Query(sort: \IngredientBase.name) var ingredients: [IngredientBase]
    @FocusState var keyboardFocused: Bool
    
    var body: some View {
        Section("Name") {
            VStack{
                HStack{
                    TextField("Flavor or Ingredient", text: $viewModel.currentComponentSearchName)
                        .focused($keyboardFocused)
                        .autocorrectionDisabled(true)
                        .onChange(of: viewModel.currentComponentSearchName, initial: true) { old, new in
                            viewModel.currentComponentSearchName = new
                            viewModel.filteredIngredients = viewModel.matchAllIngredients(ingredients: ingredients)
                        }
                    if !viewModel.currentComponentSearchName.isEmpty {
                        Button {
                            viewModel.currentComponentSearchName = ""
                        } label: {
                            Image(systemName: "multiply.circle.fill")
                                .foregroundStyle(.brandPrimaryGold)
                        }
                        .padding(.trailing, 10)
                    }
                }
            }
            if keyboardFocused {
                List {
                    ForEach($viewModel.filteredIngredients, id: \.name) { ingredient in
                        
                        PreferencesThumbsCell(viewModel: viewModel, ingredient: ingredient)
                        
                        
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
}

struct SearchForCocktailsButton: View {
    @Bindable var viewModel: SearchViewModel
    
    var body: some View {
        NavigationLink {
            SearchResultsViewDataQueries(viewModel: viewModel)
        } label: {
            
            HStack {
                Spacer()
                Image(systemName: "plus.circle.fill")
                    .font(.footnote).bold()
                Text("Search For Cocktails")
                    .font(.footnote).bold()
                Spacer()
            }
            .foregroundStyle(.brandPrimaryGold)
            
        }
        .frame(width: 380, height: 40,  alignment: .center)
    }
}
struct ResetButton: View {
    @Bindable var viewModel: SearchViewModel
    @Query(sort: \IngredientBase.name) var ingredients: [IngredientBase]
    
    var body: some View {
        Section{
            Button{
                for ingredient in ingredients {
                    ingredient.isPrefered = false
                    ingredient.isUnwanted = false 
                }
                viewModel.clearData()
            } label: {
                
                HStack {
                    Image(systemName: "arrow.triangle.2.circlepath")
                        .font(.footnote).bold()
                    Text("Clear Search")
                        .font(.footnote).bold()
                }
                .tint(.brandPrimaryRed)
                .padding()
            }
            .frame(width: 380, height: 40,  alignment: .center)
        }

    }
}

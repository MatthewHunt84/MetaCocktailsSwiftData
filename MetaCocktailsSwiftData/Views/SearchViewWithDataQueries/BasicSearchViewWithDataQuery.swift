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
            HStack {
                Text("Search Ingredients")
                    .font(.largeTitle).bold()
                    .padding(EdgeInsets(top: 0, leading: 12, bottom: -7, trailing: 0))
                Spacer()
            }
            preferencesListView(viewModel: viewModel)
            VStack{
                
                Form{
                    ThumbsUpOrDownIngredientSearchList(viewModel: viewModel, keyboardFocused: _keyboardFocused)
                    SearchForCocktailsButton(viewModel: viewModel)
                    ResetButton(viewModel: viewModel)
                    
                }
                
                
            }
            
            
            .onAppear() {
                for ingredient in ingredients {
                    ingredient.isPrefered = false
                    ingredient.isUnwanted = false
                }
                viewModel.clearData()
                viewModel.preferredCount = 0
                keyboardFocused = true
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
struct preferencesListView: View {
    @Bindable var viewModel: SearchViewModel
    @Environment(\.modelContext) var modelContext
    var body: some View {
        VStack{
            if viewModel.preferredCount > 0 {
                Text("Your Selections (tap to remove)")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .padding(.leading, 20)
                    .padding(.top, 25)
            }
            if !viewModel.preferredIngredients.isEmpty {
                ScrollView(.horizontal) {
                    
                    HStack(spacing: 12) {
                        ForEach(viewModel.preferredIngredients, id: \.name) { selectedIngredient in
                            viewModel.TagView(selectedIngredient.name, .green , "xmark")
                                .onTapGesture {
                                    withAnimation(.snappy) {
                                        viewModel.preferredIngredients.removeAll(where: { $0.name == selectedIngredient.name})
                                    }
                                }
                        }
                    }
                    .padding(.horizontal, 15)
                    .frame(height: 35)
                }
                .mask(LinearGradient(stops: [.init(color: .clear, location: 0), .init(color: .white, location: 0.05), .init(color: .white, location: 0.95), .init(color: .clear, location: 1)], startPoint: .leading, endPoint: .trailing))
                .scrollClipDisabled(true)
                .scrollIndicators(.hidden)
            }
            
            if !viewModel.unwantedIngredients.isEmpty {
                ScrollView(.horizontal) {
                    
                    HStack(spacing: 12) {
                        ForEach(viewModel.findUnwantedIngredients(modelContext: modelContext), id: \.name) { selectedIngredient in
                            viewModel.TagView(selectedIngredient.name, .red, "xmark")
                                .onTapGesture {
                                    withAnimation(.snappy) {
                                        viewModel.unwantedIngredients.removeAll(where: { $0.name == selectedIngredient.name})
                                    }
                                }
                        }
                    }
                    .padding(.horizontal, 15)
                    .frame(height: 35)
                }
                .scrollClipDisabled(true)
                .scrollIndicators(.hidden)
            }
        }
    }
}

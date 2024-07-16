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
                    ingredient.isPreferred = false
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
public struct preferencesListView: View {
    @Bindable var viewModel: SearchViewModel
    @Environment(\.modelContext) var modelContext
    @Query(filter: #Predicate<IngredientBase> { ingredient in
        ingredient.isPreferred == true } ) var preferredIngredients: [IngredientBase]
    @Query(filter: #Predicate<IngredientBase> { ingredient in
        ingredient.isUnwanted == true } ) var unwantedIngredients: [IngredientBase]
    
    public var body: some View {
        VStack{
            HStack {
                Text("Your selections show up here. Tap to remove them.")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .padding(.leading, 12)
                    .padding(.top, 25)
                Spacer()
            }
                ScrollView(.horizontal) {
                    
                    HStack(spacing: 12) {
                        ForEach(preferredIngredients) { selectedIngredient in
                            viewModel.viewModelTagView(selectedIngredient.name, .green , "xmark")
                                .onTapGesture {
                                    withAnimation(.snappy) {
                                        selectedIngredient.isPreferred = false
                                        viewModel.hack.toggle()
                                    }
                                    if !viewModel.onBasisSearchView {
                                        viewModel.findCocktails(modelContext: modelContext)
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
         
            
                ScrollView(.horizontal) {
                    
                    HStack(spacing: 12) {
                        ForEach(unwantedIngredients, id: \.name) { selectedIngredient in
                            viewModel.viewModelTagView(selectedIngredient.name, .red, "xmark")
                                .onTapGesture {
                                    withAnimation(.snappy) {
                                        selectedIngredient.isUnwanted = false
                                        viewModel.hack.toggle()
                                    }
                                    if !viewModel.onBasisSearchView {
                                        viewModel.findCocktails(modelContext: modelContext)
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
    }
}

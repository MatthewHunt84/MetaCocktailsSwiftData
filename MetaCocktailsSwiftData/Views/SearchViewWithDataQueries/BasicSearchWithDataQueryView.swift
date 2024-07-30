//
//  BasicSearchViewWithDataQuery.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 7/14/24.
//

import SwiftUI
import SwiftData

struct BasicSearchWithDataQueryView: View {
    
    @Bindable var viewModel = SearchViewModel()
    @FocusState var keyboardFocused: Bool
    @Query var cocktails: [Cocktail]
    @Environment(\.modelContext) var modelContext
   
   
    var body: some View {
        NavigationStack {
            
            VStack{
                HStack {
                    Text("Search Ingredients")
                        .font(.largeTitle).bold()
                        .padding(EdgeInsets(top: 0, leading: 12, bottom: -7, trailing: 0))
                    Spacer()
                }
                preferencesListView(viewModel: viewModel)
                VStack{
                    Form{
                        ThumbsUpOrDownIngredientSearchListView(viewModel: viewModel, keyboardFocused: _keyboardFocused)
                        SearchForCocktailsButton(viewModel: viewModel)
                        ResetButton(viewModel: viewModel)
                    }
                }
            }
            .onAppear() {
                keyboardFocused = true
            }
            .navigationDestination(isPresented: $viewModel.basicSearchViewIsActive) {
                SearchResultsDataQueriesView(viewModel: viewModel)
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
}

#Preview {
    BasicSearchWithDataQueryView()
        .environmentObject(SearchCriteriaViewModel())
}

struct ThumbsUpOrDownIngredientSearchListView: View {
    @Bindable var viewModel: SearchViewModel
    @Environment(\.modelContext) var modelContext
    @Query(sort: \IngredientBase.name) var ingredients: [IngredientBase]
    @FocusState var keyboardFocused: Bool
    
    var body: some View {
        Section("Component Name:") {
            VStack{
                HStack{
                    TextField("Flavor, Ingredient, Style, or Profile...", text: $viewModel.currentComponentSearchName)
                        .focused($keyboardFocused)
                        .autocorrectionDisabled(true)
                        .onChange(of: viewModel.currentComponentSearchName, initial: true) { old, new in
                            viewModel.currentComponentSearchName = new
                            viewModel.filteredIngredients = viewModel.matchAllIngredientsAndSubcategories(ingredients: ingredients.map({$0.name}))
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
                    ForEach($viewModel.filteredIngredients, id: \.self) { ingredient in
                       
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
    @Environment(\.modelContext) var modelContext
   
    var body: some View {
        Button {
            viewModel.basicSearchViewIsActive = true
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
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        Section{
            Button{
               
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

    
    public var body: some View {
        VStack{
            HStack{
                Text("Selected Preferences:")
                    .padding(.top, 25)
                    .padding(.leading, 12)
                    .font(.headline).bold()
                Spacer()
            }
            HStack {
                Text("Tap to remove")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .padding(.leading, 12)
                
                Spacer()
            }
            ScrollView(.horizontal) {
                
                HStack(spacing: 12) {
                    ForEach(viewModel.preferredIngredients, id: \.self) { preferredIngredient in
                        viewModel.viewModelTagView(preferredIngredient, .green , "xmark")
                            .onTapGesture {
                                withAnimation(.snappy) {
                                    viewModel.preferredCount -= 1
                                    viewModel.preferredIngredients.removeAll(where: { $0 == preferredIngredient})
                                    if viewModel.preferredCount == 0 {
                                        viewModel.basicSearchViewIsActive = false
                                    }
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
                        ForEach(viewModel.unwantedIngredients, id: \.self) { unwantedIngredient in
                            viewModel.viewModelTagView(unwantedIngredient, .red, "xmark")
                                .onTapGesture {
                                    withAnimation(.snappy) {
                                        viewModel.unwantedIngredients.removeAll(where:{ $0 == unwantedIngredient })
                                    
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
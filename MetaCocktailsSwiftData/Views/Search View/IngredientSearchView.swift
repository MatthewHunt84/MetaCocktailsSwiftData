//
//  IngredientSearchView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 7/14/24.
//

import SwiftUI
import SwiftData

struct IngredientSearchView: View {
    
    @EnvironmentObject var viewModel: SearchViewModel
    @FocusState var keyboardFocused: Bool
    
    var body: some View {
        
        NavigationStack {
            
            VStack{
                
                preferencesListView()
                
                VStack{
                    
                    Form{
                        ThumbsUpOrDownIngredientSearchListView(keyboardFocused: _keyboardFocused)
                        SearchForCocktailsButton()
                        ResetButton()
                    }
                }
            }
            .navigationDestination(isPresented: $viewModel.isShowingResults) {
                IngredientSearchResultsView()
                    .navigationBarBackButtonHidden(true)
            }
            .onChange(of: viewModel.searchCompleted) { _, newValue in
                if newValue {
                    viewModel.toggleIsShowingResults()
                    viewModel.resetSearch()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Text("Search Ingredients")
                        .font(.largeTitle).bold()
                }
            }
            .task {
                keyboardFocused = true
            }
            .basicLoadingIndicator(isLoading: viewModel.isRunningComplexSearch)
        }
    }
}

struct SearchForCocktailsButton: View {
    @EnvironmentObject var viewModel: SearchViewModel
    
    var body: some View {
        
        Button {
            Task {
                await viewModel.searchButtonPressed()
            }
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
        .disabled(viewModel.isRunningComplexSearch)
    }
}

struct ResetButton: View {
    @EnvironmentObject var viewModel: SearchViewModel
    
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

struct ThumbsUpOrDownIngredientSearchListView: View {
    @Environment(\.modelContext) var modelContext
    @EnvironmentObject var viewModel: SearchViewModel
    @Query(sort: \IngredientBase.name) var ingredients: [IngredientBase]
    @FocusState var keyboardFocused: Bool
    
    @State var ingredientNames = [String]()
    
    var body: some View {
        Section("Component Name:") {
            
            VStack{
                
                HStack{
                    
                    TextField("Flavor, Ingredient, Style, or Profile...", text: $viewModel.currentComponentSearchName)
                        .focused($keyboardFocused)
                        .autocorrectionDisabled(true)
                        .onChange(of: viewModel.currentComponentSearchName) { _, newValue in
                            viewModel.updateSearch(newValue)
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
            .task {
                viewModel.setupSearch()
                viewModel.ingredientNames = ingredients.map({$0.name})
            }
            
            if keyboardFocused {
                List {
                    
                    ForEach($viewModel.filteredIngredients, id: \.self) { ingredient in
                        viewModel.returnPreferencesThumbCell(ingredient: ingredient)
                    }
                    .listStyle(.plain)
                    .listRowBackground(Color.black)
                }
                .scrollContentBackground(.hidden)
                .task {
                    await generateAllCocktailList(context: modelContext)
                }
            } else {
                EmptyView()
            }
        }
    }
    
    func generateAllCocktailList(context: ModelContext) async {
        if viewModel.allCocktails.isEmpty {
            Task {
                do {
                    let descriptor = FetchDescriptor<Cocktail>()
                    let fetchedCocktails = try context.fetch(descriptor)
                        viewModel.allCocktails = fetchedCocktails
                } catch {
                    print("Error fetching cocktails: \(error)")
                }
            }
        }
    }
}

public struct preferencesListView: View {
    @EnvironmentObject var viewModel: SearchViewModel
    @Environment(\.dismiss) var dismiss
    
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
                    
                    ForEach(viewModel.preferredSelections, id: \.self) { preferredIngredient in
                        viewModel.viewModelTagView(preferredIngredient, .green , "xmark")
                            .onTapGesture {
                                withAnimation(.snappy) {
                                    guard !viewModel.isRunningComplexSearch else { return }
                                    viewModel.handleRemovalOf(selection: preferredIngredient, preferred: true)
                                    if viewModel.preferredCount == 0 {
                                        dismiss()
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
                    
                    ForEach(viewModel.unwantedSelections, id: \.self) { unwantedSelection in
                        viewModel.viewModelTagView(unwantedSelection, .red, "xmark")
                            .onTapGesture {
                                withAnimation(.snappy) {
                                    viewModel.handleRemovalOf(selection: unwantedSelection, preferred: false)
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

#Preview {
    IngredientSearchView()
        .environmentObject(SearchCriteriaViewModel())
}

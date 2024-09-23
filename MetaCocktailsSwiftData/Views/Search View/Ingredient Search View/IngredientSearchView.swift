//
//  IngredientSearchView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 7/14/24.
//

import SwiftUI
import SwiftData

struct IngredientSearchView: View {
    
    @Environment(\.modelContext) var modelContext
    @EnvironmentObject var viewModel: SearchViewModel
    @FocusState var keyboardFocused: Bool
    @State private var backgroundIsActive: Bool = false
    @State private var isGeneratingStuff: Bool = false
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                ColorScheme.background.ignoresSafeArea()
                
                VStack {

                    if !viewModel.preferredSelections.isEmpty || !viewModel.unwantedSelections.isEmpty {
                        PreferencesListView()
                    } else {
                        FindCocktailUserInfoView()
                            .padding(.bottom, -5)
                    }
                    
                    FilteredIngredientListView(keyboardFocused: _keyboardFocused)
                        .onTapGesture {
                            keyboardFocused = true
                        }
                    
                    Spacer()
                    
                    if keyboardFocused {
                        HStack {
                            Spacer()
                            
                            Button(action: {
                                keyboardFocused = false
                            }) {
                                Image(systemName: "keyboard.chevron.compact.down")
                                    .font(.system(size: 22))
                                
                            }
                            .buttonStyle(.plain)
                            .padding(.trailing, 16)
                            .padding(.bottom, 8)
                            .foregroundStyle(.blueTint)
                        }
                    }
                }
            }
            .animation(.easeOut(duration: 0.5), value: viewModel.preferredSelections.isEmpty)
            .navigationDestination(isPresented: $viewModel.isShowingResults) {
                IngredientSearchResultsView()
                
            }
            .onChange(of: viewModel.searchCompleted) { _, _ in
                if !viewModel.preferredSelections.isEmpty || !viewModel.unwantedSelections.isEmpty {
                    viewModel.toggleIsShowingResults()
                    viewModel.resetSearch()
                } else {
                    viewModel.searchCompleted = false
                }
            }
            .systemLoadingIndicator(isLoading: isGeneratingStuff)
            .navigationBarTitleDisplayMode(.inline)
            .jamesHeader("Cocktail Ingredient Search")
            .customLoadingIndicator(isLoading: viewModel.isRunningComplexSearch)
            .task {
                isGeneratingStuff = true
                await generateAllCocktailList(context: modelContext)
                isGeneratingStuff = false
            }
        }
    }
    
    func generateAllCocktailList(context: ModelContext) async {
        if viewModel.allCocktails.isEmpty {
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

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    return IngredientSearchView()
        .environmentObject(SearchViewModel())
        .modelContainer(preview.container)
    
}

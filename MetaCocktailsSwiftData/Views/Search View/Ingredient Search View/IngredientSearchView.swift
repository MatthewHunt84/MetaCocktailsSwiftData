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
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                    MeshGradients.meshBlueRibbonBackground.ignoresSafeArea()
                VStack{
                    FontFactory.titleHeader30(title: "Search Cocktails")
                    FilteredIngredientListView(keyboardFocused: _keyboardFocused)
                        .onTapGesture {
                            keyboardFocused = true
                        }
                    
                    Spacer()
                    if !viewModel.preferredSelections.isEmpty {
                        PreferencesListView()
                            .padding(.top, 5)
                    }
                }
            }
            .animation(.easeOut(duration: 0.5), value: viewModel.preferredSelections.isEmpty)
            .navigationDestination(isPresented: $viewModel.isShowingResults) {
                IngredientSearchResultsView()
                
            }
            .onChange(of: viewModel.searchCompleted) { _, newValue in
                if newValue {
                    viewModel.toggleIsShowingResults()
                    viewModel.resetSearch()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .funLoadingIndicator(isLoading: viewModel.isRunningComplexSearch)
        }
    }
}



#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    return IngredientSearchView()
        .environmentObject(SearchViewModel())
        .modelContainer(preview.container)
    
}

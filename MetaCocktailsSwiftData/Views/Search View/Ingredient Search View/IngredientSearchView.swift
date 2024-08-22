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
                
                //Color.black.ignoresSafeArea()
                if viewModel.preferredSelections.isEmpty {
                    MeshGradients.blackGreyBackground.ignoresSafeArea()
                } else {
                    MeshGradient(width: 3, height: 3, points: [
                        [0, 0], [0.5, 0], [1, 0],
                        [ 0 , 0.5], [0.5, 0.5], [1, 0.5],
                        [0 , 0.7], [backgroundIsActive ? 0.55 : 0.69 , backgroundIsActive ? 0.55 : 0.6], [1 , 0]
                    ], colors: [
                        .black, .black,.black,
                        .black, .black, .black,
                        .brandSecondaryBlue, .brandSecondaryBlue, .brandSecondaryBlue
                    ]).ignoresSafeArea()
                        .onAppear{
                            withAnimation(.easeInOut(duration: 10).repeatForever(autoreverses: true)) {
                                backgroundIsActive.toggle()
                            }
                        }
                }
                
                VStack{
                    
                    Text("Search Cocktails")
                        .font(.custom("AvenirNext-Regular", size: 24)).bold()
                    
                    
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
            //.navigationTitle("Search Ingredients")
            
            //.goldHeader("Search Ingredients")
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

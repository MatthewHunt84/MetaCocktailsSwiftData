//
//  SearchResultsViewDataQueries.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 7/14/24.
//

import SwiftUI
import SwiftData

struct IngredientSearchResultsView: View {
    @EnvironmentObject var viewModel: SearchViewModel
    @Environment(\.dismiss) var dismiss
    @State private var backgroundIsActive: Bool = false
    var body: some View {
        
        
        ZStack {
            
            MeshGradient(width: 3, height: 3, points: [
                [0, 0], [0.5, 0], [1, 0],
                [ 0 , 0.5], [0.5, 0.5], [1, 0.5],
                [0 , 0.3], [backgroundIsActive ? 0.35 : 0.49 , backgroundIsActive ? 0.6 : 0.62], [1 , 1]
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
            
            VStack {
                Text("Matched Cocktails")
                    .font(.custom("AvenirNext-Regular", size: 24)).bold()
                PreferencesListView()
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                IngredientSearchMatchedCocktailsView()
                
                
            }
            .navigationBarBackButtonHidden(true)
            .basicLoadingIndicator(isLoading: viewModel.isRunningComplexSearch)
        }
    }
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    IngredientSearchResultsView()
        .modelContainer(preview.container)
}


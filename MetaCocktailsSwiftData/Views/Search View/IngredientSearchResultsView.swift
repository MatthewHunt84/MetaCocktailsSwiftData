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
    
    var body: some View {
        
        
        ZStack {
            
            MeshGradients.blackGreyBackground.ignoresSafeArea()
            
            VStack {
                
                IngredientSearchMatchedCocktailsView()
                
                PreferencesListView()
                    .padding(.top, 10)
                    .padding(.bottom, 10)
            }
            .navigationBarBackButtonHidden(true)
            .basicLoadingIndicator(isLoading: viewModel.isRunningComplexSearch)
            .goldHeaderWithNavigation(title: "Matched Cocktails", dismiss: dismiss)
        }
    }
    
    @ViewBuilder func SearchResultsTagView(_ tag: String, _ color: Color, _ icon: String) -> some View {
        HStack(spacing: 10) {
            Text(tag)
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Image(systemName: icon)
                .fontWeight(.heavy)
                .foregroundColor(.white)
        }
        .frame(height: 35)
        .foregroundStyle(.black)
        .padding(.horizontal, 15)
        .background {
            Capsule()
                .fill(color.gradient)
        }
    }
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    IngredientSearchResultsView()
        .modelContainer(preview.container)
}


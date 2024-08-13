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
        
        VStack {
            
            preferencesListView()
            
            IngredientSearchMatchedCocktailsView()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    viewModel.willLoadOnAppear = true
                    dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 9)
                        .bold()
                        .tint(.cyan)
                }
            }
            
            ToolbarItem(placement: .navigation) {
                Text("Matched Cocktails")
                    .font(.largeTitle).bold()
            }
        }
        .blur(radius: viewModel.isRunningComplexSearch ? 3 : 0)
        .overlay {
            if viewModel.isRunningComplexSearch {
                LoadingAnimation()
                    .frame(width: 120, height: 120)
            }
        }
        .onAppear {
            print("RESULT VIEW: IS APPEARING")
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


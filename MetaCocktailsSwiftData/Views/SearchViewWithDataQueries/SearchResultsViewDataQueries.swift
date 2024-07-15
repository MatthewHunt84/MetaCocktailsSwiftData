//
//  SearchResultsViewDataQueries.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 7/14/24.
//

import SwiftUI
import SwiftData

struct SearchResultsViewDataQueries: View {
    @Bindable var viewModel: SearchViewModel
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        HStack{
            Button{
                dismiss()
                viewModel.willLoadOnAppear = true
            } label: {
                Image(systemName: "chevron.backward")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 9)
                    .bold()
                    .tint(.cyan)
            }
            Spacer()
        }
        VStack(alignment: .leading) {
            
            if viewModel.preferredCount > 0 {
                Text("Your Selections (tap to remove)")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .padding(.leading, 20)
                    .padding(.top, 25)
            }
            
            if !viewModel.findPreferedIngredients(modelContext: modelContext).isEmpty {
                ScrollView(.horizontal) {
                    
                    HStack(spacing: 12) {
                        ForEach(viewModel.findPreferedIngredients(modelContext: modelContext), id: \.name) { selectedIngredient in
                            TagView(selectedIngredient.name, .green , "xmark")
                                .onTapGesture {
                                    withAnimation(.snappy) {
                                        viewModel.removePreference(for: selectedIngredient)
                                        
                                    }
                                    viewModel.findCocktails(modelContext: modelContext)
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
            
            if !viewModel.findUnwantedIngredients(modelContext: modelContext).isEmpty {
                ScrollView(.horizontal) {
                    
                    HStack(spacing: 12) {
                        ForEach(viewModel.findUnwantedIngredients(modelContext: modelContext), id: \.name) { selectedIngredient in
                            TagView(selectedIngredient.name, .red, "xmark")
                                .onTapGesture {
                                    withAnimation(.snappy) {
                                        viewModel.removeUnwanted(for: selectedIngredient)
                                    }
                                    viewModel.findCocktails(modelContext: modelContext)
                                }
                        }
                    }
                    .padding(.horizontal, 15)
                    .frame(height: 35)
                }
                .scrollClipDisabled(true)
                .scrollIndicators(.hidden)
            }
           
            CocktailResultListDataQueries(viewModel: viewModel, isLoading: $viewModel.isLoading)
                .navigationBarBackButtonHidden(true)
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear() {
            if viewModel.willLoadOnAppear == true {
                viewModel.findCocktails(modelContext: modelContext)
                
            }
            viewModel.willLoadOnAppear = false
        }
    }
    
    @ViewBuilder func TagView(_ tag: String, _ color: Color, _ icon: String) -> some View {
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

//#Preview {
//    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
//    return SearchResultsViewDataQueries(viewModel: SearchCriteriaViewModel())
//        .modelContainer(preview.container)
//}

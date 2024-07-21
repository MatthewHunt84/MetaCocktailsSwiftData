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
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss

    
    var body: some View {
        NavigationStack{
            HStack{
                Button{
                    viewModel.onBasisSearchView = true
                    viewModel.willLoadOnAppear = true
                    dismiss()
                    
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
            HStack {
                Text("Matched Cocktails")
                    .font(.largeTitle).bold()
                    .padding(EdgeInsets(top: 0, leading: 12, bottom: -7, trailing: 0))
                Spacer()
            }
            
            VStack(alignment: .leading) {
                preferencesListView(viewModel: viewModel)
                CocktailResultListDataQueries(viewModel: viewModel)
                .navigationBarBackButtonHidden(true)
            }
            .navigationBarTitleDisplayMode(.inline)
            
            
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
    SearchResultsViewDataQueries(viewModel: SearchViewModel())
        .modelContainer(preview.container)
}


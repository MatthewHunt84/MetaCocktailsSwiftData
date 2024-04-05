//
//  SearchResultsView.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 11/26/23.
//

import SwiftUI
import SwiftData

struct SearchResultsView: View {
    
    @ObservedObject var viewModel: SearchCriteriaViewModel
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Cocktail.cocktailName) var cocktails: [Cocktail]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        BackButton()
        VStack(alignment: .leading) {
            
            if viewModel.preferredCount > 0 {
                Text("Your Selections (tap to remove)")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .padding(.leading, 20)
                    .padding(.top, 25)
            }
            
            if !viewModel.cocktailComponents.filter({ $0.isPreferred }).isEmpty {
                ScrollView(.horizontal) {
                    
                    HStack(spacing: 12) {
                        ForEach(viewModel.cocktailComponents.filter({ $0.isPreferred }), id: \.self.id) { selectedIngredient in
                            TagView(selectedIngredient.name, .green , "xmark")
                                .onTapGesture {
                                    withAnimation(.snappy) {
                                        removePreference(for: selectedIngredient)
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
            
            if !viewModel.cocktailComponents.filter({ $0.isUnwanted }).isEmpty {
                ScrollView(.horizontal) {
                    
                    HStack(spacing: 12) {
                        ForEach(viewModel.cocktailComponents.filter({ $0.isUnwanted }), id: \.self) { selectedIngredient in
                            TagView(selectedIngredient.name, .red, "xmark")
                                .onTapGesture {
                                    withAnimation(.snappy) {
                                       removeUnwanted(for: selectedIngredient)
                                    }
                                }
                        }
                    }
                    .padding(.horizontal, 15)
                    .frame(height: 35)
                }
                .scrollClipDisabled(true)
                .scrollIndicators(.hidden)
            }
           
            CocktailResultList(viewModel: viewModel, isLoading: $viewModel.isLoading)
                .navigationBarBackButtonHidden(true)
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear() {
            getFilteredCocktailsSwiftData()
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

struct SearchedCocktailTitleHeader: View {
    
    var searched: Int
    var matched: Int

    var body: some View {
        HStack {
            ForEach(0..<matched, id: \.self) { match in
                Image(systemName: "circle.fill")
                    .foregroundStyle(Color.green)
            }
            
            if matched - searched < 0 {
                ForEach(0..<(searched - matched), id: \.self) { nonMatch in
                    Image(systemName: "circle.fill")
                }
            }
            
            Spacer()
            
            Text("^[\(matched)/\(searched) matches](inflect: true)")
        }
    }
}

struct SearchedCocktailTitleHeaderForMultipleSpirits: View {
    
    var searched: Int
    var matched: Int
    var baseSpirit: String
    
    var body: some View {
        HStack {
            Text(baseSpirit)
                .font(.headline).bold()
            
            ForEach(0..<matched, id: \.self) { match in
                Image(systemName: "circle.fill")
                    .foregroundStyle(Color.green)
            }
            
            if matched - searched < 0 {
                ForEach(0..<(searched - matched), id: \.self) { nonMatch in
                    Image(systemName: "circle.fill")
                    
                }
            }
            
            Spacer()
            
            Text("^[\(matched)/\(searched) matches](inflect: true)")
        }
    }
}

struct SearchedCocktailCell: View {
    
    var cocktail: Cocktail
    
    var body: some View {
        VStack {
            Text("\(cocktail.cocktailName)")
        }
    }
}


#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    return SearchResultsView(viewModel: SearchCriteriaViewModel())
        .modelContainer(preview.container)
}

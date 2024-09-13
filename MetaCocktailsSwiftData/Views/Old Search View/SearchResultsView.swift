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
            
            if !viewModel.cocktailComponents.filter({ $0.isPreferred }).isEmpty {
                ScrollView(.horizontal) {
                    
                    HStack(spacing: 12) {
                        ForEach(viewModel.cocktailComponents.filter({ $0.isPreferred }), id: \.self.id) { selectedIngredient in
                            TagView(selectedIngredient.name, .green , "xmark")
                                .onTapGesture {
                                    withAnimation(.snappy) {
                                        viewModel.removePreference(for: selectedIngredient)
                                        
                                    }
                                    viewModel.getFilteredCocktailsSwiftData(for: cocktails)
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
                                        viewModel.removeUnwanted(for: selectedIngredient)
                                    }
                                    viewModel.getFilteredCocktailsSwiftData(for: cocktails)
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
           
            CocktailResultList(viewModel: viewModel, isLoading: $viewModel.isLoading)
                .navigationBarBackButtonHidden(true)
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear() {
            if viewModel.willLoadOnAppear == true {
                viewModel.getFilteredCocktailsSwiftData(for: cocktails)
                
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

struct SearchedCocktailTitleHeader: View {
    
    var searched: Int
    var matched: Int

    var body: some View {
        HStack {
            
            if matched == searched {
                Text("Perfect Match Cocktails")
                    .foregroundStyle(ColorScheme.tintColor)
                    .font(FontFactory.mediumFont(size: 16))
                    .fontWeight(.semibold)
            } else if matched == (searched - 1) {
                Text("Minus One Ingredient")
                    .font(FontFactory.mediumFont(size: 16))
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
            } else {
                Text("Minus Two Ingredients")
                    .font(FontFactory.mediumFont(size: 16))
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
            }
            
            Spacer()
            
            ForEach(0..<matched, id: \.self) { match in
                Image(systemName: "circle.fill")
                    .foregroundStyle(matched == searched ? ColorScheme.tintColor : .white)
            }
            
            if matched - searched < 0 {
                ForEach(0..<(searched - matched), id: \.self) { nonMatch in
                    Image(systemName: "circle")
                        .foregroundStyle(.secondary)
                }
            }
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

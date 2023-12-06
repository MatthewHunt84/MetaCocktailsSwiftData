//
//  SearchResultsView.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 11/26/23.
//

import SwiftUI

struct SearchResultsView: View {
    
    @ObservedObject var viewModel: SearchCriteriaViewModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("Your Selections (tap to remove)")
//                .font(.title3)
                .foregroundStyle(.gray)
                .padding(.leading, 20)
                .padding(.top, 25)

            
            ScrollView(.horizontal) {
                HStack(spacing: 12) {
                    ForEach(viewModel.preferredIngredients, id: \.self) { selectedIngredient in
                        TagView(selectedIngredient.name, .green, "xmark")
//                            .matchedGeometryEffect(id: tag, in: animation)
                        // removing from selected list on tap
                            .onTapGesture {
                                withAnimation(.snappy) {
                                    viewModel.preferredIngredients.removeAll(where: { $0 == selectedIngredient })
                                    // we still need to flip the .preferred to false but I'll get to that ..
                                }
                            }
                    }
                }
                .padding(.horizontal, 15)
                .frame(height: 35)

            }
            .scrollClipDisabled(true)
            .scrollIndicators(.hidden)
            
            CocktailResultList(viewModel: viewModel)
        }
        .navigationBarTitleDisplayMode(.inline)
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
            
            ForEach(0..<matched) { match in
                Image(systemName: "circle.fill")
                    .foregroundStyle(Color.green)
            }
            
            if matched - searched < 0 {
                ForEach(0..<(searched - matched)) { nonMatch in
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
    SearchResultsView(viewModel: SearchCriteriaViewModel())
}

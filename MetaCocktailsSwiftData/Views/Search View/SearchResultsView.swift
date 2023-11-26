//
//  SearchResultsView.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 11/26/23.
//

import SwiftUI

struct SearchResultsView: View {
    
    var viewModel: SearchCriteriaViewModel
    
    //viewModel new stuff
    var matched: Int = 5
    var searched: Int = 5
    
    var body: some View {
        VStack {
            
            Text("Search Tags Go Here")
                .frame(width: .infinity, height: 100)
            
            List {
                Section(header: SearchedCocktailTitleHeader(searched: 7, matched: 7)) {
                    SearchedCocktailCell()
                    SearchedCocktailCell()
                }
                
                
                Section(header: SearchedCocktailTitleHeader(searched: 7, matched: 6)) {
                    SearchedCocktailCell()

                }
                
                Section(header: SearchedCocktailTitleHeader(searched: 7, matched: 5)) {
                    SearchedCocktailCell()

                }
            }
            .listStyle(.grouped)
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
    
    @State var isExpanded = false
    
    var body: some View {
        VStack {
            Text("Cocktail name")
        }
        .frame(height: isExpanded ? 100 : 20)
        .onTapGesture {
            isExpanded.toggle()
        }
        .animation(.bouncy(duration: 0.5))
    }
}

#Preview {
    SearchResultsView(viewModel: SearchCriteriaViewModel())
}

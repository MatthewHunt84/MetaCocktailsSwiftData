//
//  AddTo86ListView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import SwiftUI

struct AddTo86ListView: View {
    
    @EnvironmentObject var viewModel: SearchCriteriaViewModel
    var body: some View {
        
        NavigationStack{
            VStack{
                List{
                    ForEach( $viewModel.cocktailComponents, id: \.self.id) { component in
                        if component.matchesCurrentSearch.wrappedValue && (component.isNA.wrappedValue || component.isSpirit.wrappedValue) {
                            EightySixCheckListCell(ingredient: component)
                                
                        }
                    }
                }
                .listStyle(.plain)
                
                SearchBarView(searchText: $viewModel.searchText)
                    .onChange(of: viewModel.searchText) {
                        viewModel.matchAllTheThings()
                    }
            }
        }
        
    }
}

#Preview {
    AddTo86ListView()
        .environmentObject(SearchCriteriaViewModel())
}

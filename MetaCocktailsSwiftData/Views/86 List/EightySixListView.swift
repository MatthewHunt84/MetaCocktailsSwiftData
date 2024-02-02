//
//  EightySixListView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import SwiftUI

struct EightySixListView: View {
    var viewModel = EightySixListViewModel()
    @EnvironmentObject var searchViewModel: SearchCriteriaViewModel
    
    var body: some View {
        NavigationStack{
            VStack {
                List {
                    ForEach( $searchViewModel.cocktailComponents, id: \.self.id) { component in
                        if component.is86d.wrappedValue {
                            EightySixCheckListCell(ingredient: component)
                                
                        }
                    }
                }
                .listStyle(.plain)
                NavigationLink {
                    AddTo86ListView()
                } label: {
                    Text("Add Inventory")
                }
                .buttonStyle(whiteButton())
                Rectangle()
                    .fill(.black)
                    .frame(width: 60, height: 40, alignment: .center)
                
            }
            .navigationTitle("86 List")
        }
    }
}

#Preview {
    
    
    EightySixListView()
        
}

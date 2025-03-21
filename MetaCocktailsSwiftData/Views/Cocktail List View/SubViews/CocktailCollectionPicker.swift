//
//  CocktailCollectionPicker.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/10/24.
//

import SwiftUI

struct CocktailCollectionPicker: View {
    
    @EnvironmentObject var viewModel: CocktailListViewModel
    @Binding  var cocktailCollection: CocktailCollection
    
    var body: some View {
        HStack {
            Menu {
                Picker(selection: $cocktailCollection) {
                    ForEach(CocktailCollection.allCases, id: \.self) { int in
                        if int.collectionName != "Custom" && int.collectionName != "Death & Co." {
                            Text(int.collectionName)
                        }
                    }
                } label: {}
            } label: {
                Text("Collection: \(cocktailCollection.collectionName)")
                    .font(.headline)
                    .tint(.white)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
    }
}

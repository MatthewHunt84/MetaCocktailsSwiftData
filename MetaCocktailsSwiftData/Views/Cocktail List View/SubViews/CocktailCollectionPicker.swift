//
//  CocktailCollectionPicker.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/10/24.
//

import SwiftUI

struct CocktailCollectionPicker: View {
    
    @Bindable var viewModel = CocktailListViewModel()
    @Binding  var cocktailCollection: CocktailCollection
    
    var body: some View {
        HStack {
            Menu {
                Picker(selection: $cocktailCollection) {
                    ForEach(CocktailCollection.allCases, id: \.self) { int in
                        if int.collectionName != "Custom" && int.collectionName != "Death & Co." {
                            Text(int.collectionName)
                                .font(.custom("AvenirNext-Regular", size: 18))
                        }
                    }
                } label: { }
            } label: {
                HStack {
//                    Text("Collection: \(cocktailCollection.collectionName)")
                    Text(cocktailCollection == .all ? "Collection" : cocktailCollection.collectionName)
                    
                        .font(.custom("AvenirNext-Regular", size: 18))
                        .tint(.white)
                    Image(systemName: "chevron.down")
                        .foregroundStyle(Color.blueTint)
                }
            }
            
            if viewModel.cocktailCollection == .originals {
                Image(systemName: "questionmark.circle.fill")
                    .foregroundStyle(viewModel.isShowingOriginalCocktailInfo ? .brandPrimaryGold : .blue)
                    .onTapGesture {
                        viewModel.isShowingOriginalCocktailInfo.toggle()
                    }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 0))
    }
}

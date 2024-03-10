//
//  CocktailListView.swift
//  MetaCocktails
//
//  Created by James on 8/8/23.
//

import SwiftUI
import SwiftData
import UIKit

struct CocktailListView: View {
    
    @Bindable var viewModel = CocktailListViewModel()
    @State private var cocktailCollection: CocktailCollection = .all
    @Query(sort: \Cocktail.cocktailName) var cocktails: [Cocktail]

    @Query(filter: #Predicate { $0.collectionName.contains("Williams")}, sort: \Cocktail.cocktailName) var williamsAndGrahamCocktials: [Cocktail]
    @Query(filter: #Predicate { $0.collectionName.contains("Milk")}, sort: \Cocktail.cocktailName) var milkAndHoneyCocktials: [Cocktail]
    @Query(filter: #Predicate { $0.collectionName.contains("Original")}, sort: \Cocktail.cocktailName) var originalCocktials: [Cocktail]
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        
        NavigationStack{
            
            VStack {
                HStack {
                    Text("Cocktails")
                        .font(.largeTitle).bold()
                        .padding(EdgeInsets(top: 0, leading: 12, bottom: -7, trailing: 0))
                    Spacer()
                    LoadSampleCocktailsButton()
                    
                }
                CocktailCollectionPicker(viewModel: viewModel, cocktailCollection: $cocktailCollection)
                
                GeometryReader { listGeo in
                    
                    ScrollView {
                        ScrollViewReader { value in
                            HStack {
                                List{
                                    switch cocktailCollection {
                                    case .all:
                                        AllCocktailsListView(cocktails: cocktails)
                                    case .williamsAndGraham:
                                        SpecifiedListView(viewModel: viewModel, cocktails: williamsAndGrahamCocktials)
                                    case .originals:
                                        SpecifiedListView(viewModel: viewModel, cocktails: originalCocktials)
                                    case .milkAndHoney:
                                        SpecifiedListView(viewModel: viewModel, cocktails: milkAndHoneyCocktials)
                                    case .custom:
                                        AllCocktailsListView(cocktails: cocktails)
                                    }
                                }
                                .listStyle(.plain)
                                .frame(width: listGeo.size.width * 0.9, height: listGeo.size.height)
                                VStack {

                                    ForEach(0..<viewModel.cocktailListAlphabet.count, id: \.self) { i in
                                        Button(action: {
                                            withAnimation {
                                                value.scrollTo(viewModel.cocktailListAlphabet[i], anchor: .top)
                                            }
                                        }, label: {
                                            if i == 0 {
                                                Image(systemName: viewModel.cocktailListAlphabet[i] )
                                                    .resizable()
                                                    .frame(width: 15, height: 15, alignment: .center)
                                                    .tint(viewModel.isShowingAllCocktails ? .white : .black)
                                                    .disabled(viewModel.isShowingAllCocktails ? true : false)
                                                    
                                            } else {
                                                Text("\(viewModel.cocktailListAlphabet[i])")
                                                    .font(.headline).bold()
                                                    .frame(width: 17, height: 13, alignment: .center)
                                            }
                                            
                                        })
                                        .buttonStyle(ScaleButtonStyle())
                                    }
                                }
                                .frame(width: listGeo.size.width * 0.1, height: listGeo.size.height)
                                .scaledToFit()
                                .offset(x: -10, y: 5)
                            }
                        }
                    }
                }
            }
            
        }
    }
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    return CocktailListView()
        .modelContainer(preview.container)
        
}
struct ScaleButtonStyle : ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.scaleEffect(configuration.isPressed ? 2.5 : 1)
            .shadow(radius: 30)
        
    }
}









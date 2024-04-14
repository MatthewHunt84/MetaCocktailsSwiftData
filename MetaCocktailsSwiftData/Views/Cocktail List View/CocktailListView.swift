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
    @Query(sort: \Cocktail.cocktailName) var cocktails: [Cocktail]
    @State private var cocktailListSearchText: String = ""
    @Query(filter: #Predicate { $0.collectionName.contains("Williams")}, sort: \Cocktail.cocktailName) var williamsAndGrahamCocktials: [Cocktail]
    @Query(filter: #Predicate { $0.collectionName.contains("Milk")}, sort: \Cocktail.cocktailName) var milkAndHoneyCocktials: [Cocktail]
    @Query(filter: #Predicate { $0.collectionName.contains("Original")}, sort: \Cocktail.cocktailName) var originalCocktials: [Cocktail]
    @Query(filter: #Predicate { $0.collectionName.contains("Death & Co.")}, sort: \Cocktail.cocktailName) var deathAndCoCocktails: [Cocktail]
    var filteredCocktails: [Cocktail] {
        if cocktailListSearchText == "" {
            return cocktails
        }
//        let filteredCocktails = cocktails.compactMap { cocktail in
//            let nameContainsQuery = cocktail.cocktailName.range(of: cocktailListSearchText, options: .literal) != nil
//            return nameContainsQuery ? cocktail : nil
//        }
        return cocktails.filter({ $0.cocktailName.localizedCaseInsensitiveContains(cocktailListSearchText)}).sorted(by: { $0.cocktailName < $1.cocktailName })

        //return filteredCocktails.sorted(by: { $0.cocktailName < $1.cocktailName })
    }
    
    var body: some View {
        
        NavigationStack{
            ZStack {
                VStack {
                    HStack {
                        Text("Cocktails")
                            .font(.largeTitle).bold()
                            .padding(EdgeInsets(top: 0, leading: 12, bottom: -7, trailing: 0))
                        Spacer()
                        LoadSampleCocktailsButton()
                    }
                    CocktailCollectionPicker(viewModel: viewModel, cocktailCollection: $viewModel.cocktailCollection)
                    
                    GeometryReader { listGeo in
                        
                        ScrollView {
                            ScrollViewReader { value in
                                HStack {
                                    List{
                                        switch viewModel.cocktailCollection {
                                        case .all:
                                            AllCocktailsListView(cocktails: filteredCocktails, cocktailListSearchText: $cocktailListSearchText)
                                        case .deathAndCo:
                                            SpecifiedListView(viewModel: viewModel, cocktails: deathAndCoCocktails )
                                        case .williamsAndGraham:
                                            SpecifiedListView(viewModel: viewModel, cocktails: williamsAndGrahamCocktials)
                                        case .originals:
                                            SpecifiedListView(viewModel: viewModel, cocktails: originalCocktials)
                                        case .milkAndHoney:
                                            SpecifiedListView(viewModel: viewModel, cocktails: milkAndHoneyCocktials)
                                        case .custom:
                                            AllCocktailsListView(cocktails: filteredCocktails, cocktailListSearchText: $cocktailListSearchText)
                                            
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
                                                    if viewModel.cocktailCollection == .all {
                                                        Image(systemName: viewModel.cocktailListAlphabet[i] )
                                                            .resizable()
                                                            .frame(width: 15, height: 15, alignment: .center)
                                                            .tint(.white)
                                                    }
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
                    if viewModel.cocktailCollection == .all || viewModel.cocktailCollection == .custom {
                        SearchBarView(searchText: $cocktailListSearchText)
                    }
                }
                if viewModel.isShowingOriginalCocktailInfo {
                    CustomAlertView(isActive: $viewModel.isShowingOriginalCocktailInfo,
                                    title: "These cocktails are OLD old.",
                                    message: viewModel.originalSpecExplanation,
                                    buttonTitle: "Heard, Chef") {}
                        .zIndex(1)
                    //zIndex is how the ZStack orders views. Without setting the zIndex to anything but 0, the animation won't transition out of view on the top of the stack.
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









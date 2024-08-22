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
    @State private var backgroundIsActive: Bool = false
    @Bindable var viewModel = CocktailListViewModel()
    @Query(sort: \Cocktail.cocktailName) var cocktails: [Cocktail]
    @Query(filter: #Predicate { $0.collectionName.contains("Williams")}, sort: \Cocktail.cocktailName) var williamsAndGrahamCocktials: [Cocktail]
    @Query(filter: #Predicate { $0.collectionName.contains("Milk")}, sort: \Cocktail.cocktailName) var milkAndHoneyCocktials: [Cocktail]
    @Query(filter: #Predicate { $0.collectionName.contains("Original")}, sort: \Cocktail.cocktailName) var originalCocktials: [Cocktail]
    @Query(filter: #Predicate { $0.collectionName.contains("Death & Co.")}, sort: \Cocktail.cocktailName) var deathAndCoCocktails: [Cocktail]
    
    var body: some View {
        
        NavigationStack{
            
            ZStack {
                
                MeshGradient(width: 3, height: 3, points: [
                    [0, 0], [0.5, 0], [1, 0],
                    [ 0 , 0.5], [0.5, 0.5], [1, 0.5],
                    [0 , 0.3], [backgroundIsActive ? 0.35 : 0.49 , backgroundIsActive ? 0.6 : 0.62], [1 , 1]
                ], colors: [
                    .black, .black,.black,
                    .black, .black, .black,
                    .brandSecondaryBlue, .brandSecondaryBlue, .brandSecondaryBlue
                ]).ignoresSafeArea()
                    .onAppear{
                        withAnimation(.easeInOut(duration: 3)) {
                            backgroundIsActive.toggle()
                        }
                    }
                
                VStack {
                    Text("Cocktail List")
                        .font(.custom("AvenirNext-Regular", size: 24)).bold()
                       
                    CocktailCollectionPicker(viewModel: viewModel, cocktailCollection: $viewModel.cocktailCollection)
                    
                    GeometryReader { listGeo in
                        
                        ScrollView {
                            ScrollViewReader { value in
                                HStack {
                                    List{
                                        switch viewModel.cocktailCollection {
                                        case .all:
                                            AllCocktailsListView(cocktails: cocktails)
                                        case .deathAndCo:
                                            SpecifiedListView(viewModel: viewModel, cocktails: deathAndCoCocktails )
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
                                                    if viewModel.cocktailCollection == .all {
                                                        Image(systemName: viewModel.cocktailListAlphabet[i] )
                                                            .resizable()
                                                            .frame(width: 15, height: 15, alignment: .center)
                                                            .tint(.white)
                                                           // .foregroundStyle(backgroundIsActive ? .white : .brandSecondaryBlue)
                                                       
                                                    }
                                                } else {
                                                    Text("\(viewModel.cocktailListAlphabet[i])")
                                                        .font(.headline).bold()
                                                        .frame(width: 17, height: 13, alignment: .center)
                                                        .tint(.white)
                                                        //.foregroundStyle(backgroundIsActive ? .white : .brandSecondaryBlue)
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
                if viewModel.isShowingOriginalCocktailInfo {
                    CustomAlertView(isActive: $viewModel.isShowingOriginalCocktailInfo,
                                    title: "These cocktails are OLD old.",
                                    message: viewModel.originalSpecExplanation,
                                    buttonTitle: "Heard, Chef") {}
                        .zIndex(1)
                    //zIndex is how the ZStack orders views. Without setting the zIndex to anything but 0, the animation won't transition out of view on the top of the stack.
                }
            }
            
            .navigationBarTitleDisplayMode(.inline)
            //.goldHeader("All Cocktails")
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









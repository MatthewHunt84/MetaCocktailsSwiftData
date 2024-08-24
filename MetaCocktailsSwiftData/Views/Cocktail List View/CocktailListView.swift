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
    
    
    var body: some View {
        
        NavigationStack{
            
            ZStack {
                
                MeshGradients.meshBlueTwoRibbonBackground.ignoresSafeArea()
                MeshGradients.meshTealRibbonBackground.ignoresSafeArea()
                
            
                VStack {
                    FontFactory.regularText("Cocktail List", size: 30)

                    GeometryReader { listGeo in
                        
                        ScrollView {
                            ScrollViewReader { value in
                                HStack {
                                    List{
                                        AllCocktailsListView(cocktails: cocktails)
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
                                                    FontFactory.regularText(viewModel.cocktailListAlphabet[i], size: 13, isBold: true)
                                                        .frame(width: 17, height: 13, alignment: .center)
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









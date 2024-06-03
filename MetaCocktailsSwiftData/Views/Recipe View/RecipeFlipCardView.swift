//
//  RecipeFlipCardView.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 5/1/24.
//

import SwiftUI

struct RecipeFlipCardView: View {
    @State private var isShowingFloatingPrompt = false
    @EnvironmentObject var cBCViewModel: CBCViewModel
    @Bindable var viewModel: RecipeViewModel
    let geo: GeometryProxy // seems like a constant
    var topID: Namespace.ID // isn't going to change, but is it bound?
    var scrollReader: ScrollViewProxy // no idea, but also needs to be bound I'm guessing.
    
    var body: some View {
        
        ZStack {
            
            RecipeViewBack(viewModel: viewModel, geometry: geo)
                .rotation3DEffect(Angle(degrees: viewModel.backDegree), axis: (x: 0, y: 1, z: 0))
                .id(topID)
            
            VStack(alignment: .center) {
                
                ZStack() {
                    
                    Border()
                        .frame(minHeight: geo.size.height)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        
                        GlasswareView(cocktail: viewModel.cocktail)
                        
                        SpecView(cocktail: viewModel.cocktail, isShowingPrompt: $isShowingFloatingPrompt)
                        
                        GarnishView(cocktail: viewModel.cocktail)
                        
                        MethodIceView(cocktail: viewModel.cocktail, methodText: viewModel.methodString)
                        
                        if viewModel.cocktail.buildOrder != nil {
                            
                            Button("Build Order") {
                                viewModel.flipCard()
                                withAnimation(.easeOut(duration: viewModel.durationAndDelay)) {
                                    scrollReader.scrollTo(topID, anchor: .top)
                                }
                            }
                            .buttonStyle(.custom)
                            .tint(.blueTint)
                            .disabled(viewModel.isFlipped)
                        }
                        
                        if viewModel.cocktail.author != nil {
                            AuthorView(cocktail: viewModel.cocktail)
                                .frame(maxWidth: .infinity, alignment: .center)
                            
                        }
                    }
                    .padding(.top, 50)
                    .padding(.bottom, 70)
                    .frame(width: geo.size.width * 0.75)
                }
                
            }
            .onAppear {
                print("View model cocktail is \(viewModel.cocktail.cocktailName)")
                cBCViewModel.chosenCocktail = viewModel.cocktail
            }
            .frame(minHeight: geo.size.height)
            .rotation3DEffect(Angle(degrees: viewModel.frontDegree), axis: (x: 0, y: 1, z: 0))
            
            backToRecipeViewButton(viewModel: viewModel)
            
            if isShowingFloatingPrompt {
                
                FloatingPromptView(isActive: $isShowingFloatingPrompt)
            }
        }
        
    }
}

//#Preview {
//    RecipeFlipCardView(viewModel: RecipeViewModel(cocktail: ramonaFlowers))
//}

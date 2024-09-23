//
//  RecipeFlipCardView.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 5/1/24.
//

import SwiftUI

struct RecipeFlipCardView: View {
    @State private var isShowingCocktailNotes = false
    @EnvironmentObject var cBCViewModel: CBCViewModel
    @Bindable var viewModel: RecipeViewModel
    let geo: GeometryProxy // seems like a constant
    var topID: Namespace.ID // isn't going to change, but is it bound?
    var scrollReader: ScrollViewProxy // no idea, but also needs to be bound I'm guessing.
    
    var body: some View {
        
        ZStack {
            
            RecipeViewBack(viewModel: viewModel, geometry: geo)
                .rotation3DEffect(Angle(degrees: viewModel.backDegree), axis: (x: 0, y: 1, z: 0), anchor: .center)
                .id(topID)
            
            VStack(alignment: .center) {
                
                ZStack() {
                    
                    Border()
                        .frame(minHeight: geo.size.height)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        
                        GlasswareView(cocktail: viewModel.cocktail)
                        
                        SpecView(cocktail: viewModel.cocktail, viewModel: viewModel, isShowingCocktailNotes: $isShowingCocktailNotes, geo: geo, topID: topID, scrollReader: scrollReader)
                        
                        GarnishView(cocktail: viewModel.cocktail)
                        
                        MethodIceView(cocktail: viewModel.cocktail, methodText: viewModel.methodString)
                        
                        if viewModel.cocktail.buildOrder != nil {
                            UniversalBlueButton(buttonText: "Build Order", rightImage: nil, leftImage: nil, includeBorder: true) {
                                viewModel.flipCard()
                                withAnimation(.easeOut(duration: viewModel.durationAndDelay)) {
                                    scrollReader.scrollTo(topID, anchor: .top)
                                }
                            }
                            .disabled(viewModel.isFlipped)
                        }
                        
                        if viewModel.cocktail.author != nil {
                            AuthorView(cocktail: viewModel.cocktail)
                                .frame(maxWidth: .infinity, alignment: .center)
                            
                        }
                        
                        Spacer()
                        
                        HStack {
                            Spacer()
                            FavoriteButton(for: viewModel.cocktail)
                        }
                    }
                    .padding(.top, 50)
                    .padding(.bottom, 70)
                    .frame(width: geo.size.width * 0.75)
                    
                }
            }
            .onAppear {
                cBCViewModel.chosenCocktail = viewModel.cocktail
            }
            .frame(minHeight: geo.size.height)
            .rotation3DEffect(Angle(degrees: viewModel.frontDegree), axis: (x: 0, y: 1, z: 0))
            .padding(.top, -20)
            
            backToRecipeViewButton(viewModel: viewModel)
            
            if isShowingCocktailNotes{
                if let notes = viewModel.cocktail.notes {
                    CustomAlertView(isActive: $isShowingCocktailNotes, title: "Note:", message: notes , buttonTitle: "Heard, chef.") {}
                        .zIndex(1)
                }
            }
            
        }
    }
}

//#Preview {
//    RecipeFlipCardView(viewModel: RecipeViewModel(cocktail: ramonaFlowers))
//}

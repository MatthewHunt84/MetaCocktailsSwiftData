//
//  RecipeBackView.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/27/24.
//

import SwiftUI

struct RecipeViewBack: View {
    var viewModel: RecipeViewModel
    var parentGeo: GeometryProxy
    @State var secondaryBackgroundColor = Color.brandPrimaryGold
    
    var body: some View {
        
        ZStack {
            
            BackgroundGlowAnimation(color: .blue)
            
            Border(height: parentGeo.size.height, color: $secondaryBackgroundColor)
            
            ScrollView {
                
                if viewModel.isShowingIngredientRecipe {
                    IngredientRecipeView(prep: viewModel.currentIngredientRecipe, viewModel: viewModel)
                        .padding()

                } else if let buildOrder = viewModel.cocktail.buildOrder {
                    BuildOrderView(buildOrder: buildOrder, viewModel: viewModel)
                        .padding()
                }
            }
            .scrollIndicators(.hidden)
            .frame(width: parentGeo.size.width * 0.88, height: viewModel.contentSize(for: parentGeo.size.height))
            .allowsHitTesting(viewModel.isFlipped)
        }
        
        .opacity(viewModel.frontDegree == 90.0 ? 1 : 0)
        .rotation3DEffect(
            Angle(degrees: viewModel.backDegree),
            axis: (x: 0, y: 1, z: 0)
        )
    }
}

struct BuildOrderView: View {
    
    let buildOrder: Build
    var viewModel: RecipeViewModel
    
    var body: some View {
        
        VStack(alignment: .leading) {

            Grid(horizontalSpacing: 1) {
                
                GridRow {
                    
                    Button(action: {
                        viewModel.flipCard()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                            viewModel.isShowingIngredientRecipe = false
                        }
                    }) {
                        Image(systemName: "arrow.triangle.2.circlepath")
                            .foregroundColor(ColorScheme.interactionTint)
                            .font(.system(size: 22))
                            .contentShape(Rectangle())
                    }
                    .frame(width: 50, height: 50)
                    .gridColumnAlignment(.leading)
                    
                    Text("Build Order")
                        .font(FontFactory.mediumFont(size: 18).bold())
                        .gridColumnAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                    
                    Color.clear
                        .gridColumnAlignment(.trailing)
                        .frame(width: 50, height: 50)
                }
            }
            .padding(.bottom, buildOrder.instructions.contains(where: { $0.step == 0}) ? 0 : 16)
            
            if buildOrder.instructions.contains(where: { $0.step == 0}) {
                Text(buildOrder.instructions.first!.method)
                    .font(FontFactory.italicFont(size: 14))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
            }
            
            ForEach(buildOrder.instructions) { build in
                if build.step > 0 {
                    HStack(alignment: .top) {
                        Text("\(build.step).")
                            .font(FontFactory.mediumFont(size: 14))
                            .bold()
                        Text("\(build.method)")
                            .font(FontFactory.mediumFont(size: 14))
                    }
                    .listRowBackground(Color.darkGrey)
                    Divider()
                }
            }
            
            Spacer()
        }
    }
}

struct IngredientRecipeView: View {
    
    let prep: Prep
    var viewModel: RecipeViewModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Grid(horizontalSpacing: 1) {
                
                GridRow {
                    
                    Button(action: {
                        viewModel.flipCard()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                            viewModel.isShowingIngredientRecipe = false
                        }
                    }) {
                        Image(systemName: "arrow.triangle.2.circlepath")
                            .foregroundColor(ColorScheme.interactionTint)
                            .font(.system(size: 22))
                            .contentShape(Rectangle())
                    }
                    .frame(width: 50, height: 50)
                    .gridColumnAlignment(.leading)
                    
                    Text("\(prep.prepIngredientName) recipe")
                        .font(FontFactory.mediumFont(size: 18).bold())
                        .gridColumnAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                    
                    Color.clear
                        .gridColumnAlignment(.trailing)
                        .frame(width: 50, height: 50)
                }
            }
            .padding(.bottom, 15)
            
            ForEach(prep.prepRecipe) { build in
                HStack(alignment: .top) {
                    Text("\(build.step).")
                        .font(FontFactory.mediumFont(size: 14))
                        .bold()
                        
                    Text("\(build.method)")
                        .font(FontFactory.mediumFont(size: 14))
                }
                .foregroundStyle(.primary)
                .listRowBackground(Color.darkGrey)
                
                Divider()
            }

            Spacer()
        }
    }
}

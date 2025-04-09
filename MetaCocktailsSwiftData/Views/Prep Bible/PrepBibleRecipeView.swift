//
//  PrepBibleRecipeView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 4/8/25.
//


//
//  PrepBibleRecipeView.swift
//  MetaCocktails
//
//  Created on 4/8/25.
//

import SwiftUI
import SwiftData 

struct PrepBibleRecipeView: View {
    let prep: Prep
    @Environment(\.dismiss) private var dismiss
    @State private var borderColor = ColorScheme.presentedFrontBorder
    
    var body: some View {
        NavigationStack {
            ZStack {
                ColorScheme.background
                    .ignoresSafeArea()
                
                GeometryReader { outerGeo in
                    ZStack {
                        BackgroundGlowAnimation(gradient: borderColor.top, isFavorite: .constant(false))
                        
                        VStack(alignment: .leading, spacing: 15) {
                            
                            HStack {
                                Button(action: {
                                    dismiss()
                                }) {
                                    Image(systemName: "chevron.backward")
                                        .font(.system(size: 20))
                                        .foregroundStyle(ColorScheme.interactionTint)
                                }
                                
                                Spacer()
                                
                                Text("\(prep.prepIngredientName) recipe")
                                    .font(FontFactory.recipeCardHeader18B)
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                Color.clear
                                    .frame(width: 24, height: 24)
                            }
                            .padding(.bottom, 20)
                            
                            ScrollView {
                                ForEach(prep.prepRecipe) { instruction in
                                    HStack(alignment: .top) {
                                        Text("\(instruction.step).")
                                            .font(FontFactory.mediumFont(size: 16))
                                            .bold()
                                        
                                        Text(instruction.method)
                                            .font(FontFactory.mediumFont(size: 16))
                                    }
                                    .foregroundStyle(.primary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.trailing, 10)
                                    
                                    Divider()
                                    
                                }
                            }
                            
                            
                            Spacer()
                        }
                        .padding(20)
                        .background(BlackGlassBackgroundView())
                        .frame(width: outerGeo.size.width * 0.88, height: outerGeo.contentSize(for: outerGeo.size.height))
                        
                        Border(height: outerGeo.size.height, gradient: $borderColor)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }
}


extension GeometryProxy {
    func contentSize(for height: CGFloat) -> CGFloat {
        switch height {
        case 0..<650:
            return height * 0.896
        case 651..<672:
            return height * 0.90
        default:
            return height * 0.91
        }
    }
}


#Preview {
    NavigationStack {
        PrepBibleRecipeView(prep: PrepBible.gingerSyrup)
    }
}

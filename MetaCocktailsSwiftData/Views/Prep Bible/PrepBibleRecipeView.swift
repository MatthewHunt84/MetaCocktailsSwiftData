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
        ZStack {
            ColorScheme.background
                .ignoresSafeArea()
            
            GeometryReader { outerGeo in
                ZStack {
                    BackgroundGlowAnimation(gradient: borderColor.top, isFavorite: .constant(false))
                    
                    VStack(alignment: .leading, spacing: 15) {
                        // Header with back button
                        HStack {
                            Button(action: {
                                dismiss()
                            }) {
                                Image(systemName: "chevron.backward")
                                    .font(.system(size: 24))
                                    .foregroundStyle(ColorScheme.interactionTint)
                            }
                            
                            Spacer()
                            
                            Text(prep.prepIngredientName)
                                .font(FontFactory.recipeCardHeader18B)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            // Empty space to balance the back button
                            Color.clear
                                .frame(width: 24, height: 24)
                        }
                        .padding(.bottom, 20)
                        
                        // Recipe instructions
                        ScrollView {
                            ForEach(prep.prepRecipe) { instruction in
                                HStack(alignment: .top) {
                                    Text("\(instruction.step).")
                                        .font(FontFactory.mediumFont(size: 16))
                                        .bold()
                                    
                                    Text(instruction.method)
                                        .font(FontFactory.mediumFont(size: 16))
                                }
                                
                                if instruction.step < prep.prepRecipe.last!.step {
                                    Divider()
                                }
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
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Extension to match the content sizing from RecipeViewModel
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

// Preview struct
struct PreviewPrep {
    static let ginger = Prep(
        prepIngredientName: "Ginger syrup",
        prepRecipe: [
            Instruction(step: 1, method: "This requires juicing fresh ginger, which can be a strain on household juicers."),
            Instruction(step: 2, method: "Add equal parts fresh ginger juice and sugar to a pot and bring to a boil while stirring. Some prefer Demerara sugar for a darker and more robust flavor. You can use plain white sugar for a brighter and sharper flavor. The Williams and Graham method is to add black pepper and lemon juice in small proportions (highly recommend)."),
            Instruction(step: 3, method: "Take off heat immediately after boiling and let cool."),
            Instruction(step: 4, method: "Add 1oz(30ml) vodka to every 750ml of syrup to stabilize.")
        ]
    )
}

#Preview {
    NavigationStack {
        PrepBibleRecipeView(prep: PreviewPrep.ginger)
    }
}

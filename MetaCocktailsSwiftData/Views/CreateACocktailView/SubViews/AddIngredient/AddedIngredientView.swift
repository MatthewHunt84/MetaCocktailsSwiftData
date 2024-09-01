//
//  AddedIngredientView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/10/24.
//

import SwiftUI


struct AddedIngredientView: View {
   
    @Bindable var viewModel: AddCocktailViewModel
    @Binding var isShowingAddIngredients: Bool
    @Binding var isRiff: Bool
    
    
    var body: some View {
        
        Section(header: Text("Ingredients").font(FontFactory.sectionHeader12)) {
            
            List{
                if isRiff && !viewModel.addedIngredients.isEmpty {
                    SwipeToDeleteHint()
                        .padding(.horizontal)
                        .transition(.opacity)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                                withAnimation {
                                    isRiff = false
                                }
                            }
                        }
                }
                ForEach(viewModel.addedIngredients, id: \.ingredientBase.name) { ingredient in
                    Text("\(NSNumber(value: ingredient.value)) \(ingredient.unit.rawValue) \(ingredient.ingredientBase.name)")
                        .font(FontFactory.fontBody16)
                }
                .onDelete(perform: { indexSet in
                    viewModel.addedIngredients.remove(atOffsets: indexSet)
                })
            }
            Button {
                viewModel.toggleShowIngredientView()
            } label: {
                HStack{
                    Text(viewModel.addedIngredients.count < 1 ? "Add Ingredient" : "Add another ingredient")
                        .tint(viewModel.addedIngredients.count < 1 ? .white : .secondary)
                        .font(FontFactory.formLabel18)
                    Spacer()
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(.blueTint)
                }
            }
        }
    }
}
#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    
    AddedIngredientView(viewModel: AddCocktailViewModel(), isShowingAddIngredients: .constant(true), isRiff: .constant(true))
        .modelContainer(preview.container)
    
}

struct SwipeToDeleteHint: View {
    @State private var offset: CGFloat = 0
    
    var body: some View {
        HStack {
            Text("Swipe to delete")
                .font(FontFactory.fontBody16)
                .foregroundColor(.white)
            Image(systemName: "arrow.left")
                .foregroundColor(.red)
        }
        .padding(5)
        .background(Color.brandSecondaryRed.opacity(0.3))
        .cornerRadius(8)
        .offset(x: offset)
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                offset = -30
            }
        }
    }
}

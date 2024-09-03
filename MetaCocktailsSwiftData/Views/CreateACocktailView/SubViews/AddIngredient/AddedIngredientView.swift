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
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        
        Section(header: Text("Ingredients").font(FontFactory.sectionHeader12)) {
            List {
                ForEach(viewModel.addedIngredients, id: \.id) { ingredient in
                    Text("\(NSNumber(value: ingredient.value)) \(ingredient.unit.rawValue) \(ingredient.ingredientBase.name)")
                        .font(FontFactory.fontBody16)
                }
                .onDelete { indexSet in
                    withAnimation {
                        viewModel.addedIngredients.remove(atOffsets: indexSet)
                    }
                }
            }
            
            if viewModel.isRiff && !viewModel.addedIngredients.isEmpty {
                SwipeToDeleteHint()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                viewModel.isRiff = false
                            }
                        }
                    }
            }
            
            Button {
                isShowingAddIngredients.toggle()
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
    
    AddedIngredientView(viewModel: AddCocktailViewModel(), isShowingAddIngredients: .constant(true))
        .modelContainer(preview.container)
    
}

struct SwipeToDeleteHint: View {
    @State private var offset: CGFloat = 30
    
    var body: some View {
        HStack {
            Text("Swipe to delete")
                .font(FontFactory.fontBody16)
                .foregroundColor(.white)
            Image(systemName: "arrowshape.left.fill")
                .foregroundColor(.white)
        }
        .padding(5)
        .background(.red)
        .cornerRadius(8)
        .offset(x: offset)
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 0.75).repeatForever(autoreverses: true)) {
                offset = 0
            }
        }
    }
}

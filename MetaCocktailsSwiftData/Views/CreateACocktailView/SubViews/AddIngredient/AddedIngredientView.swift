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
    @Binding var isShowingCustomIngredientView: Bool 
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        
        Section(header: Text("Ingredients").font(FontFactory.sectionHeader12)) {
            List {
                ForEach(viewModel.addedIngredients, id: \.id) { ingredient in

                    pluralizedIngredientText(for: ingredient)
                        .font(FontFactory.fontBody16)
                        .swipeActions(edge: .trailing) {
                            Button(role: .none) {
                                withAnimation {
                                    viewModel.removeIngredient(ingredient)
                                }
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                            .tint(.red)
                        }
                        .onTapGesture(perform: {
                            if ingredient.ingredientBase.isCustom {
                                withAnimation {
                                    viewModel.removeIngredient(ingredient)
                                }
                                viewModel.populateCustomIngredient(ingredient: ingredient)
                                isShowingCustomIngredientView.toggle()
                            } else {
                                withAnimation {
                                    viewModel.removeIngredient(ingredient)
                                }
                                viewModel.populateExistingIngredient(ingredient: ingredient)
                                isShowingAddIngredients.toggle()
                            }
                        })
                }
            }
            if viewModel.isRiff && !viewModel.addedIngredients.isEmpty {
                SwipeToEditHintView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
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
    
    AddedIngredientView(viewModel: AddCocktailViewModel(), isShowingAddIngredients: .constant(true), isShowingCustomIngredientView: .constant(true))
        .modelContainer(preview.container)
    
}

struct SwipeToEditHintView: View {
    @State private var offsetDelete: CGFloat = 0
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                HStack {
                    Spacer()
                    HStack {
                        Image(systemName: "arrowshape.left.fill")
                            .foregroundColor(.white)
                        Text("Swipe to delete")
                            .font(FontFactory.fontBody16)
                            .foregroundColor(.white)
                    }
                    .padding(5)
                    .background(.red)
                    .cornerRadius(8)
                    .offset(x: geometry.size.width / 2 - offsetDelete)
                }
            }
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 1.75).repeatForever(autoreverses: true)) {
                    offsetDelete = geometry.size.width / 2
                }
            }
        }
    }
}

extension AddCocktailViewModel {
    func removeIngredient(_ ingredient: Ingredient) {
        if let index = addedIngredients.firstIndex(where: { $0.id == ingredient.id }) {
            addedIngredients.remove(at: index)
        }
    }
}

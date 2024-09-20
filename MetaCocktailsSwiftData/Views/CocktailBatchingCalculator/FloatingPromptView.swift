//
//  FloatingPromptView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 5/4/24.
//

import SwiftUI

struct FloatingPromptView: View {
    @Binding var isActive: Bool
    @EnvironmentObject var viewModel: CBCViewModel
    @FocusState private var cocktailNumberFocus: Bool
    
    @State private var offset: CGFloat = 1000
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.black)
                    .opacity(0.5)
                    .onTapGesture {
                        close()
                    }
                    
                
                VStack {
                    
                    
                    Text("Number of cocktails to batch:")
                        .font(FontFactory.recipeCardHeader18B)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.brandPrimaryGold)
                    
                        
                    
                    TextField("Amount", value: $viewModel.numberOfCocktailsText, formatter: viewModel.formatter)
                        .font(FontFactory.formLabel18)
                        .padding(8)
                        .autocorrectionDisabled()
                        .background(Color(UIColor.systemGray5))
                        .cornerRadius(12)
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 0, maxWidth: 200)
                        .keyboardType(.numberPad)
                        .focused($cocktailNumberFocus)
                        
                    FontFactory.regularText("You can always modify this later.", size: 16)
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                    
                    
                    
                    
                    HStack {
                        Button(action: {
                            close()
                        }) {
                            Text("Cancel")
                                .font(FontFactory.fontBody16)
                                .foregroundStyle(.blueTint)
                                .padding()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.white, lineWidth: 1)
                                )
                        }
                        
                        NavigationLink {
                            CBCLoadedCocktailView()
                        } label: {
                            Text("Batch")
                                .font(FontFactory.fontBody16)
                                .foregroundStyle(.blueTint)
                                .padding()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.white, lineWidth: 1)
                                )
                        }
                        .simultaneousGesture(TapGesture().onEnded {
                            viewModel.convertIngredientsToBatchCellData()
                        })
                    }
                    .padding(.horizontal)
                }
                
                //.fixedSize(horizontal: false, vertical: true)
                .frame(width: 300, height: 190, alignment: .center)
                .padding()
                .background(Color(uiColor: .secondarySystemGroupedBackground))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 2)
                )
                .offset(x: 0, y: offset)
                .onAppear {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        offset = -150
                    }
                }
                .task {
                    cocktailNumberFocus = true
                    viewModel.convertLoadedCocktail(for: viewModel.chosenCocktail)
                }
                
            }
        }
        .ignoresSafeArea()
    }
    
    func close() {
        withAnimation(.easeInOut(duration: 0.2)) {
            offset = 1000
            isActive = false
        }
    }
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    return FloatingPromptView(isActive: .constant(true))
    .environmentObject(CBCViewModel())
    .modelContainer(preview.container)
    
}


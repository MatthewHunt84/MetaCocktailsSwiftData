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
        NavigationStack{
            ZStack {
                Color(.black)
                    .opacity(0.1)
                    .onTapGesture {
                        close()
                    }
            
                    
                    VStack {
                        Text("Number of Cocktails:")
                            .font(.custom("AvenirNext-Regular", size: 24))
                            .bold()
                            .padding()
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)
                        TextField("Amount", value: $viewModel.numberOfCocktailsText, formatter: viewModel.formatter)
                            .font(.custom("AvenirNext-Regular", size: 20))
                            .padding(5)
                            .autocorrectionDisabled()
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(10)
                            .multilineTextAlignment(.center)
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .keyboardType(.numberPad)
                            .focused($cocktailNumberFocus)
                        
                        Text("*You can modify this later.")
                            .font(.custom("AvenirNext-Regular", size: 16))
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)
                        
                        NavigationLink {
                            CBCLoadedCocktailView()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundStyle(.blueTint)
                                Text("Batch")
                                    .font(.custom("AvenirNext-Regular", size: 16)).bold()
                                    .foregroundStyle(.white)
                                    .padding()
                                
                            }
                            .padding()
                        }.simultaneousGesture(TapGesture().onEnded {
                            viewModel.convertIngredientsToBatchCellData()
                        })
                   
            }
                .fixedSize(horizontal: false, vertical: true)
                .padding()
                .background(.black)
                .background(MeshGradients.meshRedRibbonBackground)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay {
                    VStack{
                        HStack {
                            Spacer()
                            Button {
                                close()
                            } label: {
                                Image(systemName: "x.circle.fill")
                                    .font(.title2)
                                    .fontWeight(.medium)
                                    .tint(.blueTint)
                            }
                            .tint(.white)
                        }
                        Spacer()
                    }
                    .padding()
                }
                
                .padding(30)
                .offset(x: 0, y: offset)
                .onAppear {
                    withAnimation(.easeInOut.speed(0.75)) {
                        offset = -50
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
        withAnimation((.easeInOut.speed(0.75))) {
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

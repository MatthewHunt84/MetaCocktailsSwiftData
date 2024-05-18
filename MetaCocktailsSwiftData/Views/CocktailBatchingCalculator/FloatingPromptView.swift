//
//  FloatingPromptView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 5/4/24.
//

import SwiftUI

struct FloatingPromptView: View {
    @Binding var isActive: Bool
    @ObservedObject var viewModel = CBCViewModel()
    @FocusState private var cocktailNumberFocus: Bool
    var viewModelCocktail: Cocktail
   
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
                    Text("Number of Cocktails?")
                        .font(.title2)
                        .bold()
                        .padding()
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                    TextField("Amount", value: $viewModel.numberOfCocktailsText, formatter: viewModel.formatter).cBCTextField()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .keyboardType(.numberPad)
                        .focused($cocktailNumberFocus)
                    
                    Text("You can always change this later")
                        .font(.body)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                    
                    NavigationLink {
                        CBCLoadedCocktailView(viewModel: viewModel, cocktail: viewModelCocktail)
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.brandPrimaryGold)
                            Text("Batch")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.black)
                                .padding()
                        }
                        .padding()
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                .padding()
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: .white, radius: 5)
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
                                    .tint(.brandPrimaryGold)
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
    return FloatingPromptView(isActive: .constant(true), viewModelCocktail: aFlightSouthOfTheBorder)
    .environmentObject(CBCViewModel())
    .modelContainer(preview.container)
    
}

//
//  BatchButton .swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/13/24.
//

import SwiftUI

struct BatchButton: View {
    
    var cocktail: Cocktail
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .circular)
                .fill(Color.black)
                .frame(width: 150, height: 120, alignment: .center)
                .shadow(color: Color(UIColor.systemGray), radius: 4, x: 0, y: 0)
                .overlay(RoundedRectangle(cornerRadius: 20, style: .circular).stroke(.gray.gradient, lineWidth: 2))
                .offset(x: 0, y: 10)
            
            VStack {
                NavigationLink{
                   //CBCLoadedCocktailView(viewModel: <#T##Binding<CBCViewModel>#>, numberOfCocktails: <#T##Binding<Double>#>)
                } label: {
                    ZStack {
                        VStack{
                            Image("batchBottles", label: Text("Batch"))
                                .resizable()
                            Text("B  A  T  C  H")
                                .foregroundStyle(.white)
                                .dynamicTypeSize(.large)
                        }
                        .frame(width: 125, height: 125, alignment: .center)
                        

                    }
                }
            }
        }
    }
}

#Preview {
    BatchButton(cocktail: DummyCocktails.shared.cocktail)
}

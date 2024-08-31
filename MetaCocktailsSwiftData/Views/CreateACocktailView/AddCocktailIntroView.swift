//
//  AddCocktailIntroView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 8/31/24.
//


import SwiftUI

struct AddCocktailIntroView: View {
    @Bindable var viewModel = AddCocktailViewModel()
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                
                VStack {
                    NavigationLink(destination: AddCocktailView(viewModel: viewModel).navigationBarBackButtonHidden(true)) {
                        UpperDiagonalButton(
                            text: "Create A New Cocktail",
                            isUpperHalf: true
                        )
                    }
                    
                    NavigationLink(destination: RiffPickerView(viewModel: viewModel).navigationBarBackButtonHidden(true)) {
                        BottomDiagonalButton(
                            text: "Riff On An Existing Cocktail",
                            isUpperHalf: false
                        )
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
        }
    }
}

struct UpperDiagonalButton: View {
    let text: String
    let isUpperHalf: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Path { path in
                    path.move(to: .zero)
                        path.addLine(to: CGPoint(x: geometry.size.width + 200, y: 0))
                        path.addLine(to: CGPoint(x: 0, y: geometry.size.height + 200))
                 
                }
                .fill(Color.blueTint.opacity(0.1))
                
                Text(text)
                    .font(FontFactory.bottomToolbarButton20)
                    .foregroundStyle(.white)
                    .lineLimit(1)
                    .rotationEffect(.degrees(-45))
                    .position(
                        x: geometry.size.width * 0.75,
                        y: geometry.size.height * 0.65
                    )
            }
        }
    }
}
struct BottomDiagonalButton: View {
    let text: String
    let isUpperHalf: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Path { path in
                    
                    path.move(to: CGPoint(x: geometry.size.width, y: -200))
                    path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height))
                    path.addLine(to: CGPoint(x: -200, y: geometry.size.height))
                    
                    path.closeSubpath()
                }
                .fill(Color.blueTint.opacity(0.2))
                
                Text(text)
                    .font(FontFactory.bottomToolbarButton20)
                    .foregroundStyle(.white)
                    .lineLimit(1)
                    .rotationEffect(.degrees(-45))
                    .position(
                        x: geometry.size.width * 0.30,
                        y: geometry.size.height * 0.30
                    )
            }
        }
    }
}
#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    AddCocktailIntroView()
        .modelContainer(preview.container)
        
}

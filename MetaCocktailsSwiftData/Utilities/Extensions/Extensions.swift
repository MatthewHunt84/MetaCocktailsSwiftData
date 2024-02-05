//
//  Extensions.swift
//  MetaCocktails
//
//  Created by James on 8/15/23.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
struct whiteButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
        .background(Color(UIColor.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 40))
        .shadow(color: Color(UIColor.systemGray), radius: 2, x: 0, y: 0)
        .foregroundColor(Color(UIColor.systemCyan))
        
    }
}

struct noStyleButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(Color(UIColor.systemCyan))
    }
}



var wNGSpecString = "(Williams & Graham Spec.)"


struct circleButton: View {
    @GestureState var tap = false
    @State var press = false
    @EnvironmentObject var viewModel: SearchCriteriaViewModel
    
    var body: some View {
        ZStack {
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .opacity(press ? 0 : 1)
              
                
//
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(Rectangle().offset(y: tap ? 0 : 50))
                .foregroundStyle(Color.red)
            
//            Text("Cleared")
//                .font(.system(size: 16, weight: .light))
//                .foregroundStyle(.brandPrimaryRed)
//                .opacity(press ? 1 : 0)
//                .scaleEffect(press ? 1 : 0)
        }
        .frame(width: 70, height: 70)
        .background(
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(press ? Color.gray : Color.white ), Color(press ? Color.white : Color.gray)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                
                Circle()
                    .stroke(Color.clear, lineWidth: 10)
                    .shadow(color: Color(press ? Color.white : Color.gray), radius: 3, x: -5, y: -5)
                
                Circle()
                    .stroke(Color.clear, lineWidth: 10)
                    .shadow(color: Color(press ? Color.gray : Color.white), radius: 3, x: 3, y: 3)
            }
        )
        .clipShape(Circle())
        .overlay (
        Circle()
            .trim(from: tap ? 0.001 : 1, to: 1)
            .stroke(Color.red, style: StrokeStyle(lineWidth: 5, lineCap: .round))
            .frame(width: 88, height: 88)
            .rotationEffect(Angle(degrees: 90))
            .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
            
            
        )
        
        //.shadow(color: Color(press ? Color(UIColor.systemGray4) : Color(UIColor.systemGray2)), radius: 20, x: -20, y: -20)
        //.shadow(color: Color(press ? Color.white : Color.gray), radius: 20, x: 20, y: 20)
        //.scaleEffect(tap ? 1.2 : 1)
        .gesture(LongPressGesture().updating($tap) { currentState, gestureState, transaction in
            gestureState = currentState
            
        }
            .onEnded { value in
                self.press.toggle()
                
            }
        
        )
        .onLongPressGesture(minimumDuration: 1.2) {
            for i in 0..<viewModel.cocktailComponents.count {
                viewModel.cocktailComponents[i].isPreferred = false
                viewModel.cocktailComponents[i].isUnwanted = false
                viewModel.enableMultipleSpiritSelection = false
                
            }
        }
    }
    
}

struct searchButtonView: View {
    @EnvironmentObject var viewModel: SearchCriteriaViewModel
    
    var body: some View {
        HStack{
     
            
            NavigationLink {
                
                SearchResultsView(viewModel: viewModel)
                
            } label: {
                Image(systemName: "magnifyingglass")
                    .font(.headline).bold()
                    .padding(20)
                    .background(viewModel.selectedPreferredIngredients().count == 0 ? Color(UIColor.black) : Color.brandPrimaryGreen.opacity(0.8))
                    .clipShape(Circle())
                    .shadow(color: Color(UIColor.systemGray), radius: 4)
                    .foregroundColor(viewModel.selectedPreferredIngredients().count == 0 ? Color(UIColor.systemGray) : Color.white)
                
                
            }
            .offset(x: 16)
            Button(action: {
                for i in 0..<viewModel.cocktailComponents.count {
                    viewModel.cocktailComponents[i].isPreferred = false
                    viewModel.cocktailComponents[i].isUnwanted = false
                    viewModel.enableMultipleSpiritSelection = false
                    
                }
                
            }) {
                Image(systemName: "xmark")
                
            }
            .font(.footnote)
            .font(.headline).bold()
            .padding(7)
            .background(viewModel.selectedPreferredIngredients().count == 0 ? Color(UIColor.black) : Color.brandPrimaryRed.opacity(0.8))
            .foregroundColor(viewModel.selectedPreferredIngredients().count == 0 ? Color(UIColor.systemGray) : Color.white)
            .clipShape(Circle())
            .shadow(color: Color(UIColor.systemGray), radius: 4)
            
            .offset(x: 10, y: -20)
            
        }
    }
}

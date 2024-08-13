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
        .background(Color.black)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color(UIColor.systemGray), radius: 2, x: 0, y: 0)
        .foregroundColor(Color(UIColor.systemCyan))
        
    }
}

struct defaultButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .foregroundColor(Color(UIColor.white))
        .font(.system(size: 16, weight: .bold))
        .padding(.top, 25)
        .padding(.bottom, 25)
    }
}


var wNGSpecString = "(Williams & Graham Spec.)"


extension TextField {
    func cBCTextField() -> some View {
        self
            .padding(5)
            .background(Color.black)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: Color(UIColor.systemGray), radius: 4, x: 0, y: 0)
            .foregroundColor(Color(UIColor.white))
            .multilineTextAlignment(.center)
    }
}

extension Double {
    
    var toMilliliters: Double {
        
        return self * 29.537
        
    }
}

extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

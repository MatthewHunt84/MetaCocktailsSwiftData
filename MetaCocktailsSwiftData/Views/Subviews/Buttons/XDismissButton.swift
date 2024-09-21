//
//  XDismissButton.swift
//  MetaCocktails
//
//  Created by James on 8/8/23.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {

        ZStack {

            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.primary)
                .opacity(0.6)

            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44, alignment: .center)
                .foregroundColor(.black)
        }
    }
}

struct XDismissButton_Previews: PreviewProvider {
    static var previews: some View {
        XDismissButton()
    }
}

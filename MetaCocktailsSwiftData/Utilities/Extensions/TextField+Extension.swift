//
//  TextField+Extension.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 8/27/24.
//

import SwiftUI

extension TextField {
    
    func cBCTextField() -> some View {
        self
            .padding(5)
            .background(Color.black)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: Color(UIColor.systemGray), radius: 4, x: 0, y: 0)
            .foregroundColor(.primary)
            .multilineTextAlignment(.center)
    }

    func searchBarTextField() -> some View {
        self
            .font(FontFactory.regularFont(size: 16))
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(ColorScheme.searchBarBackground)
            )
            .foregroundColor(.primary)
            .autocorrectionDisabled(true)
            .padding(.trailing, 8)
    }
}

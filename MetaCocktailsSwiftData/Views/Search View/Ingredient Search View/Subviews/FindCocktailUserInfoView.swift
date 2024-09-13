//
//  FindCocktailUserInfo.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/11/24.
//

import SwiftUI

struct FindCocktailUserInfoView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Find cocktails by searching their ingredients")
                .font(FontFactory.regularFont(size: 18))
            Text("Choose any ingredient, category, flavor, style or profile to be included or excluded from cocktail results")
                .font(FontFactory.regularFont(size: 16))
                .foregroundStyle(.secondary)
        }
        .padding(.leading, 16)
        .padding(.trailing, 16)
        .padding(.top, 5)
        .padding(.bottom, 5)
        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
    }
}

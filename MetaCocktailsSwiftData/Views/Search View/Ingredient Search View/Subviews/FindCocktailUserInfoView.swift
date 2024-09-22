//
//  FindCocktailUserInfo.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/11/24.
//

import SwiftUI

struct FindCocktailUserInfoView: View {
    
    @State var isShowingSearchInfo = false
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Text("Search for cocktails by ingredient")
                    .font(FontFactory.regularFont(size: 18))
                
                    Image(systemName: "info.circle")
                    .foregroundStyle(isShowingSearchInfo ? ColorScheme.tintColor : ColorScheme.interactionTint)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                isShowingSearchInfo.toggle()
                            }
                        }
            }
            
            if isShowingSearchInfo {
                Text("Choose any ingredient, category, flavor, style or profile to be included or excluded from cocktail results")
                    .font(FontFactory.regularFont(size: 16))
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.leading, 16)
        .padding(.trailing, 16)
        .padding(.top, 5)
        .padding(.bottom, 5)
        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
    }
}

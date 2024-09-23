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
                    .font(.body.smallCaps())
                    .fontWeight(.light)
                    .foregroundStyle(.secondary)
                
                    Image(systemName: "info.circle")
                    .foregroundStyle(isShowingSearchInfo ? ColorScheme.tintColor : ColorScheme.interactionTint)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                isShowingSearchInfo.toggle()
                            }
                        }
                Spacer()
            }
            
            if isShowingSearchInfo {
                Text("Choose any ingredient, category, flavor, style or profile to be included or excluded from cocktail results")
                    .font(FontFactory.regularFont(size: 16))
                    .foregroundStyle(.primary)
            }
        }
        .padding(.leading, 32)
        .padding(.top, 16)
        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
    }
}

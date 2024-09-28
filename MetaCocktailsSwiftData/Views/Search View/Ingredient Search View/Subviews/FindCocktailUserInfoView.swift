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
        
        InfoDisclosureHeader(isShowingDetail: $isShowingSearchInfo,
                             text: "Filter cocktails by ingredient",
                             detail: "Search ingredients, categories, flavors, styles or profiles to find matching cocktails")
        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
    }
}

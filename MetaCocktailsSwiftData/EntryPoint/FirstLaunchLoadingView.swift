//
//  LoadingView.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 7/13/24.
//

import SwiftUI
import SwiftData

struct FirstLaunchLoadingView: View {

    var body: some View {
        
        ZStack {
            ColorScheme.background.ignoresSafeArea()
            FirstLoadAnimation()
        }
    }
}

#Preview {
    FirstLaunchLoadingView()
}

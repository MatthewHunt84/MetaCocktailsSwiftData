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
            FirstLoadAnimation(frame: 200,
                               duration: 2,
                               internalColor: Color.primary.mix(with: ColorScheme.tintColor, by: 0.33),
                               externalColor: LinearGradient(colors: [Color.brandPrimaryOrange, ColorScheme.tintColor, Color.brandPrimaryOrange],
                                                             startPoint: .topLeading,
                                                             endPoint: .bottomTrailing),
                               reverse: false)
        }
    }
}

#Preview {
    FirstLaunchLoadingView()
}

//
//  LoadingView.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 7/13/24.
//

import SwiftUI
import SwiftData

struct FirstLaunchLoadingView: View {
    @EnvironmentObject var appState: AppState
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        
        ZStack {
            ColorScheme.backgroundGradient.ignoresSafeArea()
            CustomLoadingAnimation()
                .frame(width: 190, height: 190)
                .padding(.bottom, 12)
        }
        .task {
            await prepareData()
        }
    }
    
    @MainActor
    private func prepareData() async {
        // Perform a simple query to ensure the store is ready
        let _ = try? modelContext.fetch(FetchDescriptor<Cocktail>())
        
        // If we get here without crashing, the store is ready
        appState.setDataReady()
    }
}

#Preview {
    FirstLaunchLoadingView()
}

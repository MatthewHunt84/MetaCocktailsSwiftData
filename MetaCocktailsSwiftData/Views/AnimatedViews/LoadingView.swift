//
//  LoadingView.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 7/13/24.
//

import SwiftUI
import SwiftData

struct LoadingView: View {
    @EnvironmentObject var appState: AppState
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack {
            LoadingAnimation()
                .frame(width: 150, height: 150)
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

struct LoadingAnimation: View {
    @State private var rotationCircle = 0.0
    @State private var rotationTriangle = 0.0
    
    var body: some View {
        ZStack {
            Image("CirclePart")
                .resizable()
                .rotationEffect(.degrees(rotationCircle))
                .animation(Animation.linear(duration: 4).repeatForever(autoreverses: false), value: rotationCircle)
            
            Image("TrianglePart")
                .resizable()
            
            Image("GlassPart")
                .resizable()
        }
        .onAppear {
            rotationCircle = 360
            rotationTriangle = -360
        }
    }
}

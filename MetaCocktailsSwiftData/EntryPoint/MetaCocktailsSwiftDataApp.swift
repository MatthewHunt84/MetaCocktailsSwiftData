//
//  MetaCocktailsSwiftDataApp.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/7/23.
//

import SwiftData
import SwiftUI

@main
struct MetaCocktailsSwiftDataApp: App {
    @StateObject private var appState = AppState()
    @AppStorage("shouldPreload") private var shouldPreload: Bool = true
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                TabBarView()
                    .preferredColorScheme(.dark)
                    .opacity(appState.showMainContent ? 1 : 0)
                
                LoadingView()
                    .preferredColorScheme(.dark)
                    .opacity(appState.showMainContent ? 0 : 1)
            }
            .animation(.easeInOut(duration: 0.8), value: appState.showMainContent)
        }
        .modelContainer(CocktailContainer.preload(&shouldPreload))
        .environmentObject(CBCViewModel())
        .environmentObject(appState)
    }
}

@MainActor class AppState: ObservableObject {
    @Published var isDataReady = false {
        didSet {
            updateShowMainContent()
        }
    }
    @Published var showMainContent = false
    private var loadingStartTime: Date?
    
    init() {
        loadingStartTime = Date()
    }
    
    private func updateShowMainContent() {
        guard isDataReady else { return }
        
        let elapsedTime = Date().timeIntervalSince(loadingStartTime ?? Date())
        if elapsedTime >= 2.0 {
            withAnimation {
                showMainContent = true
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + (2.0 - elapsedTime)) {
                withAnimation {
                    self.showMainContent = true
                }
            }
        }
    }
}

struct LoadingView: View {
    @EnvironmentObject var appState: AppState
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack {
            LoadingAnimation()
                .frame(width: 150, height: 150)
        }
        .onAppear {
            Task {
                await prepareData()
            }
        }
    }
    
    @MainActor
    private func prepareData() async {
        // Perform a simple query to ensure the store is ready
        let _ = try? modelContext.fetch(FetchDescriptor<Cocktail>())
        
        // If we get here without crashing, the store is ready
        appState.isDataReady = true
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

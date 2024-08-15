//
//  Ideas.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 8/14/24.
//

import SwiftUI

// Gradient Navigation title idea

extension View {
    func gradientNavigationTitle(_ title: String, startPoint: UnitPoint = .leading, endPoint: UnitPoint = .trailing) -> some View {
        self.modifier(GradientNavigationTitle(title, startPoint: startPoint, endPoint: endPoint))
    }
}

struct GradientNavigationTitle: ViewModifier {
    let title: String
    let colors: [Color]
    let startPoint: UnitPoint
    let endPoint: UnitPoint
    let gradient: LinearGradient
    
    init(_ title: String, colors: [Color] = [.blue, .purple, .red], startPoint: UnitPoint = .leading, endPoint: UnitPoint = .trailing) {
        self.title = title
        self.colors = colors
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.gradient = LinearGradient(gradient: Gradient(colors: colors),
                                       startPoint: startPoint,
                                       endPoint: endPoint)
    }
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(gradient)
                }
            }
    }
}

// Animated Mesh gradient (for capsule? Maybe border or background)

struct MeshGradients {
    
    static let animatedPreferredSelection: TimelineView<AnimationTimelineSchedule, MeshGradient> =
    TimelineView(.animation) { timeline in
        let x = (sin(timeline.date.timeIntervalSince1970) + 1) / 2
        
        MeshGradient(width: 3, height: 3, points: [
            [0, 0], [Float(x), 0], [1, 0],
            [0, 0.5], [0.8, 0.5], [1, 0.5],
            [0, 1], [Float(x), 1], [1, 1]
        ], colors: [
            .green, .green, .green,
            .green, Color(.greenYellow), .green,
            .green, .green, .green
        ])
    }
    
    static let animatedUnwantedSelection: TimelineView<AnimationTimelineSchedule, MeshGradient> =
    TimelineView(.animation) { timeline in
        let x = (sin(timeline.date.timeIntervalSince1970) + 1) / 2
        
        MeshGradient(width: 3, height: 3, points: [
            [0, 0], [Float(x), 0], [1, 0],
            [0, 0.5], [0.8, 0.5], [1, 0.5],
            [0, 1], [Float(x), 1], [1, 1]
        ], colors: [
            .red, .red, .red,
            .red, .orange, .red,
            .red, .red, .red
        ])
    }
    
    static let staticPreferredSelection: MeshGradient =

        MeshGradient(width: 3, height: 3, points: [
            [0, 0], [0.9, 0], [1, 0],
            [0, 0.5], [0.9, 0.5], [1, 0.5],
            [0, 1], [0.9, 1], [1, 1]
        ], colors: [
            .green, .green, .green,
            .green, Color(.greenYellow), .green,
            .green, .green, .green
        ])
    
    static let staticUnwantedSelection: MeshGradient =

        MeshGradient(width: 3, height: 3, points: [
            [0, 0], [0.8, 0], [1, 0],
            [0, 0.5], [0.9, 0.5], [1, 0.5],
            [0, 1], [0.8, 1], [1, 1]
        ], colors: [
            .red, .red, .red,
            .red, .orange, .red,
            .red, .red, .red
        ])
    
    static let redAndYellow: MeshGradient =
    MeshGradient(width: 3, height: 3, points: [
        [0, 0], [0.5, 0], [1, 0],
        [0, 0.5], [0.5, 0.5], [1, 0.5],
        [0, 1], [0.5, 1], [1, 1]
    ], colors: [
        .red, .red, .red,
        .red, .orange, .red,
        .red, .red, .red
    ])
    
    static let blurple: MeshGradient =
    MeshGradient(width: 3, height: 3, points: [
        [0, 0], [0.5, 0], [1, 0],
        [0, 0.5], [0.5, 0.5], [1, 0.5],
        [0, 1], [0.5, 1], [1, 1]
    ], colors: [
        .blue, .blue, .purple,
        .blue, .blue, .purple,
        .blue, .purple, .red
    ])
    
    static let blurpleLinear = LinearGradient(gradient: Gradient(colors: [.blue, .purple, .red]),
                                              startPoint: .leading,
                                              endPoint: .trailing)
    static let blurpleRadial = RadialGradient(colors: [.blue, .purple, .red], center: .center, startRadius: 0.0, endRadius: 1.0)
    
    static let goldAndRed = LinearGradient(gradient: Gradient(colors: [Color(.brandPrimaryGold), Color(.brandPrimaryGold), .red]),
                                           startPoint: .leading,
                                           endPoint: .bottomTrailing)
    
    static let redAndGold = LinearGradient(gradient: Gradient(colors: [.red, Color(.brandPrimaryGold), Color(.brandPrimaryGold)]),
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing)
    
    static let blackGreyBackground = LinearGradient(gradient: Gradient(colors: [Color.black.opacity(1), Color.white.opacity(0.3)]),
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing)
}

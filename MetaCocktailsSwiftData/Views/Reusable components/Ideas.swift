//
//  Ideas.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 8/14/24.
//

import SwiftUI

// Gradient Navigation title idea

extension View {
    func goldHeader(_ title: String, startPoint: UnitPoint = .leading, endPoint: UnitPoint = .trailing) -> some View {
        self.modifier(GradientNavigationTitle(title, startPoint: startPoint, endPoint: endPoint))
    }
}

struct GradientNavigationTitle: ViewModifier {
    let title: String
    let colors: [Color]
    let startPoint: UnitPoint
    let endPoint: UnitPoint
    let gradient: LinearGradient
    
    init(_ title: String, colors: [Color] = [Color(.redGold), Color(.brandPrimaryGold), .red], startPoint: UnitPoint = .leading, endPoint: UnitPoint = .trailing) {
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

extension View {
    func goldHeaderWithNavigation(title: String, dismiss: DismissAction) -> some View {
        self.modifier(GradientNavigationTitleWithNavigation(dismiss: dismiss, title: title))
    }
}

struct GradientNavigationTitleWithNavigation: ViewModifier {
    
    var dismiss: DismissAction
    let title: String
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 9)
                            .bold()
                            .tint(.blueTint)
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .font(.largeTitle).bold()
                        .foregroundStyle(MeshGradients.goldTitle)
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
    
    static let animatedCocktailBackground: TimelineView<AnimationTimelineSchedule, MeshGradient> =
    TimelineView(.animation) { timeline in
        let x = (sin(timeline.date.timeIntervalSince1970) + 1) / 2
        
        MeshGradient(width: 3, height: 3, points: [
            [0, 0], [Float(x), 0], [1, 0],
            [0, 0.5], [0.5, 0.5], [1, 0.5],
            [0, 1], [Float(x), 1], [1, 1]
        ], colors: [
            .darkGrey, .darkGrey, .darkGrey,
            .darkGrey, .brandPrimaryGold, .darkGrey,
            .brandPrimaryGold, .darkGrey, .darkGrey
        ])
    }
    
    static let animatedGoldBackground: TimelineView<AnimationTimelineSchedule, MeshGradient> =
    TimelineView(.animation) { timeline in
        let x = (sin(timeline.date.timeIntervalSince1970) + 1) / 2
        
        MeshGradient(width: 3, height: 3, points: [
            [0, 0], [Float(x), 0], [1, 0],
            [0, 0.5], [0.5, 0.5], [1, 0.5],
            [0, 1], [Float(x), 1], [1, 1]
        ], colors: [
            .redGold, .brandPrimaryGold, .brandPrimaryGold,
            .brandPrimaryGold, .redGold, .brandPrimaryGold,
            .brandPrimaryGold, .brandPrimaryGold, .redGold
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
    
    static let greyFade: MeshGradient =
    MeshGradient(width: 3, height: 3, points: [
        [0, 0], [0.5, 0], [1, 0],
        [0, 0.5], [0.5, 0.5], [1, 0.5],
        [0, 1], [0.5, 1], [1, 1]
    ], colors: [
        .lightGray, .lightGray, .lightGray,
        .lightGray, .lightGray, .darkestGray,
        .lightGray, .darkestGray, .darkestGray
    ])
    
    static let goldMesh: MeshGradient =
    MeshGradient(width: 3, height: 3, points: [
        [0, 0], [0.5, 0], [1, 0],
        [0, 0.5], [0.5, 0.5], [1, 0.5],
        [0, 1], [0.5, 1], [1, 1]
    ], colors: [
        .brandPrimaryGold, .brandPrimaryGold, .brandPrimaryGold,
        .brandPrimaryGold, .redGold, .brandPrimaryGold,
        .brandPrimaryGold, .brandPrimaryGold, .brandPrimaryGold
    ])
    
    static let redMesh: MeshGradient =
    MeshGradient(width: 3, height: 3, points: [
        [0, 0], [0.5, 0], [1, 0],
        [0, 0.5], [0.5, 0.5], [1, 0.5],
        [0, 1], [0.5, 1], [1, 1]
    ], colors: [
        .red, .red, .brandPrimaryGold,
        .red, .brandPrimaryGold, .brandPrimaryGold,
        .brandPrimaryGold, .brandPrimaryGold, .brandPrimaryGold
    ])
    
    static let whiteMesh: MeshGradient =
    MeshGradient(width: 3, height: 3, points: [
        [0, 0], [0.5, 0], [1, 0],
        [0, 0.5], [0.5, 0.5], [1, 0.5],
        [0, 1], [0.5, 1], [1, 1]
    ], colors: [
        .white, .white, .white,
        .white, .white, .white,
        .white, .white, .white
    ])
    static let whiteLinear = LinearGradient(colors: [.white, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
    static let goldTitle = LinearGradient(colors: [Color(.redGold), Color(.brandPrimaryGold), .red], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    static let blurpleLinear = LinearGradient(gradient: Gradient(colors: [.blue, .purple, .red]),
                                              startPoint: .leading,
                                              endPoint: .trailing)
    static let blurpleRadial = RadialGradient(colors: [.blue, .purple, .red], center: .center, startRadius: 0.0, endRadius: 1.0)
    
    static let goldAndRed = LinearGradient(gradient: Gradient(colors: [Color(.brandPrimaryGold), Color(.brandPrimaryGold), .red]),
                                           startPoint: .leading,
                                           endPoint: .bottomTrailing)
    
    static let redAndGold = LinearGradient(gradient: Gradient(colors: [.red, Color(.redGold)]),
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing)
    
    static let blackGreyBackground = LinearGradient(gradient: Gradient(colors: [Color.black.opacity(1), Color.white.opacity(0.3)]),
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing)
    
    static let whiteToGreyFade = LinearGradient(gradient: Gradient(colors: [.white, .gray]), startPoint: .leading, endPoint: .trailing)
    static let disabledButton = LinearGradient(gradient: Gradient(colors: [Color.medGray, Color.lightGray]), startPoint: .leading, endPoint: .trailing)
    static let disabledButton2 = LinearGradient(gradient: Gradient(colors: [Color.clear, Color.clear]), startPoint: .leading, endPoint: .trailing)
    
    static let activeBlue = LinearGradient(gradient: Gradient(colors: [.cyan, .blue, .blue, .blue]),
                                              startPoint: .topLeading,
                                              endPoint: .bottomTrailing)
    
    static let activatedBlue = LinearGradient(gradient: Gradient(colors: [.blue, .blue, .cyan]),
                                              startPoint: .topLeading,
                                              endPoint: .bottomTrailing)
    
    static func interactiveButton(isActive: Bool) -> LinearGradient {
        isActive ? activeBlue : disabledButton
    }
    
    
    static let blue3 = LinearGradient(gradient: Gradient(colors: [.cyan, .blue, .purple]),
                                              startPoint: .leading,
                                              endPoint: .trailing)
    
    static let blue4 = LinearGradient(gradient: Gradient(colors: [.cyan, .cyan, .purple]),
                                              startPoint: .leading,
                                              endPoint: .trailing)
    
    static let blueA = LinearGradient(gradient: Gradient(colors: [.gray, .cyan, .blue]),
                                              startPoint: .leading,
                                              endPoint: .trailing)
    
    static let blueB = LinearGradient(gradient: Gradient(colors: [.cyan, .teal, .blue]),
                                              startPoint: .topLeading,
                                              endPoint: .bottomTrailing)
    
    static let blueC = LinearGradient(gradient: Gradient(colors: [.cyan, .blue, .purple]),
                                              startPoint: .leading,
                                              endPoint: .trailing)
    
    static let blueD = LinearGradient(gradient: Gradient(colors: [.cyan, .cyan, .purple]),
                                              startPoint: .leading,
                                              endPoint: .trailing)
    
}

struct RoundedTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.vertical)
            .padding(.horizontal, 24)
            .background(
                Color(UIColor.systemGray6)
            )
            .clipShape(Capsule(style: .continuous))
    }
}

struct RoundedButtonStyle: ButtonStyle {
    let isDisabled: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(Color.clear)
            .clipShape(Capsule(style: .continuous))
            .overlay(
                 Capsule(style: .continuous)
                     .stroke(
                        strokeColor(for: configuration),
                        lineWidth: 2
                     )
             )
            .scaleEffect(configuration.isPressed ? 0.95 : 1) // Slight scale effect when pressed
    }
    
    private func strokeColor(for configuration: Configuration) -> LinearGradient {
        if isDisabled {
            return MeshGradients.disabledButton2
        } else if configuration.isPressed {
            return MeshGradients.activatedBlue
        } else {
            return MeshGradients.disabledButton2//MeshGradients.activeBlue
        }
    }
}

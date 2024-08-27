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


// Title

extension View {
    
    func jamesHeader(_ title: String) -> some View {
        self.modifier(JamesTitle(title))
    }
}

struct JamesTitle: ViewModifier {
    let title: String

    
    init(_ title: String) {
        self.title = title
    }
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .principal) {
                    FontFactory.titleHeader30(title: title)
                }
            }
    }
}

// Title with back button

extension View {
    func jamesHeaderWithNavigation(title: String, dismiss: DismissAction) -> some View {
        self.modifier(JamesTitleWithNavigation(dismiss: dismiss, title: title))
    }
}

struct JamesTitleWithNavigation: ViewModifier {
    
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
                    FontFactory.titleHeader30(title: title)
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
    
    static func matchedCocktailBackground(backgroundIsActive: Bool) -> MeshGradient {
        return MeshGradient(width: 3, height: 3, points: [
            [0, 0], [0.5, 0], [1, 0],
            [ 0 , 0.5], [0.5, 0.5], [1, 0.5],
            [0 , 0.3], [backgroundIsActive ? 0.35 : 0.49 , backgroundIsActive ? 0.6 : 0.62], [1 , 1]
        ], colors: [
            .black, .black,.black,
            .black, .black, .black,
            .brandSecondaryBlue, .brandSecondaryBlue, .brandSecondaryBlue
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
    
    static let darkColorMesh: MeshGradient =
    MeshGradient(width: 3, height: 3, points: [
        [0, 0], [0.5, 0], [1, 0],
        [0, 0.5], [0.5, 0.5], [1, 0.5],
        [0, 1], [0.5, 1], [1, 1]
    ], colors: [
        .brandSecondaryBlue, .brandSecondaryBlue, .brandSecondaryTeal,
        .brandSecondaryBlue, .brandSecondaryTeal, .brandSecondaryTeal,
        .brandSecondaryTeal, .brandSecondaryBlue, .brandSecondaryBlue
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
    
    static let blackAndRed = LinearGradient(gradient: Gradient(colors: [ .black, .brandPrimaryRed]),
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing)
    
    static let meshBlueRibbonBackground =
    MeshGradient(width: 3, height: 3, points: [
        [0, 0], [0.5, 0], [1, 0],
        [ 0 , 0.5], [0.5, 0.5], [1, 0.5],
        [0 , 0.7], [0.55 , 0.55], [1 , 0]
    ], colors: [
        .black, .black,.black,
        .black, .black, .black,
        .brandSecondaryBlue, .brandSecondaryBlue, .brandSecondaryBlue
    ])
    
    static let meshRedRibbonBackground =
    MeshGradient(width: 3, height: 3, points: [
        [0, 0], [0.5, 0], [1, 0],
        [ 0 , 0.5], [0.5, 0.5], [1, 0.5],
        [0 , 0.7], [0.55 , 0.55], [1 , 0]
    ], colors: [
        .black, .black,.black,
        .black, .black, .black,
        .brandSecondaryRed, .brandSecondaryRed, .brandSecondaryRed
    ])
    static let meshBlueTwoRibbonBackground =
    MeshGradient(width: 3, height: 3, points: [
        [0, 0], [0.5, 0], [1, 0],
        [ 0 , 0.5], [0.5, 0.5], [1, 0.5],
        [0 , 0.3], [0.49 , 0.62], [1 , 1]
    ], colors: [
        .black, .black,.black,
        .black, .black, .black,
        .brandSecondaryBlue, .brandSecondaryBlue, .brandSecondaryBlue
    ])
    
    static let meshTealRibbonBackground =
    MeshGradient(width: 3, height: 3, points: [
        [0, 0], [0.5, 0], [1, 0],
        [ 0 , 0.5], [0.5, 0.5], [1, 0.5],
        [0 , 0.7], [0.69 , 0.6], [1 , 0]
    ], colors: [
        .black, .black,.black,
        .black, .black, .black,
        .brandSecondaryTeal, .brandSecondaryTeal, .brandSecondaryTeal
    ])
        
//    static let blackGreyBackground = LinearGradient(gradient: Gradient(colors: [Color.black.opacity(1), Color.gray.opacity(0.3)]),
//                                                    startPoint: .topLeading,
//                                                    endPoint: .bottomTrailing)
    
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
                Capsule(style: .continuous) // Define the rounded corner
                    .strokeBorder(Color.brandPrimaryGold, lineWidth: 1) // Add border with color and line width
                    .background(.clear) // Set the background color inside the border
                    //.shadow(color: .gray, radius: 10, x: 1, y: 2) // Add shadow with specific properties
            )
            .padding(5)
        
        
        
        
    }
}

struct RoundedButtonStyle: ButtonStyle {
    let isDisabled: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(Color.clear)
            .clipShape(Capsule(style: .continuous))
//            .overlay(
//                 Capsule(style: .continuous)
//                     .stroke(
//                        //strokeColor(for: configuration),
//                   
//                        lineWidth: 1
//                     )
//             )
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

struct FontFactory {
    
    static func regularText(_ text: String, font: String = "AvenirNext-Regular", size: CGFloat, color: Color = .white, isBold: Bool = false) -> Text {
        return Text(text)
            .font(.custom(font, size: size))
            .foregroundStyle(color)
            .bold(isBold)
    }
    
    static func regularFont(size: CGFloat) -> Font {
        Font.custom("AvenirNext-Regular", size: size)
    }
    
    static func titleHeader30(title: String) -> Text {
        return Text(title)
            .font(.custom("AvenirNext-Regular", size: 30))
    }
    
    static var buildBodySmall10: Font = .custom("AvenirNext-Regular", size: 10)
    static var buildStepSmall10B: Font = .custom("AvenirNext-Regular", size: 10).bold()
    static var sectionHeader12: Font = .custom("AvenirNext-Regular", size: 12)
    static var specMeasurement16B: Font = .custom("AvenirNext-Regular", size: 16).bold()
    static var fontBody16: Font = .custom("AvenirNext-Regular", size: 16)
    static var recipeCardHeader18B: Font = .custom("AvenirNext-Regular", size: 18).bold()
    static var formLabel18: Font = .custom("AvenirNext-Regular", size: 18)
    static var bottomToolbarButton20: Font = .custom("AvenirNext-Regular", size: 20)
    
}


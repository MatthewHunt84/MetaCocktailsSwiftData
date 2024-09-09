//
//  Gradients.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 8/27/24.
//

import SwiftUI

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
            .black, .black, .black
        ])
    }

    
    static let recipeMeshBackground: MeshGradient =
    MeshGradient(width: 3, height: 3, points: [
        [0, 0], [0.5, 0], [1, 0],
        [ 0 , 0.5], [0.5, 0.5], [1, 0.5],
        [0 , 0.3], [0.49 , 0.62], [1 , 1]
    ], colors: [
        .black, .black,.black,
        .black, .black, .black,
        .black, .black, .black
    ])
    
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
    
    static let redAndGold = LinearGradient(gradient: Gradient(colors: [.red, .red, .redGold]),
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing)
    
    static let blackAndRed = LinearGradient(gradient: Gradient(colors: [ .black, .brandPrimaryRed]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing)
    
    static let meshBlueRibbonBackground = Color.black
//    MeshGradient(width: 3, height: 3, points: [
//        [0, 0], [0.5, 0], [1, 0],
//        [ 0 , 0.5], [0.5, 0.5], [1, 0.5],
//        [0 , 0.7], [0.55 , 0.55], [1 , 0]
//    ], colors: [
//        .black, .black,.black,
//        .black, .black, .black,
//        .brandSecondaryBlue, .brandSecondaryBlue, .brandSecondaryBlue
//    ])
    
    static let meshRedRibbonBackground = Color.black
//    MeshGradient(width: 3, height: 3, points: [
//        [0, 0], [0.5, 0], [1, 0],
//        [ 0 , 0.5], [0.5, 0.5], [1, 0.5],
//        [0 , 0.7], [0.55 , 0.55], [1 , 0]
//    ], colors: [
//        .black, .black,.black,
//        .black, .black, .black,
//        .brandSecondaryRed, .brandSecondaryRed, .brandSecondaryRed
//    ])
    
    static let meshBlueTwoRibbonBackground = Color.black
//    MeshGradient(width: 3, height: 3, points: [
//        [0, 0], [0.5, 0], [1, 0],
//        [ 0 , 0.5], [0.5, 0.5], [1, 0.5],
//        [0 , 0.3], [0.49 , 0.62], [1 , 1]
//    ], colors: [
//        .black, .black,.black,
//        .black, .black, .black,
//        .brandSecondaryBlue, .brandSecondaryBlue, .brandSecondaryBlue
//    ])
    
    static let meshTealRibbonBackground = Color.black
//    MeshGradient(width: 3, height: 3, points: [
//        [0, 0], [0.5, 0], [1, 0],
//        [ 0 , 0.5], [0.5, 0.5], [1, 0.5],
//        [0 , 0.7], [0.69 , 0.6], [1 , 0]
//    ], colors: [
//        .black, .black,.black,
//        .black, .black, .black,
//        .brandSecondaryTeal, .brandSecondaryTeal, .brandSecondaryTeal
//    ])
    
    
    static let whiteToGreyFade = LinearGradient(gradient: Gradient(colors: [.white, .gray]), startPoint: .leading, endPoint: .trailing)
    static let disabledButton = LinearGradient(gradient: Gradient(colors: [Color.medGray, Color.lightGray]), startPoint: .leading, endPoint: .trailing)
    static let disabledButton2 = LinearGradient(gradient: Gradient(colors: [Color.clear, Color.clear]), startPoint: .leading, endPoint: .trailing)
    
    static let activeBlue = LinearGradient(gradient: Gradient(colors: [.blue, .blue, .blue, .cyan]),
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing)
    
    static let activatedBlue = LinearGradient(gradient: Gradient(colors: [.cyan, .blue, .blue, .blue]),
                                              startPoint: .topLeading,
                                              endPoint: .bottomTrailing)
    
    static func interactiveButton(isActive: Bool) -> LinearGradient {
        isActive ? activeBlue : disabledButton
    }
}

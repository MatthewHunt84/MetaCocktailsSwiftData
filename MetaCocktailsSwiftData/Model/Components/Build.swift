//
//  Build.swift
//  MetaCocktails
//
//  Created by Matthew Hunt on 8/30/23.
//

import SwiftUI

struct Build: Codable {
    var instructions: [Instruction]
}

struct Instruction: Codable, Identifiable, Equatable {
    var id = UUID()
    
    let step: Int
    let method: String
}

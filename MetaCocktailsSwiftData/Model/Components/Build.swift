//
//  Build.swift
//  MetaCocktails
//
//  Created by Matthew Hunt on 8/30/23.
//

import SwiftUI

struct Build: Codable {
    let instructions: [Instruction]
}

struct Instruction: Codable, Identifiable {
    var id = UUID()
    
    let step: Int
    let method: String
}

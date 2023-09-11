//
//  Build.swift
//  MetaCocktails
//
//  Created by Matthew Hunt on 8/30/23.
//

import SwiftUI

struct Build {
    let instructions: [Instruction]
}

struct Instruction: Identifiable {
    let id = UUID()
    let step: Int
    let method: String
}

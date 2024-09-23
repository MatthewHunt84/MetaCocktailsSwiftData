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
    
    var step: Int
    var method: String
}

//
//  Build.swift
//  MetaCocktails
//
//  Created by Matthew Hunt on 8/30/23.
//

import SwiftUI
import SwiftData

@Model
class Build: Codable {
    let instructions: [Instruction]
    
    init(instructions: [Instruction]) {
        self.instructions = instructions
    }
    
    // MARK: - @Model codable conformance
    
    enum CodingKeys: CodingKey {
        case instructions
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.instructions = try container.decode([Instruction].self, forKey: .instructions)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(instructions.self, forKey: .instructions)
    }
}

struct Instruction: Codable, Identifiable {
    var id = UUID()
    
    let step: Int
    let method: String
}

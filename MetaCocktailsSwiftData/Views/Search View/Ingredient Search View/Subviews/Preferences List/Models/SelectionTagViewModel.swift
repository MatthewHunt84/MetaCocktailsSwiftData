//
//  SelectionTagViewModel.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 8/14/24.
//

import SwiftUI

struct SelectionTagViewModel {

    init(name: String, isPreferred: Bool) {
        self.ingredientName = name
        self.color = isPreferred ? .green : .red
    }
    
    let ingredientName: String
    let color: Color
}

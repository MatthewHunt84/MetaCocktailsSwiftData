//
//  PreviewContainer.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 7/13/24.
//

import SwiftData
import SwiftUI

struct SampleData: PreviewModifier {
    
    static func makeSharedContext() throws -> Context {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Cocktail.self, configurations: config)
        DummyCocktails.shared.cocktails.forEach { cocktail in
            container.mainContext.insert(cocktail)
        }
        
        return container
    }
    
    func body(content: Content, context: ModelContainer) -> some View {
        content.modelContainer(context)
    }
}

extension PreviewTrait where T == Preview.ViewTraits {
    @MainActor static var sampleData: Self = .modifier(SampleData())
}

//
//  TestView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/8/24.
//

import SwiftUI

struct TestView: View {
    @Bindable var savedBatchCocktail: BatchedCocktail
    var body: some View {
        VStack {
            Text(savedBatchCocktail.batchCocktailName)
        }
    }
}

//#Preview {
//    TestView(savedBatchCocktail: Ba)
//}

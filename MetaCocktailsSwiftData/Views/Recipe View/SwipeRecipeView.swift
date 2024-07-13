//
//  SwipeRecipeView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/20/24.
//

import SwiftUI
import SwiftData

struct SwipeRecipeView: View {
    @State var variations: [Cocktail] // when this isn't state, our weird HeightPreservingTabView gets all mad. Keeping this for now, but perhaps adding binding viewModels is what we need here.
    @Environment(\.dismiss) private var dismiss
    @Namespace var topID
    
//    @Bindable var viewModel: RecipeViewModel = RecipeViewModel(cocktail: ramosGinFizz)
    @State var viewModel: RecipeViewModel = RecipeViewModel(cocktail: ramosGinFizz)
    
    var body: some View {
        
        NavigationStack {
            
            GeometryReader { geo in
                
                ScrollViewReader { scrollReader in
                    
                    ScrollView {
                        
                        HeightPreservingTabView(selection: $variations) {
                            
                            ForEach($variations, id: \.self) { cocktail in
                                VStack {
                                    RecipeFlipCardView(viewModel: RecipeViewModel(cocktail: cocktail.wrappedValue), geo: geo, topID: topID, scrollReader: scrollReader)
                                        .padding(.bottom, 28)
                                    
                                }
                                .toolbar {
                                    ToolbarItem(placement: .principal) {
                                        RecipeTitleView(cocktail: cocktail.wrappedValue)
                                    }
                                }
                            }
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            BackButton()
                        }
                    }
                }
            }
        }
    }
}


// Boilerplate code : https://bdewey.com/til/2023/03/01/swiftui-and-tabview-height/
/// A variant of `TabView` that sets an appropriate `minHeight` on its frame.
struct HeightPreservingTabView<SelectionValue: Hashable, Content: View>: View {
    var selection: Binding<SelectionValue>?
    @ViewBuilder var content: () -> Content
    
    // `minHeight` needs to start as something non-zero or we won't measure the interior content height
    @State private var minHeight: CGFloat = 1
    
    var body: some View {
        TabView(selection: selection) {
            content()
                .background {
                    GeometryReader { geometry in
                        Color.clear.preference(
                            key: TabViewMinHeightPreference.self,
                            value: geometry.frame(in: .local).height
                        )
                    }
                }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page)
        .navigationBarTitleDisplayMode(.inline)
        .frame(minHeight: minHeight)
        .onPreferenceChange(TabViewMinHeightPreference.self) { minHeight in
            self.minHeight = minHeight
        }
    }
}

private struct TabViewMinHeightPreference: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        // It took me so long to debug this line
        value = max(value, nextValue())
    }
}

#Preview(traits: .sampleData) {
    @Previewable @Query(sort: \Cocktail.cocktailName) var cocktails: [Cocktail]
    SwipeRecipeView(variations: cocktails)
        .environmentObject(CBCViewModel())
}

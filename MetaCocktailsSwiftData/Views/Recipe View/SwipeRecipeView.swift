//
//  SwipeRecipeView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/20/24.
//

import SwiftUI
import SwiftData

struct SwipeRecipeView: View {
    @State var variations: [Cocktail]
    @State private var selectedIndex: Int
    @Environment(\.dismiss) private var dismiss
    @Namespace var topID
    
    init(variations: [Cocktail], initialSelection: Cocktail) {
        //I guess you can't assign State vars so you have to set them then cast them as State.
        self._variations = State(initialValue: variations)
        //we find where the cocktail is in variations, then that index is the first one the user sees.
        self._selectedIndex = State(initialValue: variations.firstIndex(of: initialSelection) ?? 0)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                MeshGradients.meshTealRibbonBackground.ignoresSafeArea()
                GeometryReader { geo in
                    ScrollViewReader { scrollReader in
                        ScrollView {
                            HeightPreservingTabView(selection: $selectedIndex) {
                                ForEach(Array(variations.enumerated()), id: \.element) { index, cocktail in
                                    VStack {
                                        RecipeFlipCardView(viewModel: RecipeViewModel(cocktail: cocktail), geo: geo, topID: topID, scrollReader: scrollReader)
                                            .padding(.bottom, 28)
                                    }
                                    .toolbar {
                                        ToolbarItem(placement: .principal) {
                                            RecipeTitleView(cocktail: cocktail)
                                        }
                                    }
                                    .tag(index)
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
//
//#Preview(traits: .sampleData) {
//    @Previewable @Query(sort: \Cocktail.cocktailName) var cocktails: [Cocktail]
//    return SwipeRecipeView(variations: cocktails)
//}

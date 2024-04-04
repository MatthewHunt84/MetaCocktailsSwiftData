//
//  SwipeRecipeView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/20/24.
//

import SwiftUI

struct SwipeRecipeView: View {
    @State var variations: [Cocktail]
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        NavigationStack {
            
            GeometryReader { geo in
                
                ScrollView {
                    
                    HeightPreservingTabView(selection: $variations) {
                        
                        ForEach($variations, id: \.self) { cocktail in

                                ZStack {
                                    
                                    Border()
                                        .frame(minHeight: geo.size.height)
                                        .padding(.bottom, 25)
                                    
                                    VStack(alignment: .leading, spacing: 20) {
                                        
                                        GlasswareView(cocktail: cocktail.wrappedValue)
                                        
                                        CocktailProfileView(cocktail: cocktail.wrappedValue)
                                        
                                        SpecView(cocktail: cocktail.wrappedValue)
                                        
                                        GarnishView(cocktail: cocktail.wrappedValue)
                                        
                                        MethodIceView(cocktail: cocktail.wrappedValue)
                                        
//                                        if let buildOrder = cocktail.buildOrder.wrappedValue {
//                                            NavigationLink("Build Order") {
//                                                BuildOrderView(buildOrder: buildOrder, viewModel: viewModel)
//                                                    .padding()
//                                            }
//                                            .buttonStyle(.custom)
//                                        }
                                        
                                        if cocktail.author.wrappedValue != nil {
                                            AuthorView(cocktail: cocktail.wrappedValue)
                                                .frame(maxWidth: .infinity, alignment: .center)
//                                                .padding(.bottom, 100)
                                        }
                                    }
                                    .frame(width: geo.size.width * 0.75)
                                    .padding(.top, 50)
                                    .padding(.bottom, 100)
                                    .navigationBarTitleDisplayMode(.inline)
                                    .toolbar {
                                        ToolbarItem(placement: .principal) {
                                            RecipeTitleView(cocktail: cocktail.wrappedValue)
                                        }
                                    }
                                }
                        }
                    }
                    .tabViewStyle(.page)
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
                }
                .frame(minHeight: geo.size.height)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        VStack(alignment: .leading) {
                            Button{
                                dismiss()
                            } label: {
                                Image(systemName: "chevron.backward")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 9)
                                    .bold()
                                    .tint(.cyan)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    return SwipeRecipeView(variations: [zombie129, brandyAlexander, cloverClub, zombie, airMailWnG, peanutButterFalcon])
        .modelContainer(preview.container)
       
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

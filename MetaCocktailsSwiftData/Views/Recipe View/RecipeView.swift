//
//  RecipeIngredientsView.swift
//  MetaCocktails
//
//  Created by James on 8/9/23.
//

import SwiftUI

struct CustomButtonSnippet: View {
    var body: some View {
        Button("Label") {
            // Code
        }.buttonStyle(.custom)
    }
}

public struct CustomButtonStyle: ButtonStyle {
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .fontWeight(.medium)
            .padding(.vertical, 12)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .background(.tint, in: .rect(cornerRadius: 14, style: .continuous))
            .opacity(configuration.isPressed ? 0.4 : 1.0)
    }
}

extension ButtonStyle where Self == CustomButtonStyle {
    static var custom: CustomButtonStyle { .init() }
}

private struct Layout {
    static var header: Font = .system(size: 18, weight: .bold)
    static var specMeasurement: Font = .system(size: 16, weight: .bold)
    static var body: Font = .system(size: 16, weight: .regular)
}

private struct RecipeTitleView: View {
    var title: String
    var body: some View {
        Text(title)
            .fontDesign(.serif)
            .font(.largeTitle)
            .lineLimit(1)
            .minimumScaleFactor(0.4)
    }
}

private struct Border: View {
    var body: some View {
        GeometryReader { geo in
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8.0)
                        .foregroundStyle(.darkGrey)
                        .frame(width: geo.size.width * 0.88)
                        .frame(height: geo.size.height * 0.905)
                    
                    Image(.smallBorderSides)
                        .resizable()
                        .frame(height: geo.size.height * 0.8)
                        .frame(width: geo.size.width)
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.brandPrimaryGold)
                        .background(.clear)
                    
                    VStack(alignment: .leading) {
                        
                        Image(.smallBorderTop)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundStyle(.brandPrimaryGold)
                            .background(.clear)
                        
                        Spacer()

                        
                        Image(.smallBorderTop)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundStyle(.brandPrimaryGold)
                            .background(.clear)
                            .rotationEffect(.degrees(180))
                    }
                }
            }
        }
    }
}

private struct GlasswareView: View {
    
    var cocktail: Cocktail
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 5) {
                Text("Glassware:")
                    .font(Layout.header)
                Text(cocktail.glasswareType.rawValue)
                    .dynamicTypeSize(.large)
                    .multilineTextAlignment(.leading)
            }
//            .background(.blue)
            
            Spacer()
            
            cocktail.glasswareType.glassImage(cocktail: cocktail)
                .resizable()
                .frame(width: 100, height: 100, alignment: .trailing)
                .padding(.trailing, 10)
//                .background(.red)
        }
//        .background(.yellow)
        .padding(.top, -10)
    }
}

private struct SpecView: View {
    var cocktail: Cocktail
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            
            Text("Cocktail Spec:")
                .font(Layout.header)
                .padding(.bottom, 5)
            
            ForEach(orderSpec(), id: \.id) { ingredient in
                let number = NSNumber(value: ingredient.value)
                HStack {
                    Text("\(number) \(ingredient.unit.rawValue)")
                        .font(Layout.specMeasurement)
                    if ingredient.prep != nil {
                        NavigationLink {
                            PrepRecipeView(prep: ingredient.prep!)
                        } label: {
                            Text(ingredient.ingredient.name)
                                .font(Layout.body)
                                .tint(.cyan)
                        }
                    } else {
                        Text("\(ingredient.ingredient.name)")
                            .font(Layout.body)
                    }
                }
            }
        }
    }
    
    //TODO: REFACTOR THIS
    func orderSpec() -> [CocktailIngredient] {
        var orderedSpec: [CocktailIngredient] = []
        
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredient.category == "Herbs"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredient.category == "Fruit"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredient.category == "Bitters"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredient.category == "Other N/A"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredient.category == "Seasoning"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredient.category == "Syrups"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredient.category == "Juice"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredient.category == "Liqueurs"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredient.category == "Fortified Wine"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredient.category == "Amari"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredient.category == "Whiskies"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredient.category == "Rum"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredient.category == "Gin"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredient.category == "Brandy"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredient.category == "Agave"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredient.category == "Vodka"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredient.category == "Other Alcohol"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredient.category == "Sodas"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredient.category == "Wine"}))
        
        return orderedSpec
    }
}

private struct MethodView: View {
    var cocktail: Cocktail
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            Text("Method")
                .font(Layout.header)
            
            if let stirShakeBuild = cocktail.tags.styles {
                if stirShakeBuild.contains(.built) {
                    Text("Build in glass")
                        .font(Layout.body)
                    
                }
                if stirShakeBuild.contains(.shaken) && stirShakeBuild.contains(.blended) {
                    Text("Shake or Blend")
                        .font(Layout.body)
                    
                    
                } else if stirShakeBuild.contains(.shaken) && !stirShakeBuild.contains(.blended) {
                    Text("Shake")
                        .font(Layout.body)
                    
                }
                if stirShakeBuild.contains(.stirred) {
                    Text("Stir")
                        .font(Layout.body)
                    
                }
                if stirShakeBuild.contains(.swizzle) {
                    Text("Swizzle")
                        .font(Layout.body)
                }
            }
        }
    }
}

private struct IceView: View {
    var cocktail: Cocktail
    var body: some View {
        if let ice = cocktail.ice?.rawValue {
            VStack(alignment: .leading, spacing: 5) {
                Text("Ice")
                    .font(Layout.header)
                Text(ice)
                    .font(Layout.body)
            }
        }
    }
}

private struct GarnishView: View {
    var cocktail: Cocktail
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Garnish")
                .font(Layout.header)
            
            if let garnishes = cocktail.garnish {
                ForEach(garnishes, id: \.self) { garnish in
                    Text("\(garnish.rawValue)")
                        .font(Layout.body)
                }
            } else {
                Text("None")
                    .font(Layout.body)
            }
        }
    }
}

private struct BuildOrderButton: View {
    var cocktail: Cocktail
    var body: some View {
        if let buildOrder = cocktail.buildOrder {
            NavigationLink("Build Order") {
                BuildOrderView(buildOrder: buildOrder)
            }
            .buttonStyle(defaultButton())
        }
    }
}




struct RecipeView: View {
    //@EnvironmentObject var cBCViewModel: CBCViewModel
    
    @Bindable var viewModel: RecipeViewModel
    let recipeSpacing: CGFloat = 2
    var cocktailFrameSize = CGFloat(125)
    @State private var prepItems: [CocktailIngredient] = []
    
    var body: some View {
        NavigationStack{
            GeometryReader { geo in
                ScrollView{
                    VStack(alignment: .center) {
                        //                        RecipeTitleView(title: viewModel.cocktail.cocktailName)
                        //                            .background()
                        
                        ZStack() {
                            Border()
                            
                            VStack(alignment: .leading, spacing: 20) {
                                
                                GlasswareView(cocktail: viewModel.cocktail)
                                
                                SpecView(cocktail: viewModel.cocktail)
                                
                                HStack {
                                    MethodView(cocktail: viewModel.cocktail)
                                    Spacer()
                                    IceView(cocktail: viewModel.cocktail)
                                }
                                
                                GarnishView(cocktail: viewModel.cocktail)
                                
                                Button("Build Order") {
                                    // Code to flip
                                }.buttonStyle(.custom)
                                
                                if viewModel.cocktail.author != nil {
                                    AuthorView(cocktail: viewModel.cocktail)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .padding(.bottom, 50)
                                }
                                
                                
                                //                                if !viewModel.cocktail.cocktailName.lowercased().contains("punch") {
                                //                                    BatchButton(cocktail: viewModel.cocktail)
                                //                                        .padding()
                                //                                }
                                
                            }
                            .frame(width: geo.size.width * 0.75)
                            //                            .frame(height: geo.size.height * 1.1)
                            
                        }
                        .frame(width: geo.size.width)
                        .frame(minHeight: geo.size.height)
                    }
                    //                    .navigationTitle(viewModel.cocktail.cocktailName)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            RecipeTitleView(title: viewModel.cocktail.cocktailName)
                        }
                        ToolbarItem(placement: .topBarLeading) {
                            BackButton()
                        }
                    }
                }
            }
        }
        .task {
            prepItems = viewModel.findPrepItems()
        }
    }
}

struct AuthorView: View {
    var author = ""
    var place = ""
    var year = ""
    let cocktail: Cocktail
    
    init(cocktail: Cocktail) {
        
        self.cocktail = cocktail
        
        if let authorsVar = cocktail.author {
            if let authorPerson = authorsVar.person {
                author = authorPerson
            }
            if let authorPlace = authorsVar.place {
                place = authorPlace
            }
            if let authorYear = authorsVar.year {
                year = authorYear
            }
        }
        
    }
    var body: some View {
        VStack {
            Text("Author:")
                .dynamicTypeSize(.xLarge).bold()
                .minimumScaleFactor(0.02)
            if author != "" {
                Text(author)
                    .multilineTextAlignment(.center)
                    .dynamicTypeSize(.large)
                    .minimumScaleFactor(0.02)
            }
            VStack {
            if place != "" {
                
                    Text(place)
                        .dynamicTypeSize(.large)
                        .multilineTextAlignment(.center)
                        .minimumScaleFactor(0.02)
                }
                if year != "" {
                    Text("\(year)")
                        .dynamicTypeSize(.large)
                        .minimumScaleFactor(0.02)
                }
            }
        }
    }
}


#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    return RecipeView(viewModel: RecipeViewModel(cocktail: peanutButterFalcon))
        .modelContainer(preview.container)
       
}

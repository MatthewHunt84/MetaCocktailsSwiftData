//
//  RecipeIngredientsView.swift
//  MetaCocktails
//
//  Created by James on 8/9/23.
//

import SwiftUI

struct RecipeTitleView: View {
    var title: String
    var body: some View {
        Text(title)
            .fontDesign(.serif)
            .font(.largeTitle)
            .multilineTextAlignment(.leading)
            .lineLimit(0)
            .padding(10)
    }
}

struct Border: View {
    var body: some View {
        GeometryReader { geo in
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundStyle(.darkGrey)
                        .frame(width: geo.size.width * 0.78)
                        .frame(height: geo.size.height * 0.88)
                    
                    VStack(alignment: .leading) {
                        
                        Image(.citrusBorder)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundStyle(.brandPrimaryGold)
                            .background(.clear)
                        
                        Spacer()
                        
                        Image(.citrusBorder)
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

struct Edge: Shape {
    var point0: CGPoint = CGPoint(x: 0.0, y: 1.0)
    var point1: CGPoint = CGPoint(x: 1.0, y: 0.0)
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: point0.x * rect.width, y: point0.y * rect.height))
            path.addLine(to: CGPoint(x: point1.x * rect.width, y: point1.y * rect.height))
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
            BackButton()
            GeometryReader { geo in
                ScrollView{
                    VStack(alignment: .center) {
                        RecipeTitleView(title: viewModel.cocktail.cocktailName)
                        
                        ZStack() {
                            Border()
                            
                            VStack(alignment: .leading) {
                                
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("Glassware:")
                                            .font(.system(size: 18, weight: .bold))
                                        Text(viewModel.cocktail.glasswareType.rawValue)
                                            .dynamicTypeSize(.large)
                                            .multilineTextAlignment(.leading)
                                    }
                                    .padding(.top, 50)
                                    
                                    Spacer()
                                    
                                    viewModel.cocktail.glasswareType.glassImage(cocktail: viewModel.cocktail)
                                        .resizable()
                                        .frame(width: 100, height: 100, alignment: .trailing)
                                        .padding(.trailing, 10)
                                }
                                
                                // CocktailProfileView(cocktail: viewModel.cocktail)
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    
                                    Text("Cocktail Spec:")
                                        .font(.system(size: 18, weight: .bold))
                                    
                                    ForEach(orderSpec(), id: \.id) { ingredient in
                                        let number = NSNumber(value: ingredient.value)
                                        HStack {
                                        Text("\(number)")
                                            .font(.system(size: 16, weight: .bold))
                                        Text("\(ingredient.unit.rawValue)")
                                            .font(.system(size: 16, weight: .bold))
                                        if ingredient.prep != nil {
                                            NavigationLink {
                                                PrepRecipeView(prep: ingredient.prep!)
                                            } label: {
                                                Text(ingredient.ingredient.name)
                                                    .font(.system(size: 16, weight: .regular))
                                                    .tint(.cyan)
                                                
                                            }
                                        } else {
                                            Text("\(ingredient.ingredient.name)")
                                                .font(.system(size: 16, weight: .regular))
//                                                .scaledToFit()
                                        }
                                    }
                                }
                            }
                                Spacer()
                                
                                
                                if let stirShakeBuild = viewModel.cocktail.tags.styles {
                                    if stirShakeBuild.contains(.built) {
                                        Text("Build in glass")
                                            .multilineTextAlignment(.leading)
                                            .dynamicTypeSize(.large).bold()
                                            .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                                        
                                    }
                                    if stirShakeBuild.contains(.shaken) && stirShakeBuild.contains(.blended) {
                                        Text("Shake or Blend")
                                            .multilineTextAlignment(.leading)
                                            .dynamicTypeSize(.large).bold()
                                            .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                                        
                                    } else if stirShakeBuild.contains(.shaken) && !stirShakeBuild.contains(.blended) {
                                        Text("Shake")
                                            .multilineTextAlignment(.leading)
                                            .dynamicTypeSize(.large).bold()
                                            .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                                    }
                                    if stirShakeBuild.contains(.stirred) {
                                        Text("Stir")
                                            .multilineTextAlignment(.leading)
                                            .dynamicTypeSize(.large).bold()
                                            .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                                        
                                    }
                                    if stirShakeBuild.contains(.swizzle) {
                                        Text("Swizzle")
                                            .multilineTextAlignment(.leading)
                                            .dynamicTypeSize(.large).bold()
                                            .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                                        
                                    }
                                }
                                
                                
                                if let ice = viewModel.cocktail.ice?.rawValue {
                                    HStack {
                                        Text("Ice: ")
                                            .dynamicTypeSize(.xLarge).bold()
                                        Text(ice)
                                            .dynamicTypeSize(.large)
                                            .multilineTextAlignment(.leading)
                                    }
                                }
                                
                                
                                if  viewModel.cocktail.garnish != nil {
                                    VStack{
                                        Text("Garnish:")
                                            .dynamicTypeSize(.xLarge).bold()
                                        if let garnishes = viewModel.cocktail.garnish {
                                            ForEach(garnishes, id: \.self) { garnish in
                                                Text("\(garnish.rawValue)")
                                                    .multilineTextAlignment(.leading)
                                                    .dynamicTypeSize(.large)
                                                
                                            }
                                            
                                        }
                                    }
                                    .padding(10)
                                }
                                if viewModel.cocktail.author != nil {
                                    AuthorView(cocktail: viewModel.cocktail)
                                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                                    
                                }
                                
                                if let buildOrder = viewModel.cocktail.buildOrder {
                                    NavigationLink("Build Order") {
                                        BuildOrderView(buildOrder: buildOrder)
                                    }
                                    .buttonStyle(whiteButton())
                                }
                                
                                if !viewModel.cocktail.cocktailName.lowercased().contains("punch") {
                                    BatchButton(cocktail: viewModel.cocktail)
                                        .padding()
                                }
                                
                                
                                
                                
                                Rectangle()
                                    .fill(.black)
                                    .frame(width: 60, height: 40, alignment: .leading)
                                
                                
//                            }
                        }
                            .frame(width: geo.size.width * 0.75)
//                            .frame(height: geo.size.height)
                        
                    }
                    .frame(width: geo.size.width)
                    .frame(minHeight: geo.size.height)
                }
            }
        }
        }
        .task {
            prepItems = viewModel.findPrepItems()
        }
    }
    
    //TODO: REFACTOR THIS 
    func orderSpec() -> [CocktailIngredient] {
        var orderedSpec: [CocktailIngredient] = []
        
        orderedSpec.append(contentsOf: viewModel.cocktail.spec.filter({ $0.ingredient.category == "Herbs"}))
        orderedSpec.append(contentsOf: viewModel.cocktail.spec.filter({ $0.ingredient.category == "Fruit"}))
        orderedSpec.append(contentsOf: viewModel.cocktail.spec.filter({ $0.ingredient.category == "Bitters"}))
        orderedSpec.append(contentsOf: viewModel.cocktail.spec.filter({ $0.ingredient.category == "Other N/A"}))
        orderedSpec.append(contentsOf: viewModel.cocktail.spec.filter({ $0.ingredient.category == "Seasoning"}))
        orderedSpec.append(contentsOf: viewModel.cocktail.spec.filter({ $0.ingredient.category == "Syrups"}))
        orderedSpec.append(contentsOf: viewModel.cocktail.spec.filter({ $0.ingredient.category == "Juice"}))
        orderedSpec.append(contentsOf: viewModel.cocktail.spec.filter({ $0.ingredient.category == "Liqueurs"}))
        orderedSpec.append(contentsOf: viewModel.cocktail.spec.filter({ $0.ingredient.category == "Fortified Wine"}))
        orderedSpec.append(contentsOf: viewModel.cocktail.spec.filter({ $0.ingredient.category == "Amari"}))
        orderedSpec.append(contentsOf: viewModel.cocktail.spec.filter({ $0.ingredient.category == "Whiskies"}))
        orderedSpec.append(contentsOf: viewModel.cocktail.spec.filter({ $0.ingredient.category == "Rum"}))
        orderedSpec.append(contentsOf: viewModel.cocktail.spec.filter({ $0.ingredient.category == "Gin"}))
        orderedSpec.append(contentsOf: viewModel.cocktail.spec.filter({ $0.ingredient.category == "Brandy"}))
        orderedSpec.append(contentsOf: viewModel.cocktail.spec.filter({ $0.ingredient.category == "Agave"}))
        orderedSpec.append(contentsOf: viewModel.cocktail.spec.filter({ $0.ingredient.category == "Vodka"}))
        orderedSpec.append(contentsOf: viewModel.cocktail.spec.filter({ $0.ingredient.category == "Other Alcohol"}))
        orderedSpec.append(contentsOf: viewModel.cocktail.spec.filter({ $0.ingredient.category == "Sodas"}))
        orderedSpec.append(contentsOf: viewModel.cocktail.spec.filter({ $0.ingredient.category == "Wine"}))
        
        return orderedSpec
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
                    .multilineTextAlignment(.leading)
                    .dynamicTypeSize(.large)
                    .minimumScaleFactor(0.02)
            }
            VStack {
            if place != "" {
                
                    Text(place)
                        .dynamicTypeSize(.large)
                        .multilineTextAlignment(.leading)
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

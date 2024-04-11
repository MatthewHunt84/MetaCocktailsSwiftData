//
//  RecipeIngredientsView.swift
//  MetaCocktails
//
//  Created by James on 8/9/23.
//

import SwiftUI

struct BuildOrderView: View {
    
    let buildOrder: Build
    var viewModel: RecipeViewModel
    
    var body: some View {

        VStack(alignment: .center) {
            
            HStack(alignment: .center) {


                Spacer()
                
                Text("Build Order")
                    .font(Layout.header)
                
                Spacer()
                
            }
            .padding(.bottom, 10)
            
            VStack(alignment: .leading) {
                
                ForEach(buildOrder.instructions) { build in
                    HStack(alignment: .top) {
                        Text("\(build.step)")
                            .font(Layout.buildStep)
                        Text("\(build.method)")
                            .font(Layout.buildBody)
                    }
                    .font(Layout.buildBody)
                    .listRowBackground(Color.darkGrey)
                    
                    Divider()
                    
                }
            }
            
            Spacer()
        }
    }
}

struct RecipeViewBack: View {
    var viewModel: RecipeViewModel
    let geometry: GeometryProxy
    
    var body: some View {
        
            ZStack {
                
                Border()
                
                BuildOrderView(buildOrder: viewModel.cocktail.buildOrder ?? ramosGinFizzBuild, viewModel: viewModel)
                    .frame(width: geometry.size.width * 0.85)
                    .padding(.top, 60)
            }
    }
}

struct RecipeView: View {
    
    @Bindable var viewModel: RecipeViewModel
    @State private var prepItems: [CocktailIngredient] = []
    @Namespace var topID
    
    var body: some View {
        
        GeometryReader { geo in
            
            ScrollViewReader { scrollReader in
                
                ScrollView {
                    
                    ZStack {
                        
                        RecipeViewBack(viewModel: viewModel, geometry: geo)
                            .rotation3DEffect(Angle(degrees: viewModel.backDegree), axis: (x: 0, y: 1, z: 0))
                            .id(topID)
                        
                        VStack(alignment: .center) {
                            
                            ZStack() {
                                
                                Border()
                                    .frame(minHeight: geo.size.height)
                                
                                VStack(alignment: .leading, spacing: 20) {
                                    

                                    GlasswareView(cocktail: viewModel.cocktail)
                                    
                                    SpecView(cocktail: viewModel.cocktail)
                                    
                                    GarnishView(cocktail: viewModel.cocktail)
                                    
                                    MethodIceView(cocktail: viewModel.cocktail)
                                    
                                    if viewModel.cocktail.buildOrder != nil {
                                        
                                        Button("Build Order") {
                                            viewModel.flipCard()
                                            withAnimation(.easeOut(duration: viewModel.durationAndDelay)) {
                                                scrollReader.scrollTo(topID, anchor: .top)
                                            }
                                        }
                                        .buttonStyle(.custom)
                                        .tint(.cyan)
                                        .disabled(viewModel.isFlipped)
                                    }
                                    
                                    if viewModel.cocktail.author != nil {
                                        AuthorView(cocktail: viewModel.cocktail)
                                            .frame(maxWidth: .infinity, alignment: .center)
                                        
                                    }
                                }
                                .padding(.top, 50)
                                .padding(.bottom, 70)
                                .frame(width: geo.size.width * 0.75)
                            }
                            
                        }
                        .frame(minHeight: geo.size.height)
                        .rotation3DEffect(Angle(degrees: viewModel.frontDegree), axis: (x: 0, y: 1, z: 0))
                        
                        backToRecipeViewButton(viewModel: viewModel)
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        RecipeTitleView(cocktail: viewModel.cocktail)
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        BackButton()
                    }
                }
                .task {
                    prepItems = viewModel.findPrepItems()
                }
            }
        }
    }
}

private struct backToRecipeViewButton: View {
    var viewModel: RecipeViewModel
    var body: some View {
        VStack {
            
            HStack {

                if viewModel.backDegree == 0 {
                    Button("", systemImage: "arrowshape.turn.up.left.fill") {
                        viewModel.flipCard()
                    }
                    .foregroundStyle(.cyan)
                    .padding(.leading, 40)
                    .padding(.top, 60)
                }
                
                Spacer()
            }
            
            Spacer()
        }
    }
}


private struct BorderTop: View {
    var color: Color
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .top) {
                
                Image(.backgroundTop)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.darkGrey)
                
                Image(.borderTop)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(color)
                    .background(.clear)
            }
        }
    }
}



private struct BorderSides: View {
    var color: Color
    var body: some View {
        GeometryReader { geo in
            VStack {
                Spacer()
                
                ZStack {
                    Image(.backgroundSides)
                        .resizable()
                        .foregroundStyle(.darkGrey)
                        .frame(height: geo.size.height * 0.8)
                    
                    Image(.borderSides)
                        .resizable()
                        .foregroundStyle(color)
                        .background(.clear)
                        .frame(height: geo.size.height * 0.8)
                }
                
                Spacer()
            }
        }
    }
}

struct Border: View {
    var color: Color = .brandPrimaryGold
    var body: some View {
        GeometryReader { geo in
            
            VStack {
                Spacer()
                
                ZStack {
                    BorderSides(color: color)
                    
                    VStack(alignment: .leading) {
                        BorderTop(color: color)
                        
                        Spacer()
                        
                        BorderTop(color: color)
                            .rotationEffect(.degrees(180))
                    }
                }
                Spacer()
            }
        }
    }
}


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
            .foregroundStyle(.darkGrey)
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
    static var buildBody: Font = .system(size: 12, weight: .light)
    static var buildStep: Font = .system(size: 12, weight: .bold)
}

struct RecipeTitleView: View {
    var cocktail: Cocktail
    var body: some View {
        if cocktail.collection?.collectionLogo != nil {
            RecipeTitleViewWithCollection(cocktail: cocktail)
        } else {
            Text(cocktail.cocktailName)
                .fontDesign(.serif)
                .font(.largeTitle)
                .lineLimit(1)
                .minimumScaleFactor(0.4)
        }
    }
}

struct RecipeTitleViewWithCollection: View {
    var cocktail: Cocktail
    var body: some View {
        HStack {
            Text(cocktail.cocktailName.replacingOccurrences(of: (" (W&G Version)"), with: ""))
                .fontDesign(.serif)
                .font(.largeTitle)
                .lineLimit(1)
                .minimumScaleFactor(0.4)
            if let logo = cocktail.collection?.collectionLogo {
                    logo
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.secondary)
                    .padding(6)
            }
        }
    }
}

struct GlasswareView: View {
    
    var cocktail: Cocktail
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 5) {
                Text("Glassware:")
                    .font(Layout.header)
                Text(cocktail.glasswareType.rawValue)
                    .dynamicTypeSize(.large)
                    .multilineTextAlignment(.leading)
            }
            
            Spacer()
            
            cocktail.glasswareType.glassImage(cocktail: cocktail)
                .resizable()
                .frame(width: 70, height: 70, alignment: .center)
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 10))
             
        }
    }
}


struct SpecView: View {
    var cocktail: Cocktail
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            
            HStack {
                Text("Cocktail Spec:")
                    .font(Layout.header)
                
                Spacer()
                Button(action: { print("I don't work yet") }, label: {
                    HStack {
                        Text("Batch")
                        Image(systemName: "chevron.forward")
                    }
                    .foregroundStyle(.cyan)
                    .font(Layout.header)
                })
            }
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
    let methodText: String
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            Text("Method")
                .font(Layout.header)
            Text(methodText)
                .font(Layout.body)
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
        } else {
            VStack(alignment: .leading, spacing: 5) {
                Text("Ice")
                    .font(Layout.header)
                Text("None")
                    .font(Layout.body)
            }
        }
    }
}

struct MethodIceView: View {
    var cocktail: Cocktail
    var body: some View {
        
//        if let methodText = getMethodText() {
            HStack {
                MethodView(methodText: "methodText")
                Spacer()
                IceView(cocktail: cocktail)
            }
//        } else {
//            HStack {
//                IceView(cocktail: cocktail)
//            }
//        }
    }
    
//    func getMethodText() -> String? {
//        if let stirShakeBuild = cocktail.compiledTags.styles {
//            if stirShakeBuild.contains(.built) {
//                return "Shake or Blend"
//            }
//            if stirShakeBuild.contains(.shaken) && stirShakeBuild.contains(.blended) {
//                return "Build in glass"
//            } else if stirShakeBuild.contains(.shaken) && !stirShakeBuild.contains(.blended) {
//                return"Shake"
//            }
//            if stirShakeBuild.contains(.stirred) {
//                return"Stir"
//            }
//            if stirShakeBuild.contains(.swizzle) {
//                return"Swizzle"
//            }
//        }
//        return nil
//    }
}

struct GarnishView: View {
    var cocktail: Cocktail
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Garnish")
                .font(Layout.header)
            
            if let garnishes = cocktail.garnish {
                
                if garnishes.count == 2 {
                    HStack(alignment: .top) {
                        Text("\(garnishes.first!.rawValue)")
                        
                        Text("+")
                            .bold()
                        
                        Text("\(garnishes.last!.rawValue)")
                    }
                } else {
                    ForEach(garnishes, id: \.self) { garnish in
                        Text("\(garnish.rawValue)")
                            .font(Layout.body)
                    }
                }
            } else {
                Text("None")
                    .font(Layout.body)
            }
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
                .font(Layout.header)
            if author != "" {
                Text(author)
                    .font(Layout.body)
            }
            if place != "" {
                    Text(place)
                        .dynamicTypeSize(.large)
                        .multilineTextAlignment(.center)
                }
                if year != "" {
                    Text("\(year)")
                        .dynamicTypeSize(.large)
                }
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    return RecipeView(viewModel: RecipeViewModel(cocktail: ramosGinFizz))
        .modelContainer(preview.container)
}

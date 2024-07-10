//
//  RecipeIngredientsView.swift
//  MetaCocktails
//
//  Created by James on 8/9/23.
//

import SwiftUI

struct RecipeView: View {
    @Bindable var viewModel: RecipeViewModel
    @State private var prepItems: [Ingredient] = []
    @Namespace var topID
    
    var body: some View {
        
        GeometryReader { geo in
            
            ScrollViewReader { scrollReader in
                
                ScrollView {
                    
                    RecipeFlipCardView(viewModel: viewModel, geo: geo, topID: topID, scrollReader: scrollReader)
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
                            .font(calculateFontSize(numberOfSteps: buildOrder.instructions.count, body: false))
                        Text("\(build.method)")
                            .font(calculateFontSize(numberOfSteps: buildOrder.instructions.count, body: true))
                    }
                    .listRowBackground(Color.darkGrey)
                    
                    Divider()
                    
                }
            }
            
            Spacer()
        }
    }
    
    func calculateFontSize(numberOfSteps: Int, body: Bool) -> Font {
        let weight: Font.Weight = body ? .regular : .bold
        let size: CGFloat = {
            switch numberOfSteps {
            case 0...5: 16
            case 6...8: 14
            default: 11
            }
        }()
        
        return .system(size: size, weight: weight)
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

struct backToRecipeViewButton: View {
    var viewModel: RecipeViewModel
    var body: some View {
        VStack {
            
            HStack {

                if viewModel.backDegree == 0 {
                    Button("", systemImage: "arrowshape.turn.up.left.fill") {
                        viewModel.flipCard()
                    }
                    .foregroundStyle(.blueTint)
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
    static var buildBodySmall: Font = .system(size: 10, weight: .light)
    static var buildStepSmall: Font = .system(size: 10, weight: .bold)
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
struct SpecIngredientView: View {
    var ingredient: Ingredient
    @State private var isShowingIngredientInfo : Bool = false
    
    var body: some View {
        let number = NSNumber(value: ingredient.value)
        VStack{
            HStack {
                Text("\(number) \(ingredient.unit.rawValue)")
                    .font(Layout.specMeasurement)
                if ingredient.ingredientBase.prep != nil {
                    NavigationLink {
                        PrepRecipeView(prep: ingredient.ingredientBase.prep!)
                    } label: {
                        Text(ingredient.ingredientBase.name)
                            .font(Layout.body)
                            .tint(.cyan)
                    }
                } else {
                    Text("\(ingredient.ingredientBase.name)")
                        .font(Layout.body)
                        
                }
                if ingredient.ingredientBase.info != nil {
                    Image(systemName: "questionmark.circle.fill")
                        .foregroundStyle(.blue)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.25)) {
                                isShowingIngredientInfo.toggle()
                            }
                            
                        }
                        
                       
                }
            }
            .multilineTextAlignment(.leading)
            if isShowingIngredientInfo {
                Text(ingredient.ingredientBase.info!)
                    .font(.footnote)
                    .foregroundStyle(.brandPrimaryGold)
                
                    
            }
        }
    }
}

struct SpecView: View {
    var cocktail: Cocktail
    @State private var isShowingSheet = false
    @State private var isShowingBatchView = false 
    @Binding var isShowingPrompt: Bool
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                VStack(alignment: .leading, spacing: 6) {
                    
                    HStack {
                        Text("Cocktail Spec:")
                            .font(Layout.header)
                        
                        Spacer()
                        
                        Button {
                            isShowingPrompt.toggle()
                        } label: {
                            Text("Batch")
                            Image(systemName: "chevron.forward")
                        }
                        .foregroundStyle(.blueTint)
                        .font(Layout.header)
//                        .sheet(isPresented: $isShowingSheet, content: {
//                            NumberOfCocktailsModal(cocktail: cocktail, isShowingBatchView: $isShowingBatchView, isPresented: $isShowingSheet)
//                                .presentationDetents([.medium, .large])
//                                .presentationBackgroundInteraction(.automatic)
//                                .presentationBackground(.thinMaterial)
//                        })
                        
                       
                   
//                        .fullScreenCover(isPresented: $isShowingBatchView) {
//                            CBCLoadedCocktailView(cocktail: cocktail)
//                        }
                        
                    }
                    .padding(.bottom, 5)
                    
                    ForEach(orderSpec(), id: \.id) { ingredient in
                        SpecIngredientView(ingredient: ingredient)
                    }
                }
            }
        }
    }
    
    //TODO: REFACTOR THIS
    func orderSpec() -> [Ingredient] {
        var orderedSpec: [Ingredient] = []
        
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.category.rawValue == "Herbs"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.category.rawValue == "Fruit"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.category.rawValue == "Bitters"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.category.rawValue == "Other N/A"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.category.rawValue == "Seasoning"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.category.rawValue == "Syrups"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.category.rawValue == "Juice"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.category.rawValue == "Liqueurs"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.category.rawValue == "Fortified Wine"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.category.rawValue == "Amari"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.category.rawValue == "Whiskies"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.category.rawValue == "Rum"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.category.rawValue == "Gin"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.category.rawValue == "Brandy"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.category.rawValue == "Agave"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.category.rawValue == "Vodka"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.category.rawValue == "Other Alcohol"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.category.rawValue == "Sodas"}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.category.rawValue == "Wine"}))
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
    var methodText: String?
    var body: some View {
        
        if let methodText {
            HStack {
                MethodView(methodText: methodText)
                Spacer()
                IceView(cocktail: cocktail)
            }
        } else {
            HStack {
                IceView(cocktail: cocktail)
            }
        }
    }
}

struct GarnishView: View {
    var cocktail: Cocktail
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Garnish")
                .font(Layout.header)
            
            if cocktail.garnish != []{
                
                if cocktail.garnish.count == 2 {
                    HStack(alignment: .top) {
                        Text("\(cocktail.garnish.first!)")
                        
                        Text("+")
                            .bold()
                        
                        Text("\(cocktail.garnish.last!)")
                    }
                } else {
                    ForEach(cocktail.garnish, id: \.self) { garnish in
                        Text("\(garnish.name)")
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

//#Preview {
//    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
//    return RecipeView(viewModel: RecipeViewModel(cocktail: mintJulep))
//        .modelContainer(preview.container)
//}


//
//  RecipeIngredientsView.swift
//  MetaCocktails
//
//  Created by James on 8/9/23.
//

import SwiftUI
import SwiftData

struct RecipeView: View {
    @Bindable var viewModel: RecipeViewModel
    @Namespace var topID
    
    var body: some View {
        
        ZStack {
            
            ColorScheme.background
                .ignoresSafeArea()
            
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
                        ToolbarItem(placement: .topBarTrailing) {
                            FavoriteButton(for: viewModel.cocktail)
                        }
                    }
                }
            }
        }
    }
}

struct FavoriteButton: View {
    let cocktail: Cocktail
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Cocktail.cocktailName) var cocktails: [Cocktail]
    
    init(for cocktail: Cocktail) {
        self.cocktail = cocktail
    }

    var body: some View {
        Button {
            withAnimation {
                cocktail.favorite.toggle()
            }
        } label: {
            if cocktail.favorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(ColorScheme.tintColor)
            } else {
                Image(systemName: "star")
                    .foregroundStyle(Color.gray)
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
                    .font(FontFactory.recipeCardHeader18B)
                Spacer()
            }
            .padding(.bottom, 10)
            
            VStack(alignment: .leading) {
                ForEach(buildOrder.instructions) { build in
                    HStack(alignment: .top) {
                        Text("\(build.step).")
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
            case 6...9: 14
            default: 12
            }
        }()
        
        return .system(size: size, weight: weight)
    }
}
struct IngredientRecipeView: View {
    
    let prep: Prep
    var viewModel: RecipeViewModel
    
    var body: some View {
        
        VStack(alignment: .center) {
            HStack(alignment: .center) {
                Spacer()
                Text("\(prep.prepIngredientName) recipe:")
                    .font(FontFactory.recipeCardHeader18B)
                Spacer()
            }
            .padding(.bottom, 10)
            
            VStack(alignment: .leading) {
                ForEach(prep.prepRecipe) { build in
                    HStack(alignment: .top) {
                        Text("\(build.step).")
                            .font(calculateFontSize(numberOfSteps: prep.prepRecipe.count, body: false))
                        Text("\(build.method)")
                            .font(calculateFontSize(numberOfSteps: prep.prepRecipe.count, body: true))
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
            case 6...9: 14
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
            if viewModel.isShowingIngredientRecipe{
                IngredientRecipeView(prep: viewModel.currentIngredientRecipe, viewModel: viewModel)
                    .frame(width: geometry.size.width * 0.85)
                    .padding(.top, 80)
                
            } else {
                BuildOrderView(buildOrder: viewModel.cocktail.buildOrder ?? ramosGinFizzBuild, viewModel: viewModel)
                    .frame(width: geometry.size.width * 0.85)
                    .padding(.top, 60)
            }
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
                        
                        //viewModel.isShowingIngredientRecipe = false
                            
                        
                        
                    }
                    .foregroundStyle(ColorScheme.interactionTint)
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
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .top) {
                
                Image(.backgroundTop)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(ColorScheme.recipeBackground)
                
                
                Image(.borderTop)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .background(.clear)
                    .foregroundStyle(ColorScheme.recipeBorder)
            }
        }
    }
}

private struct BorderBottom: View {
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .top) {
                
                Image(.backgroundTop)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(ColorScheme.recipeBackground)
                
                
                Image(.borderTop)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .background(.clear)
                    .foregroundStyle(ColorScheme.recipeBorderFlipped)
            }
        }
    }
}



private struct BorderSides: View {
    var body: some View {
        GeometryReader { geo in
            VStack {
                Spacer()
                
                ZStack {
                    Image(.backgroundSides)
                        .resizable()
                        .foregroundStyle(ColorScheme.recipeBackground)
                        .frame(height: geo.size.height * 0.8)
                    
                    Image(.borderSides)
                        .resizable()
                        .foregroundStyle(ColorScheme.recipeBorder)
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
                    BorderSides()
                    
                    VStack(alignment: .leading) {
                        BorderTop()
                        
                        Spacer()
                        
                        BorderBottom()
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
        }.buttonStyle(.customGreyButton)
    }
}

public struct CustomButtonStyle: ButtonStyle {
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .fontWeight(.medium)
            .padding(.vertical, 12)
            .foregroundStyle(ColorScheme.interactionTint)
            .frame(maxWidth: .infinity)
            .background(.tint, in: .rect(cornerRadius: 14, style: .continuous))
            .opacity(configuration.isPressed ? 0.4 : 1.0)
    }
}

extension ButtonStyle where Self == CustomButtonStyle {
    static var customGreyButton: CustomButtonStyle { .init() }
}


struct RecipeTitleView: View {
    var cocktail: Cocktail
    var body: some View {
        VStack {
            FontFactory.recipeHeader(title: cocktail.cocktailName)
                .lineLimit(1)
                .minimumScaleFactor(0.4)
            if let _ = cocktail.variation, let recipeSubheading = cocktail.collection?.recipeSubheading {
                FontFactory.mediumText(recipeSubheading, size: 12, color: .secondary)
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
                    .font(FontFactory.recipeCardHeader18B)
                Text(cocktail.glasswareType.rawValue)
                    .font(FontFactory.fontBody16)
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
    @Bindable var viewModel: RecipeViewModel
    let geo: GeometryProxy
    var topID: Namespace.ID
    var scrollReader: ScrollViewProxy
    
    var body: some View {
        VStack{
            HStack {
                pluralizedIngredientUnitText(for: ingredient)
                    .font(FontFactory.specMeasurement16B)
                if ingredient.ingredientBase.prep != nil {
                    Button{
                        viewModel.isShowingIngredientRecipe = true
                        viewModel.currentIngredientRecipe = ingredient.ingredientBase.prep ?? PrepBible.aPPBitters
                        viewModel.flipCard()
                        withAnimation(.easeOut(duration: viewModel.durationAndDelay)) {
                            scrollReader.scrollTo(topID, anchor: .top)
                        }
                    } label: {
                        Text(ingredient.ingredientBase.name)
                            .font(FontFactory.fontBody16)
                            .tint(ColorScheme.interactionTint)
                    }
                    .disabled(viewModel.isFlipped)
                } else {
                    Text("\(ingredient.ingredientBase.name)")

                        .font(FontFactory.fontBody16)

                }
                if ingredient.ingredientBase.info != nil {
                    Image(systemName: "questionmark.circle.fill")
                        .foregroundStyle(ColorScheme.interactionTint)
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
    @Bindable var viewModel: RecipeViewModel
    @State private var isShowingSheet = false
    @State private var isShowingBatchView = false
    @State private var showingModal = false
    @Binding var isShowingCocktailNotes: Bool
    @Binding var isShowingPrompt: Bool
    let geo: GeometryProxy
    var topID: Namespace.ID
    var scrollReader: ScrollViewProxy
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                VStack(alignment: .leading, spacing: 6) {
                    
                    HStack {
                        Text("Cocktail Spec:")
                            .font(FontFactory.recipeCardHeader18B)
                        if cocktail.collection == .originals {
                            Button {
                                showingModal = true
                            } label: {
                                Image(systemName: "bookmark.circle.fill")
                                    .tint(ColorScheme.interactionTint)
                            }
                        }

                        if cocktail.notes != nil {
                            Button {
                                isShowingCocktailNotes.toggle()
                            } label: {
                                Image(systemName: "questionmark.circle.fill")
                                    .foregroundStyle(ColorScheme.interactionTint)
                            }
                        }
                        Spacer()
                        
                        Button {
                            isShowingPrompt.toggle()
                        } label: {
                            Text("Batch")
                            Image(systemName: "chevron.forward")
                        }
                        .foregroundStyle(ColorScheme.interactionTint)
                        .font(FontFactory.recipeCardHeader18B)
                    }
                    .padding(.bottom, 5)
                    
                    ForEach(orderSpec(), id: \.id) { ingredient in
                        SpecIngredientView(ingredient: ingredient, viewModel: viewModel, geo: geo, topID: topID, scrollReader: scrollReader)
                    }
                }
                .fullScreenCover(isPresented: $showingModal) {
                    HistoricalCocktailModalView(
                        isPresented: $showingModal,
                        alertContent: HistoricalCocktailAlert.standard
                    ) {
                    }
                }
            }
        }
    }
    
    //TODO: REFACTOR THIS
    func orderSpec() -> [Ingredient] {
        var orderedSpec: [Ingredient] = []
        
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.umbrellaCategory == UmbrellaCategory.herbs.rawValue}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.umbrellaCategory == UmbrellaCategory.fruit.rawValue}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.umbrellaCategory == UmbrellaCategory.bitters.rawValue}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.umbrellaCategory == UmbrellaCategory.otherNonAlc.rawValue}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.umbrellaCategory == UmbrellaCategory.seasoning.rawValue}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.umbrellaCategory == UmbrellaCategory.syrups.rawValue}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.umbrellaCategory == UmbrellaCategory.juices.rawValue}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.umbrellaCategory == UmbrellaCategory.liqueurs.rawValue}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.umbrellaCategory == UmbrellaCategory.fortifiedWines.rawValue}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.umbrellaCategory == UmbrellaCategory.amari.rawValue}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.umbrellaCategory == UmbrellaCategory.otherAlcohol.rawValue}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.umbrellaCategory == UmbrellaCategory.whiskies.rawValue}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.umbrellaCategory == UmbrellaCategory.rums.rawValue}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.umbrellaCategory == UmbrellaCategory.gins.rawValue}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.umbrellaCategory == UmbrellaCategory.brandies.rawValue}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.umbrellaCategory == UmbrellaCategory.agaves.rawValue}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.umbrellaCategory == UmbrellaCategory.vodkas.rawValue}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.umbrellaCategory == UmbrellaCategory.soda.rawValue}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.umbrellaCategory == UmbrellaCategory.wines.rawValue}))
        return orderedSpec
    }
}

private struct MethodView: View {
    let methodText: String
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            Text("Method")
                .font(FontFactory.recipeCardHeader18B)
            Text(methodText)
                .font(FontFactory.fontBody16)
        }
    }
}

private struct IceView: View {
    var cocktail: Cocktail
    var body: some View {
        if let ice = cocktail.ice?.rawValue {
            VStack(alignment: .leading, spacing: 5) {
                Text("Ice")
                    .font(FontFactory.recipeCardHeader18B)
                Text(ice)
                    .font(FontFactory.fontBody16)
            }
        } else {
            VStack(alignment: .leading, spacing: 5) {
                Text("Ice")
                    .font(FontFactory.recipeCardHeader18B)
                Text("None")
                    .font(FontFactory.fontBody16)
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
                .font(FontFactory.recipeCardHeader18B)
            
            if cocktail.garnish != []{
                
                if cocktail.garnish.count == 2, 
                    let firstGarnishName = cocktail.garnish.first?.name,
                    let secondGarnishName = cocktail.garnish.last?.name {
                    HStack(alignment: .top) {
                        Text("\(firstGarnishName)")
                        
                        Text("+")
                            .bold()
                        
                        Text("\(secondGarnishName)")
                    }
                } else {
                    ForEach(cocktail.garnish, id: \.name) { garnish in
                        Text("\(garnish.name)")
                            .font(FontFactory.fontBody16)
                            .multilineTextAlignment(.leading)
                    }
                }
            } else {
                Text("None")
                    .font(FontFactory.fontBody16)
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
                .font(FontFactory.recipeCardHeader18B)
            if author != "" {
                Text(author)
                    .font(FontFactory.fontBody16)
            }
            if place != "" {
                FontFactory.regularText(place, size: 16)
                        .multilineTextAlignment(.center)
                }
                if year != "" {
                    FontFactory.regularText(year, size: 16)
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


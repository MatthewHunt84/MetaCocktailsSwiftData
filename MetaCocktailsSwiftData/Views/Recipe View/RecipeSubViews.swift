//
//  RecipeSubViews.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/27/24.
//

import SwiftUI

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


struct SpecView: View {
    var cocktail: Cocktail
    @Bindable var viewModel: RecipeViewModel
    @EnvironmentObject var cBCViewModel: CBCViewModel
    @State private var showingModal = false
    @Binding var isShowingCocktailNotes: Bool
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                VStack(alignment: .leading, spacing: 6) {
                    
                    HStack {
                        Text("Cocktail Spec")
                            .font(FontFactory.recipeCardHeader18B)
                        if cocktail.collection == .originals {
                            Button {
                                showingModal = true
                            } label: {
                                Image(systemName: "info.circle.fill")
                                    .tint(ColorScheme.interactionTint)
                            }
                        }
                        if cocktail.notes != nil {
                            Button {
                                isShowingCocktailNotes.toggle()
                            } label: {
                                Image(systemName: "info.circle")
                                    .foregroundStyle(ColorScheme.interactionTint)
                            }
                        }
                        
                        Spacer()
                        
                        NavigationLink {
                            CBCLoadedCocktailView()
                        } label: {
                            Text("Batch")
                            Image(systemName: "chevron.forward")
                        }
                        .foregroundStyle(ColorScheme.interactionTint)
                        .font(FontFactory.recipeCardHeader18B)
                        .simultaneousGesture(TapGesture().onEnded {
                            cBCViewModel.chosenCocktail = cocktail
                            cBCViewModel.convertLoadedCocktail(for: cocktail)
                            cBCViewModel.convertIngredientsToBatchCellData()
                        })
                    }
                    .padding(.bottom, 5)
                    
                    ForEach(orderSpec(), id: \.id) { ingredient in
                        SpecIngredientView(ingredient: ingredient, viewModel: viewModel)
                    }
                }
                .sheet(isPresented: $showingModal) {
                    HistoricalCocktailModalView(
                        cocktail: viewModel.cocktail,
                        presented: $showingModal
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
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.umbrellaCategory == UmbrellaCategory.otherAlcohol.rawValue}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.umbrellaCategory == UmbrellaCategory.syrups.rawValue}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.umbrellaCategory == UmbrellaCategory.juices.rawValue}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.umbrellaCategory == UmbrellaCategory.liqueurs.rawValue}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.umbrellaCategory == UmbrellaCategory.fortifiedWines.rawValue}))
        orderedSpec.append(contentsOf: cocktail.spec.filter({ $0.ingredientBase.umbrellaCategory == UmbrellaCategory.amari.rawValue}))
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

struct SpecIngredientView: View {
    var ingredient: Ingredient
    @State private var isShowingIngredientInfo : Bool = false
    @Bindable var viewModel: RecipeViewModel
    
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
                        }
                    } label: {
                        Text(ingredient.ingredientBase.name)
                            .font(FontFactory.fontBody16)
                            .tint(ColorScheme.interactionTint)
                    }
                    .disabled(viewModel.backDegree == 0) // fix me!
                } else {
                    Text("\(ingredient.ingredientBase.name)")
                        .font(FontFactory.fontBody16)

                }
                if ingredient.ingredientBase.info != nil {
                    Image(systemName: "info.circle")
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
                    .font(FontFactory.goldInfoFootnote13)
                    .foregroundStyle(.brandPrimaryGold)
                
                
            }
        }
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
                    .multilineTextAlignment(.leading)
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

struct FadingEdgesScrollView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                content
                    .padding(.vertical, geometry.size.height * 0.05)
            }
            .mask(
                VStack(spacing: 0) {
                    LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom)
                        .frame(height: geometry.size.height * 0.05)
                    Rectangle().fill(Color.black)
                    LinearGradient(gradient: Gradient(colors: [.black, .clear]), startPoint: .top, endPoint: .bottom)
                        .frame(height: geometry.size.height * 0.05)
                }
            )
        }
    }
}

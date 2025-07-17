//
//  RecipeSubViews.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/27/24.
//

import SwiftUI

struct FlipCardNavigationHeader: View {
    
    @Environment(\.dismiss) private var dismiss
    var viewModel: RecipeViewModel
    var body: some View {
        VStack(spacing: 0) {
            
            HStack {
                
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 24))
                        .foregroundStyle(ColorScheme.interactionTint)
                }
                
                Spacer()
                
                FontFactory.recipeHeader(title: viewModel.cocktail.cocktailName, isHistoric: viewModel.cocktail.collection == .originals)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                
                Spacer()
                
                FavoriteButton(for: viewModel.cocktail)
            }
            
            if let _ = viewModel.cocktail.variation, let recipeSubheading = viewModel.cocktail.collection?.recipeSubheading {
                FontFactory.historicText(recipeSubheading, size: 18, color: .secondary)
            }
        }
    }
}

struct HistoricalRecipeView: View {
    
    @Binding var showingHistoricInfo: Bool
    @Binding var scrollID: Cocktail.ID?
    var recommendedCocktailID: UUID? = nil
    let historicText = "This cocktail is presented for historical context. Since its creation, there have been significant changes in techniques, ingredients, and the overall tastes of cocktail enthusiasts."
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Text("~")
                
                Text("Historical Recipe")
                    .lineLimit(1)
                
                Button {
                    withAnimation(.bouncy) {
                        showingHistoricInfo.toggle()
                    }
                } label: {
                    Image(systemName: "info.circle.fill")
                        .tint(ColorScheme.interactionTint)
                        .foregroundStyle(ColorScheme.interactionTint)
                        .font(.system(size: 14))
                        .padding(.bottom, 10)
                        .padding(.leading, 4)
                    
                }
                
                Text("~")
            }
            .font(.custom("Zapfino", size: 20))
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, alignment: .center)
            
            if showingHistoricInfo {
                
                VStack {
                    
                    Text(historicText)
                        .font(FontFactory.italicFont(size: 16))
                        .multilineTextAlignment(.center)
                    
                    UniversalButton(buttonText: "Recommended Spec", includeBorder: true, color: ColorScheme.recipeBorder) {
                        withAnimation(.easeInOut) {
                            scrollID = recommendedCocktailID
                        }
                    }
                }
                .transition(.move(edge: .top).combined(with: .blurReplace))
            }
        }
    }
}

struct NoteView: View {
    let note: String
    
    var body: some View {
        Text(note)
            .font(FontFactory.italicFont(size: 16))
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, alignment: .center)
    }
}

struct GlasswareView: View {
    
    var cocktail: Cocktail
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 5) {
                Text("Glassware")
                    .font(FontFactory.recipeCardHeader18B)
                Text(cocktail.glasswareType.rawValue)
                    .font(FontFactory.fontBody16)
            }
            
            Spacer()
            
            cocktail.glasswareType.glassImage(cocktail: cocktail)
                .resizable()
                .frame(width: 70, height: 70, alignment: .center)
                .padding(.trailing, 10)
            
        }
    }
}


struct SpecView: View {
    var cocktail: Cocktail
    @Bindable var viewModel: RecipeViewModel
    @EnvironmentObject var cBCViewModel: CBCViewModel
    @Binding var isShowingCocktailNotes: Bool
    @Binding var specInMl: Bool
    var body: some View {
        NavigationStack{
            ZStack{
                
                VStack(alignment: .leading, spacing: 6) {
                    
                    HStack {
                        
                        Text("Cocktail Spec")
                            .font(FontFactory.recipeCardHeader18B)
                        Button {
                            specInMl.toggle()
                        } label: {
                            Text("(\(specInMl ? "ml" : "oz"))")
                                .font(FontFactory.recipeCardHeader18B)
                                .tint(ColorScheme.interactionTint)
                                .foregroundStyle(ColorScheme.interactionTint)
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
                        SpecIngredientView(ingredient: ingredient, viewModel: viewModel, showMls: $specInMl)
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
    @Binding var showMls: Bool
    
    var body: some View {
        VStack {
            
            HStack {
                
                pluralizedIngredientText(for: ingredient, displayMls: showMls)
                    .font(FontFactory.specMeasurement16B)
                
                if let ingredientPrep = ingredient.ingredientBase.prep {
                    
                    Button {
                        viewModel.presentOverlay(for: ingredientPrep)
                    } label: {
                        Text(ingredient.ingredientBase.name)
                            .font(FontFactory.fontBody16)
                            .tint(ColorScheme.interactionTint)
                            .foregroundStyle(ColorScheme.interactionTint)
                    }
                } else {
                    Text("\(ingredient.ingredientBase.name)")
                        .font(FontFactory.fontBody16)
                }
                
                if ingredient.ingredientBase.info != nil {
                    Image(systemName: "info.circle.fill")
                        .foregroundStyle(ColorScheme.interactionTint)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.25)) {
                                isShowingIngredientInfo.toggle()
                            }
                        }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
            
            if isShowingIngredientInfo, let info = ingredient.ingredientBase.info {
                Text(info)
                    .font(FontFactory.ingredientInfoFootnote13)
                    .foregroundStyle(ColorScheme.secondaryClone)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
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
            Text("Author")
                .font(FontFactory.recipeCardHeader18B)
            if author != "" {
                Text(author)
            }
            if place != "" {
                Text(place)
                
            }
            if year != "" {
                Text(year)
            }
        }
        .multilineTextAlignment(.center)
        .font(FontFactory.fontBody16)
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
            }
            .scrollIndicators(.hidden)
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

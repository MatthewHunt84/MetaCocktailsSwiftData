//
//  RecipeIngredientsView.swift
//  MetaCocktails
//
//  Created by James on 8/9/23.
//

import SwiftUI

struct RecipeView: View {
    //@EnvironmentObject var cBCViewModel: CBCViewModel
 
    @Bindable var viewModel: RecipeViewModel
    let recipeSpacing: CGFloat = 2
    var cocktailFrameSize = CGFloat(125)
    @State private var prepItems: [CocktailIngredient] = []

    var body: some View {
        NavigationStack{
            BackButton()
            GeometryReader{ geo in
                ScrollView{
                    VStack{
                        viewModel.cocktail.glasswareType.glassImage(cocktail: viewModel.cocktail)
                            .resizable()
                            .frame(width: 125, height: 125, alignment: .center)
                        
                            .padding(10)
                        Text(viewModel.cocktail.cocktailName)
                            .dynamicTypeSize(.xxLarge).bold()
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                            .padding(10)
                        CocktailProfileView(cocktail: viewModel.cocktail)
                        
                        VStack{
                            Text("Glassware:")
                                .dynamicTypeSize(.xLarge).bold()
                            Text(viewModel.cocktail.glasswareType.rawValue)
                                .dynamicTypeSize(.large)
                                .multilineTextAlignment(.center)
                        }
                        .padding(10)
                        
                        VStack {
                            
                            Text("Cocktail Spec:")
                                .dynamicTypeSize(.xLarge).bold()
                            
                            ForEach(viewModel.cocktail.spec, id: \.id) { ingredient in
                                let number = NSNumber(value: ingredient.value)
                                HStack {
                                    Text("\(number)")
                                        .dynamicTypeSize(.large).bold()
                                    Text("\(ingredient.unit.rawValue)")
                                        .multilineTextAlignment(.leading)
                                        .dynamicTypeSize(.large)
                                    if ingredient.prep != nil {
                                        NavigationLink {
                                            PrepRecipeView(prep: ingredient.prep!)
                                        } label: {
                                            Text(ingredient.ingredient.name)
                                                .dynamicTypeSize(.large)
                                                .tint(.cyan)
                                            
                                        }
                                    } else {
                                        Text("\(ingredient.ingredient.name)")
                                            .multilineTextAlignment(.leading)
                                            .dynamicTypeSize(.large)
                                    }
                                }
                                
                                
                                
                            }
                            .frame(maxWidth: geo.size.width * 0.9, alignment: .leading)
                            
                            //.offset(x: geo.size.width/2-140)
                            
                            
                            if let stirShakeBuild = viewModel.cocktail.tags.styles {
                                if stirShakeBuild.contains(.built) {
                                    Text("Build in glass")
                                        .multilineTextAlignment(.center)
                                        .dynamicTypeSize(.large).bold()
                                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                                    
                                }
                                if stirShakeBuild.contains(.shaken) && stirShakeBuild.contains(.blended) {
                                    Text("Shake or Blend")
                                        .multilineTextAlignment(.center)
                                        .dynamicTypeSize(.large).bold()
                                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                                    
                                } else if stirShakeBuild.contains(.shaken) && !stirShakeBuild.contains(.blended) {
                                    Text("Shake")
                                        .multilineTextAlignment(.center)
                                        .dynamicTypeSize(.large).bold()
                                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                                }
                                if stirShakeBuild.contains(.stirred) {
                                    Text("Stir")
                                        .multilineTextAlignment(.center)
                                        .dynamicTypeSize(.large).bold()
                                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                                    
                                }
                                if stirShakeBuild.contains(.swizzle) {
                                    Text("Swizzle")
                                        .multilineTextAlignment(.center)
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
                                        .multilineTextAlignment(.center)
                                }
                            }
                            
                            
                            if  viewModel.cocktail.garnish != nil {
                                VStack{
                                    Text("Garnish:")
                                        .dynamicTypeSize(.xLarge).bold()
                                    if let garnishes = viewModel.cocktail.garnish {
                                        ForEach(garnishes, id: \.self) { garnish in
                                            Text("\(garnish.rawValue)")
                                                .multilineTextAlignment(.center)
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
                            
                         
                           
                            BatchButton(cocktail: viewModel.cocktail)
                                .padding()
                            
                            
                         
                            Rectangle()
                                .fill(.black)
                                .frame(width: 60, height: 40, alignment: .center)
                            
                            
                        }
                        
                    }
                    .frame(width: geo.size.width)
                    .frame(minHeight: geo.size.height)
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

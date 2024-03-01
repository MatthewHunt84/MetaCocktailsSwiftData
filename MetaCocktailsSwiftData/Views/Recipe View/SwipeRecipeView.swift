//
//  SwipeRecipeView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/20/24.
//

import SwiftUI

struct SwipeRecipeView: View {
    
    let recipeSpacing: CGFloat = 2
    var cocktailFrameSize = CGFloat(125)
    //@State var cocktail: Cocktail
    @State var variations: [Cocktail]
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    //    @Query(sort: \Cocktail.cocktailName) var cocktails: [Cocktail]
    
    var body: some View {
        NavigationStack {
            GeometryReader{ geo in
                VStack{
                    HStack{
                        Button{
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.backward")
                                .tint(.cyan)
                            Text("Back")
                                .tint(.cyan)
                        }
                        Spacer()
                    }
                    TabView {
                        ForEach($variations, id: \.self) { cocktail in
                            
                            ScrollView(.vertical){
                                VStack {
                                    
                                    cocktail.glasswareType.wrappedValue.glassImage(cocktail: cocktail.wrappedValue)
                                        .resizable()
                                        .frame(width: 125, height: 125, alignment: .center)
                                    
                                        .padding(10)
                                    Text(cocktail.cocktailName.wrappedValue)
                                        .dynamicTypeSize(.xxLarge).bold()
                                        .multilineTextAlignment(.center)
                                        .lineLimit(2)
                                        .padding(10)
                                    CocktailProfileView(cocktail: cocktail.wrappedValue)
                                    
                                    VStack{
                                        Text("Glassware:")
                                            .dynamicTypeSize(.xLarge).bold()
                                        Text(cocktail.glasswareType.wrappedValue.rawValue)
                                            .dynamicTypeSize(.large)
                                            .multilineTextAlignment(.center)
                                    }
                                    .padding(10)
                                    
                                    
                                    Text("Cocktail Spec:")
                                        .dynamicTypeSize(.xLarge).bold()
                                    
                                    
                                    ForEach(cocktail.spec.wrappedValue, id: \.id) { ingredient in
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
                                        .padding(0.2)
                                       
                                        
                                        
                                        
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .offset(x: geo.size.width/2-140)
                                    
                                    if let stirShakeBuild = cocktail.tags.styles.wrappedValue {
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
                                    
                                    
                                    if let ice = cocktail.ice.wrappedValue?.rawValue {
                                        HStack {
                                            Text("Ice: ")
                                                .dynamicTypeSize(.xLarge).bold()
                                            Text(ice)
                                                .dynamicTypeSize(.large)
                                                .multilineTextAlignment(.center)
                                        }
                                    }
                                    
                                    
                                    if  cocktail.garnish.wrappedValue != nil {
                                        VStack{
                                            Text("Garnish:")
                                                .dynamicTypeSize(.xLarge).bold()
                                            
                                            if let garnishes = cocktail.garnish.wrappedValue {
                                                ForEach(garnishes, id: \.self) { garnish in
                                                    Text("\(garnish.rawValue)")
                                                        .multilineTextAlignment(.center)
                                                        .dynamicTypeSize(.large)
                                                    
                                                }
                                                
                                            }
                                        }
                                        .padding(10)
                                    }
                                    
                                    
                                    
                                    
                                    if cocktail.author.wrappedValue != nil {
                                        AuthorView(cocktail: cocktail.wrappedValue)
                                            .padding()
                                    }
                                    if let buildOrder = cocktail.buildOrder.wrappedValue {
                                        NavigationLink("Build Order") {
                                            BuildOrderView(buildOrder: buildOrder)
                                                .padding()
                                        }
                                        
                                        
                                        .buttonStyle(whiteButton())
                                    }
                                    
                                    BatchButton(cocktail: cocktail.wrappedValue)
                                        .padding()
                                    
                                    
                                    
                                    Rectangle()
                                        .fill(.black)
                                        .frame(width: 60, height: 40, alignment: .center)
                                    
                                }
                                .frame(width: geo.size.width)
                                .frame(minHeight: geo.size.height)
                            }
                            
                            
                        }
                    }
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                
            }
        }
    }
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    return SwipeRecipeView(variations: [cloverClub, airMail, airMailWnG, peanutButterFalcon])
        .modelContainer(preview.container)
       
}


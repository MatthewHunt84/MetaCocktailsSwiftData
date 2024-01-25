//
//  CocktailMenuView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/24/24.
//

import SwiftUI

struct CocktailMenuView: View {
    
    var cocktail: Cocktail
    var cocktailFrameSize = CGFloat(125)
    

    var body: some View {
        GeometryReader{ geo in
            VStack{
                
                VStack{
                    
                    if cocktail.glasswareType == .coupe || cocktail.glasswareType == .stemmedGlassware  {
                        Image("coupeBlack2")
                            .resizable()
                            .frame(width: cocktailFrameSize, height: cocktailFrameSize, alignment: .center)
                    }
                    if cocktail.glasswareType == .martini || cocktail.glasswareType == .cinnamonSugarRim || cocktail.glasswareType == .sugarRimStemmed{
                        Image("martiniBlack2")
                            .resizable()
                            .frame(width: cocktailFrameSize, height: cocktailFrameSize, alignment: .center)
                    }
                    if cocktail.glasswareType == .doubleOld && cocktail.ice == .bigRock {
                        Image("doubleOldBFGBlack")
                            .resizable()
                            .frame(width: cocktailFrameSize, height: cocktailFrameSize, alignment: .center)
                    } else if (cocktail.glasswareType == .doubleOld || cocktail.glasswareType == .doubleOldSalt || cocktail.glasswareType == .doubleOldCelerySalt ) && cocktail.ice != .bigRock {
                        Image("doubleOldBlack")
                            .resizable()
                            .frame(width: cocktailFrameSize, height: cocktailFrameSize, alignment: .center)
                    }
                    if cocktail.glasswareType == .flute {
                        Image("fluteBlack2")
                            .resizable()
                            .frame(width: cocktailFrameSize, height: cocktailFrameSize, alignment: .center)
                    }
                    if cocktail.glasswareType == .collins {
                        Image("collinsBlack")
                            .resizable()
                            .frame(width: cocktailFrameSize, height: cocktailFrameSize, alignment: .center)
                    }
                    if cocktail.glasswareType == .wineGlass {
                        Image("wineGlassBlack")
                            .resizable()
                            .frame(width: cocktailFrameSize, height: cocktailFrameSize, alignment: .center)
                    }
                    if cocktail.glasswareType == .nickAndNora {
                        Image("nickNNoraBlack")
                            .resizable()
                            .frame(width: cocktailFrameSize, height: cocktailFrameSize, alignment: .center)
                    }
                    if cocktail.glasswareType == .smallHighball {
                        Image("smallHighBall")
                            .resizable()
                            .frame(width: cocktailFrameSize, height: cocktailFrameSize, alignment: .center)
                    }
                    if cocktail.glasswareType == .crustaGlass {
                        Image("brandy crusta")
                            .resizable()
                            .frame(width: cocktailFrameSize, height: cocktailFrameSize, alignment: .center)
                    }
                    if cocktail.glasswareType == .julep {
                        Image("julepCup")
                            .resizable()
                            .frame(width: cocktailFrameSize, height: cocktailFrameSize, alignment: .center)
                    }
                    if cocktail.glasswareType == .tikiMug {
                        Image("tiki mug")
                            .resizable()
                            .frame(width: cocktailFrameSize, height: cocktailFrameSize, alignment: .center)
                    }
                    if cocktail.glasswareType == .snifter {
                        Image("snifterBlack")
                            .resizable()
                            .frame(width: cocktailFrameSize, height: cocktailFrameSize, alignment: .center)
                    }
        
                }
                .frame(width: geo.size.width, height: geo.size.height * 0.35, alignment: .bottom)
                .padding(10)
             
                
                IngredientView(cocktail: cocktail)
               
                .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.65, alignment: .top)
                
            
            
               
                
                    

                    
                    
                
                
            }
        }
    }
 
}
struct CocktailMenuView_Previews: PreviewProvider {
   
    static var previews: some View {
        CocktailMenuView(cocktail: aFlightSouthOfTheBorder)
            
    }
}
struct IngredientView: View {
    let cocktail: Cocktail
    var ingredientsString = ""
    var profileString = ""
 
    
    init(cocktail: Cocktail, ingredientsString: String = "") {
        self.cocktail = cocktail
        
        let ingredients = cocktail.spec
        
        for ingredient in ingredients.reversed() {
            self.ingredientsString += " \(ingredient.ingredient.name),"
        }
       
        if let profiles = cocktail.compiledTags.profiles {
            for profile in profiles {
                self.profileString += " \(profile.rawValue),"
            }
        }
        if profileString != "" {
            self.profileString.removeLast()
        }
        
        self.ingredientsString.removeLast()
        
    }
    
    var body: some View {
        VStack {
            Text(cocktail.cocktailName)
                .dynamicTypeSize(.xxxLarge).bold()
                .multilineTextAlignment(.center)
                .padding(10)
            Text("Ingredients:")
                .dynamicTypeSize(.xLarge).bold()
            Text("\(ingredientsString)")
                    .multilineTextAlignment(.center)
                    .dynamicTypeSize(.xLarge)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            Text("Profile:")
                .dynamicTypeSize(.xLarge).bold()
            Text("\(profileString)")
                    .multilineTextAlignment(.center)
                    .dynamicTypeSize(.xLarge)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            if cocktail.author != nil {
                AuthorView(cocktail: cocktail)
                    
               }
            
            
        }
    }
}

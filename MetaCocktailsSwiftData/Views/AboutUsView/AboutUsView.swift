//
//  AboutUsView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 11/18/24.
//

import SwiftUI

struct AboutUsView: View {
    var viewModel: RecipeViewModel
    var parentGeo: GeometryProxy
    @Binding var borderColor: BorderGradient
    
    var body: some View {
        GeometryReader { outerGeo in
            ZStack {
                
                Border(height: outerGeo.size.height, gradient: $borderColor)
                ZStack{
                    FadingEdgesScrollView {
                        VStack{
                            Text(aboutUsTextFirstParagraph)
                            Text(aboutUsTextSecondParagraph)
                            HStack {
                                VStack {
                                    Image("jamesFace")
                                        .resizable()
                                        .frame(width: 100, height: 100, alignment: .center)
                                    Text("James Menkal")
                                }
                                .padding(.horizontal, 20)
                                VStack {
                                    Image("junglebird")
                                        .resizable()
                                        .frame(width: 100, height: 100, alignment: .center)
                                    Text("Matt Hunt")
                                }
                            }
                        }
                        .frame(width: outerGeo.size.width * 0.8, height: outerGeo.size.height, alignment: .center)
                        .dynamicTypeSize(.medium)
                    }
                    .frame(width: outerGeo.size.width * 0.8, height: outerGeo.size.height * 0.9, alignment: .center)
                }
            }
        }
    }
}

#Preview {
    
    GeometryReader { outerGeo in
        AboutUsView(viewModel: RecipeViewModel(cocktail: zombie), parentGeo: outerGeo, borderColor: .constant(ColorScheme.aboutUsBorder))
    }
}


var aboutUsTextFirstParagraph = "        Cocktail Copilot is the brainchild of veteran bartenders James Menkal and Matt Hunt. As the longest-serving bartender at Denver's award-winning Williams and Graham, James brings over a decade of craft cocktail expertise, including a Bar-5-Day certification and recognition as one of Denver's best bartenders in 2016. Matt, who learned the craft under James's mentorship in 2014, went on to work at the prestigious Death and Co., where his creative cocktails earned a spot in their latest book, 'Welcome Home.'"
var aboutUsTextSecondParagraph = "       While Matt transitioned into iOS development, his continued passion for mixology led to a collaboration with James on Cocktail Copilot. Their mission was clear: create the ultimate bartending companion app. Whether you're looking to reference classic recipes, discover modern craft cocktails, log your own creations, or calculate batch quantities, Cocktail Copilot delivers the tools needed for both professional bartenders and home enthusiasts. It's more than just an app—it's a platform for the bartending community to grow and learn together."

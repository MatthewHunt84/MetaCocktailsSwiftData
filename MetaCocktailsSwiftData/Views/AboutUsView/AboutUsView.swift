//
//  AboutUsView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 11/18/24.
//

import SwiftUI



struct AboutUsView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                ColorScheme.background.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    
                    VStack(alignment: .leading) {
                        
                        
                        Text("Cocktail Copilot is the result of the collaboration between two friends who have spent the past decade crafting drinks at some of the world's best cocktail bars. When venturing into mobile development, we knew we wanted to create something more than just another recipe collection.")
                            .font(FontFactory.fontBody14)
                        
                        HStack {
                            
                            Text("We designed this app to give bartenders the ability to filter cocktails by ingredients, flavors, or styles. We included a complete batching calculator, quick access to favorites, and much more.")
                                .font(FontFactory.fontBody14)
                                .multilineTextAlignment(.leading)
                            
                            FirstLoadAnimation(frame: 140,
                                               duration: 12,
                                               internalColor: Color.primary.mix(with: ColorScheme.tintColor, by: 0.33),
                                               externalColor: LinearGradient(colors: [Color.brandPrimaryOrange, ColorScheme.tintColor, Color.brandPrimaryOrange],
                                                                             startPoint: .topLeading,
                                                                             endPoint: .bottomTrailing),
                                               reverse: false)
                        }
                        
                        Text("This app represents our transition from building drinks to building software. We've poured our combined expertise into publishing a comprehensive library of meticulously sourced recipes and features. Enjoy!")
                            .font(FontFactory.fontBody14)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 20)
                        
                        HStack(spacing: 20) {
                            JamesPicture()
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                Text("James Menkal")
                                    .font(.custom("AvenirNext-DemiBold", size: 18))
                                    .foregroundStyle(Color.brandPrimaryOrange.mix(with: ColorScheme.tintColor, by: 0.5))
                                
                                Text("A veteran of the industry with over a decade of craft cocktail expertise, James Menkal is the longest-serving bartender at Denver's award-winning Williams and Graham.")
                                    .font(FontFactory.fontBody14)
                            }
                        }
                        .padding(.bottom, 20)
                        
                        
                        HStack(spacing: 20) {
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                Text("Matt Hunt")
                                    .font(.custom("AvenirNext-DemiBold", size: 18))
                                    .foregroundStyle(Color.brandPrimaryOrange.mix(with: ColorScheme.tintColor, by: 0.5))
                                
                                Text("An international bartender who loved reading about cocktails almost as much as drinking them, Matt now has has several recipes featured in the 'Welcome Home' cocktail book by Death & Co.")
                                    .font(FontFactory.fontBody14)
                            }
                            
                            MattPicture()
                        }
                    }
                    .foregroundStyle(Color.primary.mix(with: ColorScheme.tintColor, by: 0.33))
                    .aboutHeaderWithNavigation(title: "About Cocktail Copilot", dismiss: dismiss)
                    .navigationBarTitleDisplayMode(.inline)
                    .background(
                        Image(.limeSegments)
                            .offset(x: 120, y: 240)
                            .opacity(0.03)
                    )
                    .padding(20)
                }
            }
        }
    }
}

struct AboutUsView2: View {
    var viewModel: RecipeViewModel
    var parentGeo: GeometryProxy
    @Binding var borderColor: BorderGradient
    @Environment(\.dismiss) private var dismiss
    @State private var pictureFrame = CGFloat(112)
    
    var body: some View {
        NavigationStack{
            GeometryReader { outerGeo in
                ZStack {
                    Border(height: outerGeo.size.height, gradient: $borderColor)
                    ZStack{
                        FadingEdgesScrollView {
                            VStack{
                                HStack {
                                    Button(action: {
                                        dismiss()
                                    }) {
                                        Image(systemName: "chevron.backward")
                                            .font(.system(size: 24))
                                            .foregroundStyle(ColorScheme.interactionTint)
                                    }
                                    Spacer()
                                    FontFactory.recipeHeader(title: "About the Creators", isHistoric: false)
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.5)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 10)
                                Text(aboutUsTextFirstParagraph)
                                Text(aboutUsTextSecondParagraph)
                                
                                FirstLoadAnimation(frame: 150,
                                                   duration: 8,
                                                   internalColor: Color.primary.mix(with: ColorScheme.tintColor, by: 0.33),
                                                   externalColor: LinearGradient(colors: [Color.brandPrimaryOrange, ColorScheme.tintColor, Color.brandPrimaryOrange],
                                                                                 startPoint: .topLeading,
                                                                                 endPoint: .bottomTrailing),
                                                   reverse: false)
                                
                                FirstLoadAnimation(frame: 150,
                                                   duration: 8,
                                                   internalColor: Color.primary.mix(with: Color.brandPrimaryGreen, by: 0.33),
                                                   externalColor: LinearGradient(colors: [Color.brandSecondaryGreen, Color.brandPrimaryGreen, Color.brandSecondaryGreen],
                                                                                 startPoint: .topLeading,
                                                                                 endPoint: .bottomTrailing),
                                                   reverse: true)

                                
                                HStack {
                                    ZStack {

                                        VStack {
                                            Image("jamesFace")
                                                .resizable()
                                                .clipShape(.circle)
                                                .frame(width: pictureFrame, height: pictureFrame, alignment: .center)
                                            Text("James Menkal")
                                        }
                                        
                                        Circle()
                                            .stroke(Color.primary.mix(with: ColorScheme.tintColor, by: 0.33), lineWidth: 9)
                                            .frame(width: 120, height: 120, alignment: .center)
                                    }
                                    .padding(.horizontal, 20)
                                    
                                    VStack {
                                        ZStack {
                                                
                                                Image(.limeCenter)
                                                    .resizable()
                                                    .foregroundStyle(RadialGradient(colors: [.black, .darkestGray], center: .center, startRadius: 1, endRadius: 100))
                                                    .frame(width: 150, height: 150, alignment: .center)

                                            Image("mattFaceCropped")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .grayscale(1.0)
                                                .clipShape(.circle)
                                                .offset(y: 7)
                                                .frame(width: pictureFrame, height: pictureFrame, alignment: .center)
                                            
                                            Circle()
                                                .stroke(Color.primary.mix(with: ColorScheme.tintColor, by: 0.33), lineWidth: 9)
                                                .frame(width: 120, height: 120, alignment: .center)
                                            
                                            
                                        }
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
}

#Preview {
    NavigationStack{
        GeometryReader { outerGeo in
            AboutUsView()
        }
    }
}


var aboutUsTextFirstParagraph = "        Cocktail Copilot is the brainchild of veteran bartenders James Menkal and Matt Hunt. As the longest-serving bartender at Denver's award-winning Williams and Graham, James brings over a decade of craft cocktail expertise, including a Bar-5-Day certification and recognition as one of Denver's best bartenders in 2016 from Eater Magazine. Matt, who learned the craft under James's mentorship in 2014, went on to work at the prestigious Death and Co., where his creative cocktails earned a spot in their latest book, 'Welcome Home.'"
var aboutUsTextSecondParagraph = "       While Matt transitioned into iOS development, his continued passion for mixology led to a collaboration with James on Cocktail Copilot. Their mission was clear: create the ultimate bartending companion app. Whether you're looking to reference classic recipes, discover modern craft cocktails, log your own creations, or calculate batch quantities, Cocktail Copilot delivers the tools needed for both professional bartenders and home enthusiasts. It's more than just an app—it's a platform for the bartending community to grow and learn together."




struct JamesPicture: View {
    
    private var pictureFrame = CGFloat(112)
    
    var body: some View {
        
        ZStack {
            Image("jamesFace")
                .resizable()
                .clipShape(.circle)
                .frame(width: pictureFrame, height: pictureFrame, alignment: .center)
            
            Circle()
                .stroke(Color.primary.mix(with: ColorScheme.tintColor, by: 0.33), lineWidth: 9)
                .frame(width: 120, height: 120, alignment: .center)
        }
        
    }
}

struct MattPicture: View {
    
    private var pictureFrame = CGFloat(112)
    
    var body: some View {
        
        ZStack {
            
            Circle()
                .foregroundStyle(RadialGradient(colors: [.black, .darkestGray], center: .center, startRadius: 1, endRadius: 100))
                .frame(width: 120, height: 120, alignment: .center)
            
            Image("mattFaceCropped")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .grayscale(1.0)
                .clipShape(.circle)
                .offset(y: 7)
                .frame(width: pictureFrame, height: pictureFrame, alignment: .center)
            
            Circle()
                .stroke(Color.primary.mix(with: ColorScheme.tintColor, by: 0.33), lineWidth: 9)
                .frame(width: 120, height: 120, alignment: .center)
        }
    }
}

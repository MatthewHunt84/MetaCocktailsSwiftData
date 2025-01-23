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
                        
                        Text("Cocktail Copilot is what happens when two bartending nerds become programming nerds. It's the companion app that we've always wanted behind the bar — meticulously sourced recipes, advanced search features, and many other useful tools for the modern bartender.")
                            .font(FontFactory.fontBody14)
                        
                        Text("To give back to the industry we love, Cocktail Copilot is completely free, no strings (or ads) attached.")
                            .font(FontFactory.fontBody14)
                            .multilineTextAlignment(.leading)
                            .padding(.top, 5)
                        
                        HStack {
                            
                            Text("Transitioning from building drinks to building software has been an amazing journey, and we're not finished yet. Have ideas for new features? We'd love to hear them!")
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
                        
                        HStack(spacing: 20) {
                            JamesPicture()
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                Text("James Menkal")
                                    .font(.custom("AvenirNext-DemiBold", size: 18))
                                
                                Text("A veteran of the industry with over a decade of craft cocktail expertise and a Bar 5-Day graduate, James Menkal is the longest-serving bartender at Denver's award-winning Williams and Graham.")
                                    .font(FontFactory.fontBody14)
                            }
                        }
                        .padding(.bottom, 20)
                        
                        
                        HStack(spacing: 20) {
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                Text("Matt Hunt")
                                    .font(.custom("AvenirNext-DemiBold", size: 18))
                                
                                Text("A full-time iOS developer since 2021, Matt previously worked as a bartender at Death & Co Denver before joining James at Williams and Graham.")
                                    .font(FontFactory.fontBody14)
                            }
                            
                            MattPicture()
                        }
                    }
                    .aboutHeaderWithNavigation(title: "About Cocktail Copilot", dismiss: dismiss)
                    .navigationBarTitleDisplayMode(.inline)
                    .background(
                        Image(.limeSegments)
                            .offset(x: 120, y: 240)
                            .opacity(0.02)
                    )
                    .padding(20)
                    
                    HStack(spacing: 8) {
                        Image(systemName: "envelope.fill")
                        Text("Contact")
                            .font(FontFactory.fontBody14)
                    }
                    .padding(.top, -10)
                    .foregroundColor(ColorScheme.interactionTint)
                    .onTapGesture {
                        if let url = URL(string: "mailto:cocktailcopilot@gmail.com") {
                            UIApplication.shared.open(url)
                        }
                    }
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
                                            .stroke(Color.primary, lineWidth: 9)
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
                                                .stroke(Color.primary, lineWidth: 9)
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
    
    @State private var rotationCircle = 0.0
    private var pictureFrame = CGFloat(112)
    
    var body: some View {
        
        ZStack {
            Image("jamesFace")
                .resizable()
                .clipShape(.circle)
                .frame(width: pictureFrame, height: pictureFrame, alignment: .center)
            
            Circle()
                .stroke(LinearGradient(colors: [Color.brandPrimaryOrange, ColorScheme.tintColor, Color.brandPrimaryOrange],
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing), lineWidth: 7.5)
                .frame(width: 120, height: 120, alignment: .center)
                .rotationEffect(.degrees(rotationCircle))
                .animation(Animation.linear(duration: 4).repeatForever(autoreverses: false), value: rotationCircle)
                .task {
                    await MainActor.run {
                        rotationCircle = -360
                    }
                }
        }
        
    }
}

struct MattPicture: View {
    
    @State private var rotationCircle = 0.0
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
                .stroke(LinearGradient(colors: [Color.brandPrimaryOrange, ColorScheme.tintColor, Color.brandPrimaryOrange],
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing), lineWidth: 7.5)
                .frame(width: 120, height: 120, alignment: .center)
                .rotationEffect(.degrees(rotationCircle))
                .animation(Animation.linear(duration: 4).repeatForever(autoreverses: false), value: rotationCircle)
                .task {
                    await MainActor.run {
                        rotationCircle = 360
                    }
                }
        }
    }
}

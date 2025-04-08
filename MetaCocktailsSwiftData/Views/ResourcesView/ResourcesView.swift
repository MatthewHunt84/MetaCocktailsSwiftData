//
//  ResourcesView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 4/8/25.
//


//
//  ResourcesView.swift
//  MetaCocktails
//
//  Created on 4/8/25.
//

import SwiftUI

struct ResourcesView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            GeometryReader { outerGeo in
                ZStack {
                    ColorScheme.background.ignoresSafeArea()
                    
                    VStack(spacing: 0) {
                        VStack {
                            NavigationLink {
                                PrepBibleView()
                                    .navigationBarBackButtonHidden(true)
                            } label: {
                                ZStack {
                                    BlackGlassBackgroundView()
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                        .shadow(radius: 5)
                                    
                                    VStack(spacing: 15) {
                                        Image(systemName: "book.fill")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 80, height: 80)
                                            .foregroundColor(ColorScheme.tintColor)
                                        
                                        Text("Prep Bible")
                                            .font(FontFactory.recipeCardHeader18B)
                                            .foregroundColor(.primary)
                                    }
                                    .padding(30)
                                }
                                .frame(width: outerGeo.size.width * 0.8, height: outerGeo.size.height * 0.35)
                            }
                        }
                        .frame(maxHeight: .infinity)
                        
                        VStack {
                            NavigationLink {
                                AboutUsView()
                                    .navigationBarBackButtonHidden(true)
                            } label: {
                                ZStack {
                                    BlackGlassBackgroundView()
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                        .shadow(radius: 5)
                                    
                                    VStack(spacing: 15) {
                                        FirstLoadAnimation(frame: 80,
                                                           duration: 12,
                                                           internalColor: ColorScheme.searchBarBackground,
                                                           externalColor: LinearGradient(colors: [Color.brandPrimaryOrange, ColorScheme.tintColor, Color.brandPrimaryOrange],
                                                                                         startPoint: .topLeading,
                                                                                         endPoint: .bottomTrailing),
                                                           reverse: false)
                                        
                                        Text("About Us")
                                            .font(FontFactory.recipeCardHeader18B)
                                            .foregroundColor(.primary)
                                    }
                                    .padding(30)
                                }
                                .frame(width: outerGeo.size.width * 0.8, height: outerGeo.size.height * 0.35)
                            }
                        }
                        .frame(maxHeight: .infinity)
                    }
                    .frame(height: outerGeo.size.height)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .jamesHeaderWithNavigation(title: "Resources", dismiss: dismiss)
        }
    }
}

#Preview {
    ResourcesView()
}

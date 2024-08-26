//
//  HistoricalCocktailModalView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 8/26/24.
//

import SwiftUI

struct HistoricalCocktailModalView: View {
    @Binding var isPresented: Bool
    let alertContent: HistoricalCocktailAlert
    let action: () -> Void
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.3)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            Spacer()
                            Button(action: { isPresented = false }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.brandPrimaryGold)
                                    .font(.title2)
                            }
                        }
                        .padding(.top)
                        
                        Text(alertContent.title)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.bottom, 10)
                        
                        Text(alertContent.message)
                            .font(.body)
                            .foregroundColor(.white)
                        
                        ForEach(alertContent.bulletPoints, id: \.self) { point in
                            HStack(alignment: .top, spacing: 10) {
                                Text("•")
                                    .foregroundColor(.brandPrimaryGold)
                                Text(point)
                                    .font(.body)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .padding()
                }
                
                Button(action: {
                    action()
                    isPresented = false
                }) {
                    Text(alertContent.buttonTitle)
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.brandPrimaryGold)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
            .background(Color.black)
            .cornerRadius(20)
            .padding(.horizontal, 20)
            .frame(maxWidth: 500)
            .shadow(radius: 20)
        }
    }
}

struct HistoricalCocktailModalView_Previews: PreviewProvider {
    static var previews: some View {
        HistoricalCocktailModalView(
            isPresented: .constant(true),
            alertContent: HistoricalCocktailAlert.standard
        ) {
            print("Modal dismissed")
        }
    }
}



struct HistoricalCocktailAlert {
    let title: String
    let message: String
    let bulletPoints: [String]
    let buttonTitle: String

    static let standard = HistoricalCocktailAlert(
        title: "Historical Cocktail Recipes",
        message: "Many recipes in this collection are historical references, offering a glimpse into the origins of modern cocktails. Here's what you should know:",
        bulletPoints: [
            "Historical Context: Pay attention to the year cited for each recipe. These dates highlight the evolution of cocktail crafting over time.",
            "Original Formulas: We've included the earliest documented versions of cocktails that are still relevant today. These come from vintage bar books and old newspaper archives.",
            "Taste Preferences: Keep in mind that many historical recipes may not align with modern palates. They often reflect the tastes and available ingredients of their era.",
            "Learning Tool: Use these recipes to understand cocktail history and as a starting point for creating your own contemporary variations."
        ],
        buttonTitle: heardChef
    )

    var formattedMessage: String {
        let bulletPointsString = bulletPoints.map { "• \($0)" }.joined(separator: "\n\n")
        return "\(message)\n\n\(bulletPointsString)"
    }
}



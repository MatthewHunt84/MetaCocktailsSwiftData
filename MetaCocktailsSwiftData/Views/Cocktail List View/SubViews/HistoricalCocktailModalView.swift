//
//  HistoricalCocktailModalView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 8/26/24.
//

import SwiftUI

struct HistoricalCocktailModalView: View {
    let cocktail: Cocktail
    @Binding var isPresented: Bool
    let alertContent: HistoricalCocktailAlert
    let action: () -> Void
    
    init(cocktail: Cocktail, presented: Binding<Bool>, action: @escaping () -> Void) {
        self.cocktail = cocktail
        self._isPresented = presented
        self.alertContent = HistoricalCocktailAlert(cocktail: cocktail)
        self.action = action
    }
    
    var body: some View {
        ZStack {
            
            BlackGlassBackgroundView()
            
            VStack(spacing: 20) {
                
                ScrollView {
                    
                    VStack(alignment: .leading, spacing: 20) {
                        
                        ModalHeader(title: alertContent.title)

                        Text(alertContent.message)
                            .font(.body)
                            .foregroundColor(.primary)
                        
                        ForEach(alertContent.bulletPoints, id: \.self) { point in
                            HStack(alignment: .top, spacing: 10) {
                                Text("•")
                                    .foregroundColor(.brandPrimaryGold)
                                Text(point)
                                    .font(.body)
                                    .foregroundColor(.primary)
                            }
                        }
                    }
                    .padding()
                
                Button(action: {
                    action()
                    isPresented = false
                }) {
                    Text(alertContent.buttonTitle)
                        .font(FontFactory.fontBody16)
                        .foregroundStyle(.blueTint)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.primary, lineWidth: 1)
                        )
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
                }
            }
            .cornerRadius(20)
            .padding(.horizontal, 20)
            .frame(maxWidth: 500)
            .shadow(radius: 20)
        }
    }
}

struct HistoricalCocktailModalView_Previews: PreviewProvider {
    static var previews: some View {
        HistoricalCocktailModalView(cocktail: bamboo, presented: .constant(true)) { }
    }
}



struct HistoricalCocktailAlert {
    
    init(cocktail: Cocktail, title: String = "", message: String = "", bulletPoints: [String] = [], buttonTitle: String = "") {
        self.cocktail = cocktail
        self.title = "Historical Recipe"
        self.message = "This is the original recipe for the \(cocktail.cocktailName) cocktail, unchanged from its original publication."
        var historicalContextMessage = "The year of origin for this cocktail is either unknown, or disputed."
        if let year = cocktail.author?.year {
            historicalContextMessage = "The original \(cocktail.cocktailName) cocktail recipe was created in \(year)."
        }
        self.bulletPoints = [
            "Historical Context: \(historicalContextMessage)",
            "Provenance: Recipes like this one are taken from vintage bar books, or old newspaper archives.",
            "Preferences: Historical recipes like this one reflect the palates and/or available ingredients of their era. Modern variations of this recipe may be considered more standard representations by bartenders in \(Calendar.current.component(.year, from: Date())).",
            "Learning Tool: Use these recipes to understand a cocktail's history, and as a starting point for creating your own contemporary variations."
        ]
        self.buttonTitle = yesChef
    }
    
    let cocktail: Cocktail
    let title: String
    let message: String
    let bulletPoints: [String]
    let buttonTitle: String

    var formattedMessage: String {
        let bulletPointsString = bulletPoints.map { "• \($0)" }.joined(separator: "\n\n")
        return "\(message)\n\n\(bulletPointsString)"
    }
}



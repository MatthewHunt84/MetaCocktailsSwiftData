//
//  Searched Cocktail Title Headers.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 9/13/24.
//



import SwiftUI
import SwiftData

struct SearchedCocktailTitleHeader: View {
    
    var searched: Int
    var matched: Int

    var body: some View {
        HStack {
            
            if matched == searched {
                Text("Perfect Match Cocktails")
                    .foregroundStyle(ColorScheme.tintColor)
                    .font(FontFactory.mediumFont(size: 16))
                    .fontWeight(.semibold)
            } else if matched == (searched - 1) {
                Text("Minus One Ingredient")
                    .font(FontFactory.mediumFont(size: 16))
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
            } else {
                Text("Minus Two Ingredients")
                    .font(FontFactory.mediumFont(size: 16))
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
            }
            
            Spacer()
            
            ForEach(0..<matched, id: \.self) { match in
                Image(systemName: "circle.fill")
                    .foregroundStyle(matched == searched ? ColorScheme.tintColor : .white)
            }
            
            if matched - searched < 0 {
                ForEach(0..<(searched - matched), id: \.self) { nonMatch in
                    Image(systemName: "circle")
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}

struct SearchedCocktailTitleHeaderForMultipleSpirits: View {
    
    var searched: Int
    var matched: Int
    var baseSpirit: String
    
    var body: some View {
        HStack {
            Text(baseSpirit)
                .font(.headline).bold()
            
            ForEach(0..<matched, id: \.self) { match in
                Image(systemName: "circle.fill")
                    .foregroundStyle(Color.green)
            }
            
            if matched - searched < 0 {
                ForEach(0..<(searched - matched), id: \.self) { nonMatch in
                    Image(systemName: "circle.fill")
                    
                }
            }
            
            Spacer()
            
            Text("^[\(matched)/\(searched) matches](inflect: true)")
        }
    }
}

struct SearchedCocktailCell: View {
    
    var cocktail: Cocktail
    
    var body: some View {
        VStack {
            Text("\(cocktail.cocktailName)")
        }
    }
}

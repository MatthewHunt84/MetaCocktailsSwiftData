//
//  SearchBarView.swift
//  MetaCocktails
//
//  Created by James on 8/10/23.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    
    var body: some View {
        HStack {

            Image(systemName: "magnifyingglass")
                .foregroundColor(Color.gray)

            TextField("Search for an ingredient...", text: $searchText)
                .autocorrectionDisabled()
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundColor(Color.white)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                    ,alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color(UIColor.systemBackground))
                .shadow(
                    color: .gray.opacity(0.5),
                    radius: 10, x: 0, y: 0)

        )
        .padding()
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {

        SearchBarView(searchText: .constant(""))

        
    }
}

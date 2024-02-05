//
//  NotesView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/4/24.
//

import SwiftUI

struct NotesView: View {
    @StateObject var viewModel = CBCViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                TextEditor(text: $viewModel.notesText)
                    .overlay( RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .stroke(.gray.gradient, lineWidth: 2))
                Button {
                    
                } label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .backgroundStyle(.blue)
                        .cornerRadius(10)
                }
                .frame(maxWidth: .infinity)
                .overlay( RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                    .stroke(.gray.gradient, lineWidth: 2))

                
            }
            .padding()
            .backgroundStyle(.brandPrimaryGreen.gradient)
            .navigationTitle("Cocktail Notes")
        }
    }
}

#Preview {
    NotesView()
}

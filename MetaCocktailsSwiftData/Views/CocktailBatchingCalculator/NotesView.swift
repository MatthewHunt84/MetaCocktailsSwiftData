//
//  NotesView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/4/24.
//

import SwiftUI
import SwiftData

struct NotesView: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @Environment(\.dismiss) private var dismiss
    @State var newText: String 
    @Bindable var batchCocktail: BatchedCocktail
    @Environment(\.modelContext) var modelContext
    @Query var favoriteCocktails: [BatchedCocktail]
    
    var body: some View {
        
        NavigationStack {
            VStack {
                TextEditor(text: $newText)
                    .overlay( RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .stroke(.gray.gradient, lineWidth: 2))
                    .onSubmit {
                        hideKeyboardAndSave()
                    }
                    .onTapGesture {
                        hideKeyboardAndSave()
                    }
                
                Button {
                    save()
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
        .task {
            viewModel.notesText = newText 
            
            print(viewModel.notesText)
        }
    }
    private func hideKeyboardAndSave() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        save()
    }
    private func save() {
        for cocktails in favoriteCocktails {
            
                //cocktails.notes = newText
                print(cocktails.id.hashValue)
            
        }
        print("\(batchCocktail.id.hashValue) <--- batch cocktail ")
        viewModel.notesText = newText
        print(newText)
        batchCocktail.notes = newText
    }
}

//#Preview {
//    NotesView()
//}

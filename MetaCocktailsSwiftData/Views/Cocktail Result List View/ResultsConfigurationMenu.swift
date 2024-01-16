//
//  ToggleMultipleBaseResultsView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/15/24.
//

import SwiftUI

struct ResultsConfigurationMenu: View {
    @ObservedObject var viewModel: SearchCriteriaViewModel
    @State private var showingAlert = false
    var body: some View {
     
        Menu("Sort Results") {
            Button("By number of matches: Apply to a single cocktail.", action: {
                viewModel.enableMultipleSpiritSelection = false
                viewModel.getFilteredCocktails()
            })
            Button("By Spirit: Separate your results based on the spirit.", action: {
                viewModel.enableMultipleSpiritSelection = true
                viewModel.getFilteredCocktails()
                if viewModel.multipleBaseSpiritsSelected == false {
                    showingAlert = true
                }
            })
        }
        .padding(10)
        .font(.headline).bold()
        .buttonStyle(whiteButton())
        .alert("Oopsie Doodles!", isPresented: $showingAlert, actions: {
            Button("Heard, Chef.", role: .cancel) {
                showingAlert.toggle()
                viewModel.enableMultipleSpiritSelection.toggle()
                viewModel.getFilteredCocktails()
            }
        }, message: {
            Text("Please select multiple base spirits to show results.")
        })
    }
        
}

#Preview {
    ResultsConfigurationMenu(viewModel: SearchCriteriaViewModel())
        .environmentObject(SearchCriteriaViewModel())
}

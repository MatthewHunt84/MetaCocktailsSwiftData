//
//  ToggleMultipleBaseResultsView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/15/24.
//
//
//import SwiftUI
//import SwiftData
//
//struct ResultsConfigurationMenu: View {
//    @ObservedObject var viewModel: SearchCriteriaViewModel
//    @Environment(\.modelContext) private var modelContext
//    @State private var showingAlert = false
//    var body: some View {
//     
//        Menu("Sort Results") {
//            Button("By number of matches: Apply to a single cocktail.", action: {
//                viewModel.enableResultsForMultipleBaseSpirits = false
//                SearchResultsView(viewModel: viewModel).gitFilteredCocktailsSwiftData()
//            })
//            Button("By Spirit: Separate your results based on the spirit.", action: {
//                viewModel.enableResultsForMultipleBaseSpirits = true
//                SearchResultsView(viewModel: viewModel).gitFilteredCocktailsSwiftData()
//            })
//        }
//        .padding(10)
//        .font(.headline).bold()
//        .buttonStyle(whiteButton())
//
//    }
//        
//}
//
//#Preview {
//    ResultsConfigurationMenu(viewModel: SearchCriteriaViewModel())
//        .environmentObject(SearchCriteriaViewModel())
//}

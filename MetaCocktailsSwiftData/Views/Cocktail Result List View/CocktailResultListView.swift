//
//  CocktailResultListView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/4/24.

import SwiftUI
import SwiftData

struct CocktailResultList: View {
    
    @ObservedObject var viewModel: SearchCriteriaViewModel
    @Binding var isLoading: Bool
    @State private var nonmatchSearchPreference: String = "none"
    
    
    var body: some View {
        NavigationStack {
            VStack {
                
                if isLoading {
                    Image("Couldn’tLoad")
                        .resizable()
                        .scaledToFit()
                    
                } else {
                    if viewModel.preferredCount > 0 {
                        VStack{
                            List {
                                ForEach(viewModel.sections, id: \.self.id) { result in
                                    Section(header: SearchedCocktailTitleHeader(searched: result.count, matched: result.matched)) {
                                        if result.matched == result.count {
                                            
                                            TotalMatchView(resultViewSectionData: result)
                                            
                                        } else {
                                            
                                            FilterMatchesMenuView(viewModel: viewModel, resultViewSectionData: result, nonmatchSearchPreference: $nonmatchSearchPreference)
                                            
                                            if result.filterPreference == "none" {
                                                
                                                PartialMatchWithNoPreferenceView(viewModel: viewModel, resultViewSectionData: result)
                                                
                                            } else {
                                                
                                                ForEach(result.cocktails.filter({ $0.nonmatchPreferences!.contains(result.filterPreference)}), id: \.self.id) { cocktail in
                                                    NavigationLink {
                                                        
                                                        RecipeView(viewModel: RecipeViewModel(cocktail: cocktail))
                                                        
                                                            .navigationBarBackButtonHidden(true)
                                                    } label: {
                                                        VStack {
                                                            HStack{
                                                                Text(cocktail.cocktailName)
                                                                Spacer()
                                                            }
                                                            HStack{
                                                                if let missingPreferences = cocktail.nonmatchPreferences {
                                                                    ForEach(missingPreferences, id: \.self) { nonMatch in
                                                                        
                                                                        Text("-\(nonMatch) ")
                                                                            .foregroundStyle(.brandPrimaryRed)
                                                                            .font(.caption)
                                                                    }
                                                                }
                                                                Spacer()
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            .listStyle(.plain)
                            .backgroundStyle(Color(.black))
                        }
                    } else  {
                        ZStack(alignment: .center) {
                            Color.black
                            
                            VStack {
                                Text("Add more preferences to continue")
                                    .font(.title).bold()
                                    .multilineTextAlignment(.center)
                                Image("Urkel")
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    CocktailResultList(viewModel: SearchCriteriaViewModel(), isLoading: .constant(false))
        .environmentObject(SearchCriteriaViewModel())
}


struct FilterMatchesMenuView: View {
    
    @ObservedObject var viewModel: SearchCriteriaViewModel
    var resultViewSectionData: ResultViewSectionData
    @Binding var nonmatchSearchPreference: String
    
    var body: some View {
        Menu("Filter Matches") {
            ForEach(viewModel.selectedPreferredIngredients(), id: \.id) { preference in
                
                Button("- \(preference.name)") {
                    resultViewSectionData.filterPreference = preference.name
                    nonmatchSearchPreference = preference.name
                }
                .foregroundStyle(.brandPrimaryRed)
            }
            Button {
                resultViewSectionData.filterPreference = "none"
                nonmatchSearchPreference = "none"
            } label: {
                Text("Show all")
            }
        }
    }
}

struct TotalMatchView: View {
    
    var resultViewSectionData: ResultViewSectionData
    
    var body: some View {
        ForEach(resultViewSectionData.cocktails, id: \.self.id) { cocktail in
            NavigationLink {
                RecipeView(viewModel: RecipeViewModel(cocktail: cocktail))
                    .navigationBarBackButtonHidden(true)
            } label: {
                HStack {
                    Text(cocktail.cocktailName)
                }
            }
        }
    }
}

struct PartialMatchWithNoPreferenceView: View {
    
    @ObservedObject var viewModel: SearchCriteriaViewModel
    var resultViewSectionData: ResultViewSectionData
    
    var body: some View {
        ForEach(resultViewSectionData.cocktails, id: \.self.id) { cocktail in
            NavigationLink {
                RecipeView(viewModel: RecipeViewModel(cocktail: cocktail))
                    .navigationBarBackButtonHidden(true)
            } label: {
                VStack {
                    HStack{
                        Text(cocktail.cocktailName)
                        Spacer()
                    }
                    HStack{
                        if let missingPreferences = cocktail.nonmatchPreferences {
                            ForEach(missingPreferences, id: \.self) { nonMatch in
                                
                                Text("-\(nonMatch) ")
                                    .foregroundStyle(.brandPrimaryRed)
                                    .font(.caption)
                            }
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

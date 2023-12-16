//
//  IngredientLikesChecklist.swift
//  MetaCocktails
//
//  Created by James on 8/10/23.
//

import SwiftUI

struct SearchCriteriaView: View {

    @EnvironmentObject var viewModel: SearchCriteriaViewModel
    @Binding var isShowingIngredientsList: Bool
    @State var selectedList: PreferenceType = .all
    @State var isShowingPreferences: Bool
    @State var selectedLikesOrDislikes: LikesOrDislikes = .likes
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                Picker("Choose a preferences list", selection: $selectedList){
                    ForEach(PreferenceType.allCases, id: \.self) {
                        Text($0.rawValue)
                        
                    }
                }
                .pickerStyle(.segmented)
                
                
                Picker("Pick Out Likes Or Dislikes", selection: $selectedLikesOrDislikes) {
                    ForEach(LikesOrDislikes.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                
                .onChange(of: selectedLikesOrDislikes) {
                    isShowingPreferences.toggle()
                        
                    
                }
                .foregroundColor(Color.blue)
               
                NavigationLink {
                    SearchResultsView(viewModel: viewModel)
                        .onAppear {
                            viewModel.getFilteredCocktails()
                        }
                } label: {
                    Text("SEARCH!")
                        .fontWeight(.bold)
                        .padding(EdgeInsets(top: 10, leading: 50, bottom: 10, trailing: 50))
                        .background(viewModel.selectedPreferredIngredients().count == 0 ? Color(UIColor.systemGray) : Color.brandPrimaryOrange)
                        .clipShape(RoundedRectangle(cornerRadius: 140))
                        .shadow(color: Color(UIColor.systemGray), radius: 2, x: 0, y: 0)
                        .foregroundColor(.white)
                }

                ListView(selectedList: $selectedList, navigationTitle: selectedList.getTitle(), isShowingLikes: $isShowingPreferences)
                
                SearchBarView(searchText: $viewModel.searchText)
                    .onChange(of: viewModel.searchText) {
                        viewModel.matchAllTheThings()
                    }
                
            }
            .navigationTitle(selectedList.getTitle())
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

enum PreferenceType: String, CaseIterable {
    
    case all      = "All"
    case spirits  = "Spirits"
    case profiles = "Profiles"
    case flavors  = "Flavors"
    case textures = "Textures"
    case style    = "Style"
    
    func getTitle() -> String {
        switch self {
        case .all:
            "Select Components"
        case .spirits:
            "Spirit Preferences"
        case .profiles:
            "Profile Preferences"
        case .flavors:
            "Flavor Preferences"
        case .textures:
            "Texture Preferences"
        case .style:
            "Style Preferences"
        }
    }
}

enum LikesOrDislikes: String, CaseIterable {
    
    case likes = "Likes"
    case dislikes = "Dislikes"
}

struct IngredientLikesChecklist_Previews: PreviewProvider {
    static var previews: some View {
        SearchCriteriaView(isShowingIngredientsList: .constant(true), isShowingPreferences: true, selectedLikesOrDislikes: .likes)
            .environmentObject(SearchCriteriaViewModel())
    }
}





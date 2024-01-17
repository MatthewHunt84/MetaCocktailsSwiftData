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
    @State var selection: PreferenceType = .all

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
                ListView(selectedList: $selectedList, navigationTitle: selectedList.getTitle(), isShowingLikes: $isShowingPreferences)
                HStack {
                    NavigationLink {
                        SearchResultsView(viewModel: viewModel)
                    } label: {
                        Text("SEARCH!")
                            .font(.footnote).bold()
                            .padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30))
                            .background(viewModel.selectedPreferredIngredients().count == 0 ? Color(UIColor.systemGray) : Color.brandPrimaryOrange)
                            .clipShape(RoundedRectangle(cornerRadius: 140))
                            .shadow(color: Color(UIColor.systemGray), radius: 2, x: 0, y: 0)
                            .foregroundColor(.white)
                    }
                    Button(action: {
                        for i in 0..<viewModel.cocktailComponents.count {
                            viewModel.cocktailComponents[i].isPreferred = false
                            viewModel.cocktailComponents[i].isUnwanted = false
                            viewModel.enableMultipleSpiritSelection = false
                        }
                    }) {
                        Text("Clear Search")
                          
                    }
                    .padding(10)
                    .font(.footnote).bold()
                    .buttonStyle(whiteButton())
                }
                
            }
            .navigationTitle(selectedList.getTitle())
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

enum PreferenceType: String, CaseIterable {
    
    case all      = "All"
    case spirits  = "Spirit"
    case na       = "N/A"
    case profiles = "Profile"
    case flavors  = "Flavor"
    case textures = "Texture"
    case style    = "Style"
    
    func getTitle() -> String {
        switch self {
        case .all:
            "Advanced Search"
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
        case .na:
            "N/A Ingredients"
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





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
            HStack {
                Text(selectedList.getTitle())
                    .font(.largeTitle).bold()
                    .padding(EdgeInsets(top: 0, leading: 12, bottom: -7, trailing: 0))
                Spacer()
                Menu("", systemImage: "gearshape") {
                    Button("Filter All Cocktails") {
                        viewModel.showWilliamsAndGrahamCocktails = false
                    }
                    Button("Filter Williams and Graham Cocktails") {
                        viewModel.showWilliamsAndGrahamCocktails = true
                    }
                    
                }
                .offset(x: -18, y: 6.0)
                .foregroundStyle(.white)
            }
            VStack {
                Picker("Choose a preferences list", selection: $selectedList){
                    ForEach(PreferenceType.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                Picker("Pick Out Likes Or Dislikes", selection: $selectedLikesOrDislikes) {
                    ForEach(LikesOrDislikes.allCases, id: \.self) { s in
                        Text(s.rawValue)
                            .colorMultiply(s.getLikesOrDislikesColor())
                        
                    }
                }
                .pickerStyle(.segmented)
                .onChange(of: selectedLikesOrDislikes) {
                    isShowingPreferences.toggle()
                }
                
                
                
                
                AdvancedCriteriaListView(selectedList: $selectedList, navigationTitle: selectedList.getTitle(), isShowingLikes: $isShowingPreferences)
                HStack {
                    NavigationLink {
                        SearchResultsView(viewModel: viewModel)
                    } label: {
                        Text("SEARCH!")
                            .font(.footnote).bold()
                            .padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30))
                            .background(viewModel.selectedPreferredIngredients().count == 0 ? Color(UIColor.systemGray) : Color.brandPrimaryGreen)
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
        }
    }
}

enum PreferenceType: String, CaseIterable {
    
    case all      = "All"
    case spirits  = "Spirit"
    case na       = "N/A"
    case profiles = "Profile"
    case flavors  = "Flavor"
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
    
    func getLikesOrDislikesColor() -> Color {
        switch self {
        case .likes:
            Color(.brandPrimaryGreen)
        case .dislikes:
            Color(.brandPrimaryRed)
        }
    }
}


struct IngredientLikesChecklist_Previews: PreviewProvider {
    static var previews: some View {
        SearchCriteriaView(isShowingIngredientsList: .constant(true), isShowingPreferences: true, selectedLikesOrDislikes: .likes)
            .environmentObject(SearchCriteriaViewModel())
    }
}





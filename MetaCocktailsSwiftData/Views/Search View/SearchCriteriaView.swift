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
        
        NavigationView {
            
            VStack{
                Picker("Choose a preferences list", selection: $selectedList){
                    ForEach(PreferenceType.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                .foregroundColor(Color.red)
//                .padding()
                
                Picker("Pick Out Likes Or Dislikes", selection: $selectedLikesOrDislikes) {
                    ForEach(LikesOrDislikes.allCases, id: \.self) {
                        
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                .onChange(of: selectedLikesOrDislikes) {
                    isShowingPreferences.toggle()
                    
                }
                .foregroundColor(Color.red)
//                .padding()
                
                ChosenListView(isShowingLikes: $isShowingPreferences, selectedType: $selectedList)
   
            }
            
        }
        .overlay(Button {
            isShowingIngredientsList = false
        }label: {
            XDismissButton()
        }, alignment: .topTrailing)
    }
}

enum PreferenceType: String, CaseIterable {
    
    case all      = "All"
    case spirits  = "Spirits"
    case profiles = "Profiles"
    case flavors  = "Flavors"
    case style    = "Style"
}

enum LikesOrDislikes: String, CaseIterable {
    
    case likes = "Likes"
    case dislikes = "Dislikes"
    
}

struct ChosenListView: View {
    @Binding var isShowingLikes: Bool
    @Binding var selectedType: PreferenceType
    
    var body: some View {
                
        switch selectedType {
        case .spirits:
            ListView(selectedList: $selectedType, navigationTitle: "Spirit Preferences", isShowingLikes: $isShowingLikes)
        case .profiles:
            ListView(selectedList: $selectedType, navigationTitle: "Profile Preferences", isShowingLikes: $isShowingLikes)
        case .flavors:
            ListView(selectedList: $selectedType, navigationTitle: "Flavor Preferences", isShowingLikes: $isShowingLikes)
        case .style:
            ListView(selectedList: $selectedType, navigationTitle: "Style Preferences", isShowingLikes: $isShowingLikes)
        default:
            ListView(selectedList: $selectedType, navigationTitle: "All Selections", isShowingLikes: $isShowingLikes)
        }
    }
}

struct IngredientLikesChecklist_Previews: PreviewProvider {
    static var previews: some View {
        SearchCriteriaView(isShowingIngredientsList: .constant(true), isShowingPreferences: true, selectedLikesOrDislikes: .likes)
            .environmentObject(SearchCriteriaViewModel())
    }
}





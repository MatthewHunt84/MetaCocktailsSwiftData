//
//  AdvancedFiltersView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/11/24.
//

import SwiftUI

struct AdvancedFiltersView: View {
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
                        }
                    }) {
                        Text("Clear Search")
                          
                    }
                    .padding(10)
                    .font(.footnote).bold()
                    .background(Color(UIColor.systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 140))
                    .shadow(color: Color(UIColor.systemGray), radius: 2, x: 0, y: 0)
                    .foregroundColor(Color(UIColor.systemCyan))
                   
                    

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

#Preview {
    AdvancedFiltersView(isShowingIngredientsList: .constant(true), isShowingPreferences: true)
}

//
//  BasicSearchView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/11/24.
//

import SwiftUI

struct BasicSearchView: View {
    @EnvironmentObject var viewModel: SearchCriteriaViewModel
    @State var isShowingPreferences: Bool
    @State var selectedLikesOrDislikes: LikesOrDislikes = .likes
    @State var selectedFlavorsOrIngredients: FlavorsOrIngredient = .flavors
    @State var isShowingFlavors: Bool 
 
    var body: some View {
        
        NavigationStack {
            VStack{
                HStack {
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
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                    NavigationLink { SearchCriteriaView(isShowingIngredientsList: .constant(true), isShowingPreferences: true)
                    } label: {
                        HStack {
                            VStack {
                                Image(systemName: "magnifyingglass")
                                Text("Advanced")
                                    .font(.footnote)
                            }
                        }
                    }
                    .padding(5)
                    .font(.footnote).bold()
                }
                
                BasicListView(isShowingLikes: $isShowingPreferences, isShowingFlavors: $isShowingFlavors)
                    
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
                    
                    .font(.footnote).bold()
                    .buttonStyle(whiteButton())
                    Menu("Search Type") {
                        Button("Search by flavor.", action: {
                            isShowingFlavors = true
                        })
                        Button("Search by ingredient.", action: {
                           isShowingFlavors = false
                        })
                    }
                    .font(.footnote).bold()
                    .buttonStyle(whiteButton())
                }
            }
            .navigationTitle("Select Ingredients")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    BasicSearchView(isShowingPreferences: true, selectedLikesOrDislikes: .likes, isShowingFlavors: true)
        .environmentObject(SearchCriteriaViewModel())
}

enum FlavorsOrIngredient: String, CaseIterable {
    
    case flavors = "Search Flavors"
    case dislikes = "Search Ingredients"
}

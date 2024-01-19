//
//  BasicSearchView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/11/24.
//

import SwiftUI

struct BasicSearchView: View {
    @EnvironmentObject var viewModel: SearchCriteriaViewModel
    @State var isShowingPreferences: Bool = true
    @State var selectedLikesOrDislikes: LikesOrDislikes = .likes
    @State var selectedFlavorsOrIngredients: FlavorsOrIngredient = .flavors
    @State var isShowingFlavors: Bool = true
    
//    init() {
//       
////        UISegmentedControl.appearance().selectedSegmentTintColor = .brandPrimaryYellow
////        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.black], for: .selected)
//       
//    }
    var body: some View {
        
        NavigationStack {
            VStack{
                GeometryReader { geometry in
                    VStack{
                      
                        HStack {
                            Text("Select Ingredients")
                                .font(.largeTitle).bold()
                                .padding(EdgeInsets(top: 0, leading: 12, bottom: -7, trailing: 0))
                            Spacer()
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.05, alignment: .bottom)
                        
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
                                            .foregroundStyle(Color(.systemCyan))
                                        Text("Advanced")
                                            .font(.footnote)
                                            .foregroundStyle(Color(.systemCyan))
                                    }
                                }
                            }
                            .padding(5)
                            .font(.footnote).bold()
                        }
                        BasicListView(isShowingLikes: $isShowingPreferences, isShowingFlavors: $isShowingFlavors)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.9, alignment: .top)
                    
                    
                    HStack {
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
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
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
                        .font(.footnote).bold()
                        .buttonStyle(whiteButton())
                        
                        
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .bottom)
                }
            }
        }
    }
}

#Preview {
    BasicSearchView()
        .environmentObject(SearchCriteriaViewModel())
}

enum FlavorsOrIngredient: String, CaseIterable {
    
    case flavors = "Search Flavors"
    case dislikes = "Search Ingredients"
}

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
            GeometryReader { geometry in
                VStack{
                    VStack{
                        
                        HStack {
                            Text("Select Ingredients")
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
                            .offset(x: -19, y: 5.0)
                            .foregroundStyle(.white)
                        }
                        
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
                                            .foregroundStyle(.white)
                                        Text("Advanced")
                                            .font(.footnote)
                                            .foregroundStyle(.white)
                                    }
                                }
                            }
                            .padding(5)
                            .font(.footnote).bold()
                        }
                        
                        
                        BasicComponentSearchListView(isShowingLikes: $isShowingPreferences, isShowingFlavors: $isShowingFlavors)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.85, alignment: .center)
                    
                    
                    
                    HStack {
                        GeometryReader { buttonGeo in
                            HStack{
                                Menu("Search Type") {
                                    Button("Search by flavor.", action: {
                                        isShowingFlavors = true
                                    })
                                    Button("Search by ingredient.", action: {
                                        isShowingFlavors = false
                                    })
                                }
                                .font(.footnote)
                                .buttonStyle(whiteButton())
                                .frame(width: buttonGeo.size.width * 0.35, height: buttonGeo.size.height, alignment: .trailing)
                                
                                NavigationLink {
                                    SearchResultsView(viewModel: viewModel)
                                    
                                } label: {
                                    Text("Search")
                                        .font(.headline).bold()
                                        .padding(25)
                                        .background(viewModel.selectedPreferredIngredients().count == 0 ? Color(UIColor.black) : Color.brandPrimaryGreen)
                                        .clipShape(Circle())
                                        .shadow(color: Color(UIColor.systemGray), radius: 4)
                                        .foregroundColor(viewModel.selectedPreferredIngredients().count == 0 ? Color(UIColor.systemGray) : Color.white)
                                    
                                }
                                .frame(width: buttonGeo.size.width * 0.3, height: buttonGeo.size.height, alignment: .center)
                                
                                Button(action: {
                                    for i in 0..<viewModel.cocktailComponents.count {
                                        viewModel.cocktailComponents[i].isPreferred = false
                                        viewModel.cocktailComponents[i].isUnwanted = false
                                        viewModel.enableMultipleSpiritSelection = false
                                        
                                    }
                                }) {
                                    Text("Clear Search")
                                    
                                }
                                .font(.footnote)
                                .buttonStyle(whiteButton())
                                .frame(width: buttonGeo.size.width * 0.35, height: buttonGeo.size.height, alignment: .leading)
                                
                            }
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.15, alignment: .top)
                        .offset(CGSize(width: -8, height: 0))
                        
                    }
                    
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

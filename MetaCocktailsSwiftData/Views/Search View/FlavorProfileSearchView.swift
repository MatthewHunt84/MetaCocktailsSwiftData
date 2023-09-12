////
////  FlovorProfileSearchView.swift
////  MetaCocktails
////
////  Created by James on 8/9/23.
////
//
//import SwiftUI
//
//struct FlavorProfileSearchView: View {
//
//    @EnvironmentObject var criteria: SearchCriteriaViewModel
//
//    @State var isShowingIngredientsList = false
//    @State var isShowingIngredientDislikesList = false
//
//    @State var preferredIngredients: [CocktailComponentEnum] = []
//
//    var roundButtonFrameSize = CGFloat(20)
//
//    var body: some View {
//        
//        VStack{
//            List(criteria.selectedPreferredIngredients()){ criteria in
//                if criteria.isPreferred {
//
//                    Text(criteria.name)
//                        .foregroundColor(Color.brandPrimaryGreen)
//                }
//            }
//
//            List(criteria.selectedUnwantedIngredients()) { criteria in
//
//                if criteria.isUnwanted {
//                    Text("- \(criteria.name)")
//                        .foregroundColor(Color.brandPrimaryRed)
//                }
//            }
//
//            Button(action: {
//                for i in 0..<criteria.cocktailComponents.count {
//                    criteria.cocktailComponents[i].isPreferred = false
//                    criteria.cocktailComponents[i].isUnwanted = false
//                }
//            }) {
//                Text("Clear Search")
//                    .fontWeight(.bold)
//            }
//            .padding(10)
//            .background(Color(UIColor.systemBackground))
//            .clipShape(RoundedRectangle(cornerRadius: 20))
//            .shadow(color: Color(UIColor.systemGray), radius: 10, x: 0, y: 0)
//
//            HStack {
//
//                Button(action: {isShowingIngredientsList = true} ) {
//
//                    VStack{
//
//                        Image("greenCoupe")
//                            .resizable()
//                            .frame(width: 40, height: 40)
//
//                        Text("Likes")
//                            .fontWeight(.bold)
//                    }
//                    .padding(30)
//                    .background(Color(UIColor.systemBackground))
//                    .clipShape(Circle())
//                    .frame(width: 110, height: 110)
//                    .shadow(color: Color(UIColor.systemGray), radius: 10, x: 0, y: 0)
//                    .foregroundColor(Color.brandPrimaryGreen)
//
//                }
//                .sheet(isPresented: $isShowingIngredientsList) {
//                    SearchCriteriaView(isShowingIngredientsList: $isShowingIngredientsList)
//                }
//
//                Button(action: {}) {
//                    VStack {
//                        Image(systemName: "magnifyingglass")
//                            .resizable()
//                            .frame(width: roundButtonFrameSize, height: roundButtonFrameSize)
//                        Text("Search")
//                            .fontWeight(.bold)
//                    }
//                }
//                .modifier(RoundButtonStyle())
//
//                Button(action: {isShowingIngredientDislikesList = true} ) {
//                    VStack{
//                        Image("redCoupe")
//                            .resizable()
//                            .frame(width: 40, height: 40)
//                            .offset(x: -3, y: 0)
//                        Text("Dislikes")
//                            .fontWeight(.bold)
//                    }
//                    .modifier(RoundButtonStyle())
//                    .foregroundColor(Color.brandPrimaryRed)
//
//                }
////                .sheet(isPresented: $isShowingIngredientDislikesList) {
////                    ComponentDislikesChecklistView(isShowingIngredientDislikesList: $isShowingIngredientDislikesList)
//                }
//            }
//            .padding()
//        }
//    }
//}
//
//struct FlavorProfileSearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        FlavorProfileSearchView()
//            .environmentObject(SearchCriteriaViewModel())
//    }
//}

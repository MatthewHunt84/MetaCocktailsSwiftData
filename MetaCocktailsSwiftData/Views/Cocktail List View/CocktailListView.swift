//
//  CocktailListView.swift
//  MetaCocktails
//
//  Created by James on 8/8/23.
//

import SwiftUI

struct CocktailListView: View {
    @EnvironmentObject var criteria: SearchCriteriaViewModel
    @StateObject var viewModel = CocktailListViewModel()
    //@Environment(\.modelContext) private var modelContext
    

    
    
    var body: some View {
        
        NavigationStack{
            VStack {
                HStack {
                    Text("Cocktails")
                        .font(.largeTitle).bold()
                        .padding(EdgeInsets(top: 0, leading: 12, bottom: -7, trailing: 0))
                    Spacer()
                    
//                    NavigationLink {
//                        viewModel.getRandomCocktailView(for: criteria.menuMode)
//                            
//                            
//                    } label: {
//                        Image("dice")
//                            .resizable()
//                            .frame(width: 40, height: 40, alignment: .center)
//                            .foregroundStyle(Color.white)
////                            .offset(CGSize(width: 0, height: 5.0))
//                    }
//                    .padding(10)
//                    NavigationLink {
//                        EightySixListView()
//                    } label: {
//                        VStack{
//                            Image(systemName: "list.clipboard")
//                                .foregroundStyle(Color.white)
//                            Text("86")
//                                .foregroundStyle(Color.white)
//                        }
//                    }
//                    .padding(10)
//                    Menu("", systemImage: "gearshape") {
//                        Button("Bartender Mode") {
//                            criteria.menuMode = false
//                        }
//                        Button("Guest Mode") {
//                            criteria.menuMode = true
//                        }
//                        Button("Show Only Williams and Graham Cocktails") {
//                          viewModel.isShowingWnGCocktailsOnly = true
//                        }
//                        Button("Show All Cocktails") {
//                            viewModel.isShowingWnGCocktailsOnly = false
//                        }
//                        
//                    }
//                    .foregroundStyle(Color.white)
//                    .padding(10)
                    //.offset(CGSize(width: -10.0, height: 0))
                    
                }
                
                
                GeometryReader { listGeo in
                    
                    ScrollView {
                        ScrollViewReader { value in
                            HStack {
                                List{
                                    if criteria.menuMode{
                                        if viewModel.isShowingWnGCocktailsOnly {
                                            ForEach(criteria.alphabet, id: \.self) { letter in
                                                Section{
                                                    ForEach(viewModel.justWilliamsAndGrahamCocktails.filter({$0.cocktailName.hasPrefix(letter)}) , id: \.cocktailName) { item in
                                                        NavigationLink {
                                                            SearchGuestRecipeView(viewModel: CocktailMenuViewModel(cocktail: item))
                                                                //.navigationBarBackButtonHidden(true)
                                                        } label: {
                                                            Text(item.cocktailName)
                                                           
                                                        }
                                                    }
                                                } header: {
                                                    Text("\(letter)")
                                                        .fontWeight(.bold)
                                                        .font(.title)
                                                }.id(letter)
                                            }
                                        } else {
                                            ForEach(criteria.alphabet, id: \.self) { letter in
                                                Section{
                                                    ForEach(viewModel.guestViewCocktails.filter({$0.cocktailName.hasPrefix(letter)}) , id: \.cocktailName) { item in
                                                        NavigationLink {
                                                            GuestCocktailListView(cocktails: item.cocktailVariations, cocktailName: item.cocktailName)
                                                                .navigationBarBackButtonHidden(true)
                                                        } label: {
                                                            Text(item.cocktailName)
                                                            if item.cocktailVariations.count > 1 {
                                                                Text("(\(item.cocktailVariations.count))")
                                                            }
                                                        }
                                                    }
                                                } header: {
                                                    Text("\(letter)")
                                                        .fontWeight(.bold)
                                                        .font(.title)
                                                }.id(letter)
                                            }
                                        }
                                        
                                    } else {
                                        if viewModel.isShowingWnGCocktailsOnly {
                                            ForEach(criteria.alphabet, id: \.self) { letter in
                                                Section{
                                                    ForEach(viewModel.justWilliamsAndGrahamCocktails.filter({$0.cocktailName.hasPrefix(letter)}) , id: \.cocktailName) { item in
                                                        NavigationLink {
                                                            SearchBartenderRecipeView(viewModel: CocktailMenuViewModel(cocktail: item))
                                                                //.navigationBarBackButtonHidden(true)
                                                        } label: {
                                                            Text(item.cocktailName)
                                                           
                                                        }
                                                    }
                                                } header: {
                                                    Text("\(letter)")
                                                        .fontWeight(.bold)
                                                        .font(.title)
                                                }.id(letter)
                                            }

                                        } else {
                                            ForEach(criteria.alphabet, id: \.self) { letter in
                                                Section{
                                                    ForEach(viewModel.bartenderViewCocktails.filter({$0.cocktailName.hasPrefix(letter)}) , id: \.cocktailName) { item in
                                                        NavigationLink {
                                                            BartenderCocktailListView(cocktails: item.cocktailVariations, cocktailName: item.cocktailName)
                                                                .navigationBarBackButtonHidden(true)
                                                        } label: {
                                                            Text(item.cocktailName)
                                                            if item.cocktailVariations.count > 1 {
                                                                Text("(\(item.cocktailVariations.count))")
                                                            }
                                                        }
                                                    }
                                                } header: {
                                                    Text("\(letter)")
                                                        .fontWeight(.bold)
                                                        .font(.title)
                                                }.id(letter)
                                            }
                                        }
                                        
                                    }
                                    
                                }
                                .listStyle(.plain)
                                .frame(width: listGeo.size.width * 0.9, height: listGeo.size.height)
                                VStack {
                                    ForEach(0..<criteria.alphabet.count, id: \.self) { i in
                                        Button(action: {
                                            withAnimation {
                                                value.scrollTo(criteria.alphabet[i], anchor: .top)
                                            }
                                        }, label: {
                                            Text("\(criteria.alphabet[i])")
                                                .font(.headline).bold()
                                        })
                                        .buttonStyle(ScaleButtonStyle())
                                    }
                                }
                                .frame(width: listGeo.size.width * 0.1, height: listGeo.size.height)
                                .offset(x: -4, y: 5)
                            }
                        }
                    }
                }
                
            }
//            .task {
//                viewModel.randomCocktail = viewModel.fetchRandomCocktail()
//                
//            }
        }
        
    }
    
    
}

struct CocktailListView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailListView(viewModel: CocktailListViewModel())
            .environmentObject(SearchCriteriaViewModel())
    }
}
struct ScaleButtonStyle : ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.scaleEffect(configuration.isPressed ? 2.5 : 1)
            .shadow(radius: 30)
        
    }
}

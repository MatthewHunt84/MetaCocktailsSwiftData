//
//  CocktailListView.swift
//  MetaCocktails
//
//  Created by James on 8/8/23.
//

import SwiftUI
import SwiftData

struct CocktailListView: View {
    @EnvironmentObject var criteria: SearchCriteriaViewModel
    @StateObject var viewModel = CocktailListViewModel()
    @Query(sort: \Cocktail.cocktailName) var cocktails: [Cocktail]
    @Environment(\.modelContext) private var modelContext
    
    func selectedCocktailVariations(for cocktail: Cocktail) -> [Cocktail] {
        if let variation = cocktail.variation {
            return cocktails.filter({$0.variation == variation})
        } else {
            return [cocktail]
        }

    }
    
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
                                                    ForEach(cocktails.filter({$0.cocktailName.hasPrefix(letter)}) , id: \.cocktailName) { cocktail in
                                                        NavigationLink {
                                                            BartenderCocktailListView(cocktail: cocktail, variations: selectedCocktailVariations(for: cocktail))
                                                                .navigationBarBackButtonHidden(true)
                                                        } label: {
                                                            Text(cocktail.cocktailName)
                                                            if let variation = cocktail.variation {
                                                                Text("(\(selectedCocktailVariations(for: cocktail).count))")
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
            .task {
                // This needs to be in a pre load function that runs before the app loads for the first time, not as an async task here because it loads too slow.
                for cocktail in viewModel.bartenderCocktails {
                    modelContext.insert(cocktail)
                }
            }
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

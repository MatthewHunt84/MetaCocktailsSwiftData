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
    @State private var alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    
    var body: some View {
        
        GeometryReader { geometry in
//           
            NavigationStack{
                VStack {
                    HStack {
                        Text("Cocktails")
                            .font(.largeTitle).bold()
                            .padding(EdgeInsets(top: 0, leading: 12, bottom: -7, trailing: 0))
                        Spacer()
                        Menu("", systemImage: "gearshape") {
                            Button("Bartender Mode") {
                                criteria.menuMode = false
                            }
                            Button("Guest Mode") {
                                criteria.menuMode = true
                            }
                        }
                        .offset(CGSize(width: -10.0, height: 0))
                        
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.06, alignment: .bottomLeading)
                    
                    GeometryReader { listGeo in
                        
                        ScrollView {
                            ScrollViewReader { value in
                                HStack {
                                    List{
                                        ForEach(alphabet, id: \.self) { letter in
                                            Section {
                                                ForEach(viewModel.cocktails.filter { $0.cocktailName.hasPrefix(letter) }, id: \.self) { cocktail in
                                                    NavigationLink {
                                                        if criteria.menuMode {
                                                            CocktailMenuView(viewModel: CocktailMenuViewModel(cocktail: cocktail))
                                                        } else {
                                                            RecipeIngredientsView(viewModel: CocktailMenuViewModel(cocktail: cocktail))
                                                        }
                                                        
                                                    } label: {
                                                        Text(cocktail.cocktailName)
                                                    }
                                                }
                                            } header: {
                                                Text("\(letter)")
                                                    .fontWeight(.bold)
                                                    .font(.title)
                                            }.id(letter)
                                        }
                                    }
                                    .listStyle(.plain)
                                    .frame(width: listGeo.size.width * 0.9, height: listGeo.size.height)
                                    VStack {
                                        ForEach(0..<alphabet.count, id: \.self) { i in
                                            Button(action: {
                                                withAnimation {
                                                    value.scrollTo(alphabet[i], anchor: .top)
                                                }
                                            }, label: {
                                                Text("\(alphabet[i])")
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
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.9)
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

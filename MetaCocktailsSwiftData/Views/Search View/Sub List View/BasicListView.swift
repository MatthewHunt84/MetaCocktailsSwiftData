//
//  BasicListView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/11/24.
//

import SwiftUI

struct BasicListView: View {
    @EnvironmentObject var viewModel: SearchCriteriaViewModel
    var navigationTitle: String
    @Binding var isShowingLikes: Bool
  
    
    var alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    var body: some View {
        ZStack{
            VStack{
                ScrollView {
                    ScrollViewReader { value in
                        HStack{
                            List{
                                ForEach(alphabet, id: \.self) { letter in
                                    Section {
                                        ForEach( $viewModel.basicCocktailComponents.filter({$0.name.wrappedValue.hasPrefix(letter)}), id: \.self.id) { ingredient in
                                            if isShowingLikes  {
                                                if ingredient.isUnwanted.wrappedValue == false && ingredient.matchesCurrentSearch.wrappedValue {
                                                    PreferencesCheckListCell(ingredient: ingredient, isShowingPreferences: isShowingLikes)
                                                    
                                                }
                                            } else {
                                                if ingredient.isPreferred.wrappedValue == false && ingredient.matchesCurrentSearch.wrappedValue  {
                                                    PreferencesCheckListCell(ingredient: ingredient, isShowingPreferences: isShowingLikes)
                                                        .tint(.red)
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
                            .listStyle(.plain)
                            
                            HStack{
                                VStack {
                                    ForEach(0..<alphabet.count, id: \.self) { i in
                                        Button(action: {
                                            withAnimation {
                                                value.scrollTo(alphabet[i], anchor: .top)
                                            }
                                            
                                        }, label: {
                                            Text("\(alphabet[i])")
                                                .font(.subheadline).bold()
                                                .frame(width: 35, height: 14)
                                        })
                                        .foregroundStyle(Color(.black))
                                        .buttonStyle(ScaleButtonStyle())
                                        
                                        
                                    }
                                }
                            }
                            
                        }
                    }
                }
                .scrollDisabled(true)
                
            }
        }
    }
}

#Preview {
    BasicListView(navigationTitle: "Tits", isShowingLikes: .constant(true), alphabet: ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"])
        .environmentObject(SearchCriteriaViewModel())
}

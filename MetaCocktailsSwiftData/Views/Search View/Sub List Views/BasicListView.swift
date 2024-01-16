//
//  BasicListView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/11/24.
//

import SwiftUI

struct BasicListView: View {
    @EnvironmentObject var viewModel: SearchCriteriaViewModel
    @Binding var isShowingLikes: Bool
    @Binding var isShowingFlavors: Bool
  
    
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
                                        if isShowingFlavors {
                                            ForEach( $viewModel.basicCocktailComponentsForFlavorsView.filter({$0.name.wrappedValue.hasPrefix(letter)}), id: \.self.id) { component in
                                                if isShowingLikes  {
                                                    if component.isUnwanted.wrappedValue == false && component.matchesCurrentSearch.wrappedValue {
                                                        PreferencesCheckListCell(ingredient: component, isShowingPreferences: isShowingLikes)
                                                        
                                                    }
                                                } else {
                                                    if component.isPreferred.wrappedValue == false && component.matchesCurrentSearch.wrappedValue  {
                                                        PreferencesCheckListCell(ingredient: component, isShowingPreferences: isShowingLikes)
                                                            .tint(.red)
                                                    }
                                                }
                                            }
                                        } else {
                                            ForEach( $viewModel.basicCocktailComponentsForIngredientsView.filter({$0.name.wrappedValue.hasPrefix(letter)}), id: \.self.id) { ingredient in
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
                                                .frame(width: 35, height: 12)
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
    BasicListView(isShowingLikes: .constant(true), isShowingFlavors: .constant(true), alphabet: ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"])
        .environmentObject(SearchCriteriaViewModel())
}

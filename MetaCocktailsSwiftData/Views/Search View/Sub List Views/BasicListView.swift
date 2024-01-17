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
        
            VStack{
                ScrollView {
                    ScrollViewReader { value in
                        HStack{
                            List{
                                ForEach(alphabet, id: \.self) { letter in
                                    Section {
                                        if isShowingFlavors {
                                            ForEach( $viewModel.cocktailComponents.filter({$0.name.wrappedValue.hasPrefix(letter)}), id: \.self.id) { component in
                                                if isShowingLikes  {
                                                    if component.isUnwanted.wrappedValue == false && component.matchesCurrentSearch.wrappedValue && (component.isFlavor.wrappedValue || component.isSpirit.wrappedValue)  {
                                                        PreferencesCheckListCell(ingredient: component, isShowingPreferences: isShowingLikes)
                                                        
                                                    }
                                                } else {
                                                    if component.isPreferred.wrappedValue == false && component.matchesCurrentSearch.wrappedValue && (component.isFlavor.wrappedValue || component.isSpirit.wrappedValue)  {
                                                        PreferencesCheckListCell(ingredient: component, isShowingPreferences: isShowingLikes)
                                                            .tint(.red)
                                                    }
                                                }
                                            }
                                        } else {
                                            ForEach( $viewModel.cocktailComponents.filter({$0.name.wrappedValue.hasPrefix(letter)}), id: \.self.id) { component in
                                                if isShowingLikes  {
                                                    if component.isUnwanted.wrappedValue == false && component.matchesCurrentSearch.wrappedValue && (component.isNA.wrappedValue || component.isSpirit.wrappedValue) {
                                                        PreferencesCheckListCell(ingredient: component, isShowingPreferences: isShowingLikes)
                                                        
                                                    }
                                                } else {
                                                    if component.isPreferred.wrappedValue == false && component.matchesCurrentSearch.wrappedValue && (component.isNA.wrappedValue || component.isSpirit.wrappedValue) {
                                                        PreferencesCheckListCell(ingredient: component, isShowingPreferences: isShowingLikes)
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
                            
                            
                            VStack {
                                ForEach(0..<alphabet.count, id: \.self) { i in
                                    Button(action: {
                                        withAnimation {
                                            value.scrollTo(alphabet[i], anchor: .top)
                                        }
                                        
                                    }, label: {
                                        Text("\(alphabet[i])")
                                            .font(.subheadline).bold()
                                            //.frame(width: 35, height: 10)
                                    })
                                    .foregroundStyle(Color(.black))
                                    .buttonStyle(ScaleButtonStyle())
                                    
                                    
                                }
                            }
                            .containerRelativeFrame(.vertical, count: 1, spacing: 0)
                            
                            
                        }
                    }
                }
                .scrollDisabled(true)
                
            }
       
    }
}

#Preview {
    BasicListView(isShowingLikes: .constant(true), isShowingFlavors: .constant(true), alphabet: ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"])
        .environmentObject(SearchCriteriaViewModel())
}

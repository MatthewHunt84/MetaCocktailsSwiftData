//
//  PrepBible.swift
//  MetaCocktails
//
//  Created by James on 8/9/23.
//

import SwiftUI

struct PrepBibleListView: View {
    
    @StateObject var prepViewModel = PrepBibleViewModel()

    var body: some View {
        VStack{
            NavigationStack {
             
                    HStack {
                        Text("Prep Ingredients ⏲️")
                            .font(.largeTitle).bold()
                            .padding(EdgeInsets(top: 0, leading: 12, bottom: -7, trailing: 0))
                        Spacer()
                    }
//                    frame(width: g.size.width, height: g.size.height * 0.1, alignment: .top)
                    List {
                        ForEach(prepViewModel.prepIngredients, id: \.self) { prepItem in
                            NavigationLink(prepItem.prepIngredientName){
                                PrepRecipeView(prep: prepItem)
                            }
                            
                            
                        }
                    }
//                    frame(width: g.size.width, height: g.size.height * 0.9, alignment: .center)
                        .listStyle(.plain)
                    
                }
            
        }
        
    }
}

struct PrepBible_Previews: PreviewProvider {
    static var previews: some View {
        PrepBibleListView()
    }
}

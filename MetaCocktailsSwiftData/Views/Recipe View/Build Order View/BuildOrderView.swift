//
//  BuildOrderView.swift
//  MetaCocktails
//
//  Created by James on 8/8/23.
//

import SwiftUI

struct BuildOrderView: View {
    
    
    let buildOrder: Build
    
    var body: some View {
        NavigationStack {
            VStack{
                
                List {
                    ForEach(buildOrder.instructions) { build in
                        HStack {
                            
                            Text("\(build.step). \(build.method)")
                            
                        }
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
                        .multilineTextAlignment(.leading)
                        
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Build Order")
            
        }
        
    }
}

struct BuildOrderView_Previews: PreviewProvider {
    static var previews: some View {
        BuildOrderView(buildOrder: ramosGinFizz.buildOrder ?? Build(instructions: [Instruction(step: 1, method: "Quit your job")]))
    }
}

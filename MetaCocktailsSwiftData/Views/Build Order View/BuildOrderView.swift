//
//  BuildOrderView.swift
//  MetaCocktails
//
//  Created by James on 8/8/23.
//

import SwiftUI

struct BuildOrderView: View {
    
    @Binding var isShowingBuildOrder: Bool
    let buildOrder: Build
    
    var body: some View {
        NavigationStack {
            VStack{
                
                ScrollView {
                    
                    //Formatting will be all messed up, but the data should show
                    
                    Spacer()
                    
                    ForEach(buildOrder.instructions) { build in
                        HStack {
                            Text(String(build.step))
                            Text(build.method)
                        }
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(.leading)
                        .padding(.trailing)
                    }
                }
            }
            .navigationTitle("Build Order")
            
        }
        .overlay(Button {
            isShowingBuildOrder = false
        }label: {
            XDismissButton()
        }, alignment: .topTrailing)
    }
}

//struct BuildOrderView_Previews: PreviewProvider {
//    static var previews: some View {
//        BuildOrderView(isShowingBuildOrder: .constant(true), buildOrder: ramosGinFizz.buildOrder ?? Build(instructions: [Instruction(step: 1, method: "Quit your job")]))
//    }
//}

//
//  BottleMathModalView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 9/18/24.
//

import SwiftUI

struct BottleMathModalView: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @FocusState.Binding var isFocused: Bool
    @State private var numberOfBottlesText: String = ""
    @State private var bottleSizeText: String = ""
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.black)
                .frame(width: .infinity, height: .infinity, alignment: .center)
                .ignoresSafeArea()
            VStack {
                FontFactory.titleHeader22(title: "Calculate by number of available bottles:")
                    .padding()
                    .multilineTextAlignment(.center)
                HStack{
                    Text("What volume are the bottles?")
                        .font(FontFactory.formLabel18)
                    TextField("\(bottleSizeText)", text: $bottleSizeText)
                        .font(FontFactory.formLabel18)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 5)
                        .keyboardType(.numberPad)
                        .frame(width: 80)
                        .background(Color(UIColor.systemGray5))
                        .cornerRadius(10)
                        .focused($isFocused)
                    Text("ml")
                        .font(FontFactory.formLabel18)
                }
                Text("How many bottles do you have?")
                    .font(FontFactory.formLabel18)
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "plus.circle")
                            .tint(.blueTint)
                    }
                    TextField("\(numberOfBottlesText)", text: $numberOfBottlesText)
                        .font(FontFactory.formLabel18)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 5)
                        .keyboardType(.numberPad)
                        .frame(width: 80)
                        .background(Color(UIColor.systemGray5))
                        .cornerRadius(10)
                        .focused($isFocused)
                    Button {
                        
                    } label: {
                        Image(systemName: "minus.circle")
                            .tint(.blueTint)
                    }
                }
                Spacer()
            }
            
        }
        
        
    }
}

#Preview {
    @FocusState var previewFocused: Bool
    return BottleMathModalView(isFocused: $previewFocused)
        .environmentObject(CBCViewModel())
}

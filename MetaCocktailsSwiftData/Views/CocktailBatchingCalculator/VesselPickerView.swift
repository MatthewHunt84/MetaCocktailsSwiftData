//
//  VesselPickerView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/11/24.
//

import SwiftUI

struct VesselPickerView: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @State var containerSizes: ContainerSize = .sevenLiter
    
    var body: some View {
        VStack {
            Text("Choose Your Container Size")
                .dynamicTypeSize(.xxLarge).bold()
            Picker("Choose Your Container", selection: $containerSizes) {
                ForEach(ContainerSize.allCases, id: \.self) {
                    Text($0.rawValue)
                    
                }
                
            }
            .pickerStyle(.wheel)
            Text("At least 10% of the container's volume will be left empty for safe transportation.")
                .multilineTextAlignment(.center)
                .dynamicTypeSize(.large).bold()
                .padding(10)
            
            NavigationLink{
                SplitBatchView()
            } label: {
                Text("Divide the Batch")
            }
            .buttonStyle(BlackNWhiteButton())
        }
    
    }
}

#Preview {
    VesselPickerView()
        .environmentObject(CBCViewModel())
}


enum ContainerSize: String, CaseIterable {
    
    case fourLiter        = "4 Liter"
    case fiveLiter        = "5 Liter"
    case sixLiter         = "6 Liter"
    case sevenLiter       = "7 Liter"
    case eightLiter       = "8 Liter"
    case nineLiter        = "9 Liter"
    case tenLiter         = "10 Liter"
    case elevenLiter      = "11 Liter"
    case twelveLiter      = "12 Liter"
    case thirteenLiter    = "13 Liter"
    case fourteenLiter    = "14 Liter"
    case fifteenLiter     = "15 Liter"
    case sixteenLiter     = "16 Liter"
    case seventeenLiter   = "17 Liter"
    case eighteenLiter    = "18 Liter"
    case fiveGallonBucket = "5 Gallon Bucket"
    
    
    
}

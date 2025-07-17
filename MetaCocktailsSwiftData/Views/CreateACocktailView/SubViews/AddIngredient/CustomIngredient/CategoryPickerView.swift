//
//  CategoryPickerView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/14/25.
//

import SwiftUI

struct CategoryPickerView: View {
    @Bindable var viewModel: AddCocktailViewModel
    var body: some View {
        Section(header: Text("Category").font(FontFactory.sectionHeader12)) {
            HStack{
                Menu {
                    ForEach(UmbrellaCategory.allCases, id: \.self) { category in
                        
                        Button("\(category.rawValue)") {
                            viewModel.category = category
                            viewModel.dynamicallyChangeMeasurementUnit()
                        }
                    }
                } label: {
                    HStack{
                        Text(viewModel.category.rawValue)
                            .font(FontFactory.formLabel18)
                        Image(systemName: "chevron.down")
                            .foregroundStyle(.gray)
                        Spacer()
                        
                    }
                }
                .tint(.primary)
            }
        }
    }
}

#Preview {
    CategoryPickerView(viewModel: AddCocktailViewModel())
}

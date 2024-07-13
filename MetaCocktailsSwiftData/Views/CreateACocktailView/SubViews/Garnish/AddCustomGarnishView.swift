//
//  AddCustomGarnishView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 7/10/24.
//

import SwiftUI
import SwiftData

struct AddCustomGarnishView: View {
    @Bindable var viewModel: AddCocktailViewModel
    @FocusState private var keyboardFocused: Bool
    @FocusState private var amountKeyboardFocused: Bool
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack {
                    HStack{
                        BackButton()
                        Spacer()
                    }
                    .padding(.horizontal)
                    HStack {
                        Text("Custom Garnish")
                            .font(.largeTitle).bold()
                        Spacer()
                    }
                    .padding(.horizontal)
                    Form {
                        Section("Name") {
                            TextField("Garnish Name", text: $viewModel.currentGarnishName)
                                .focused($keyboardFocused)
                        }
                        AddCustomGarnishToCocktailButton(viewModel: viewModel)
                    }
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            KeyboardDoneButton(keyboardFocused: _keyboardFocused, amountKeyboardFocused: _amountKeyboardFocused)
                        }
                    }
                    .task {
                        keyboardFocused = true
                    }
                }
            }
        }
    }
}

#Preview {
    AddCustomGarnishView(viewModel: AddCocktailViewModel())
}

struct AddCustomGarnishToCocktailButton: View {
    @Bindable var viewModel: AddCocktailViewModel
    @Environment(\.dismiss) private var dismiss
    @Query(sort: \Garnish.name) var garnish: [Garnish]

    
    var body: some View {
        Button{
            if viewModel.customGarnishIsValid(allGarnishes: garnish){
                viewModel.addedGarnish.append(Garnish(name: viewModel.currentGarnishName))
                viewModel.clearIngredientData()
                viewModel.addExistingGarnishViewIsActive = false
            } else {
                for name in garnish {
                    if name.name == viewModel.currentGarnishName {
                        viewModel.addedGarnish.append(name)
                        viewModel.clearIngredientData()
                        viewModel.addExistingGarnishViewIsActive = false
                    }
                }
            }
          
        } label: {
            
            HStack {
                Image(systemName: "plus.circle.fill")
                    .font(.footnote).bold()
                Text("Add to spec")
                    .font(.footnote).bold()
            }
            .tint(.brandPrimaryGold)
            .padding()
        }
        .frame(width: 380, height: 40,  alignment: .center)
    }
}

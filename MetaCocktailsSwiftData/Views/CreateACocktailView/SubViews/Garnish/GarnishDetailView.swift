//
//  GarnishDetailView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 7/10/24.
//

import SwiftUI
import SwiftData

struct GarnishDetailView: View {
    @Bindable var viewModel: AddCocktailViewModel
    @FocusState private var keyboardFocused: Bool
    @FocusState private var amountKeyboardFocused: Bool
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
   
    var body: some View {
        
        NavigationStack{
            
            ZStack{
                
                MeshGradients.meshBlueRibbonBackground.ignoresSafeArea()

                    Form {
                        AddGarnishSearchView(viewModel: viewModel, keyboardFocused: _keyboardFocused)
                        AddExistingGarnishToCocktailButton(viewModel: viewModel)
                        
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .goldHeaderWithNavigation(title: "Add Ingredient", dismiss: dismiss)
                    .toolbar {
                        ToolbarItem(placement: .bottomBar) { CreateCustomGarnishButton(viewModel: viewModel) }
                        ToolbarItemGroup(placement: .keyboard) {
                            KeyboardDoneButton(keyboardFocused: _keyboardFocused, amountKeyboardFocused: _amountKeyboardFocused)
                        }
                    }
                    .task {
                        keyboardFocused = true
                    }

                if viewModel.isShowingingredientAlert {
                    CustomAlertView(isActive: $viewModel.isShowingingredientAlert,
                                    title: "",
                                    message: "Please choose from an existing garnish. If you'd like to make your own, press 'Create Custom Garnish'",
                                    buttonTitle: "Heard, Chef",
                                    action: {})
                    .zIndex(2)
                }
            }

        }
    }
}


#Preview {
    GarnishDetailView(viewModel: AddCocktailViewModel())
}

struct AddGarnishSearchView: View {
    
    @Bindable var viewModel: AddCocktailViewModel
    @FocusState var keyboardFocused: Bool
    @Query(sort: \Garnish.name) var garnish: [Garnish]
    @State private var filteredGarnish: [String] = []
    
    
    var body: some View {
        Section("Name") {
            VStack{
                TextField("Garnish Name", text: $viewModel.currentGarnishName)
                    .focused($keyboardFocused)
                    .onChange(of: viewModel.currentGarnishName, initial: true) { old, new in
                        viewModel.currentGarnishName = new
                        filteredGarnish = viewModel.matchAllGarnish(garnishes: garnish)
                    }
            }
            
            if keyboardFocused {
                List {
                    ForEach(filteredGarnish, id: \.self) { garnish in
                        
                        Button {
                            viewModel.currentGarnishName = garnish
                            viewModel.didChooseExistingGarnish = true
                            keyboardFocused = false
                        } label: {
                            Text(garnish)
                        }
                        .tint(.white)
                        
                        
                    }
                    .listStyle(.plain)
                    .listRowBackground(Color.black)
                    
                }
                .scrollContentBackground(.hidden)
            } else {
                EmptyView()
            }

        }
    }
}
struct AddExistingGarnishToCocktailButton: View {
    @Bindable var viewModel: AddCocktailViewModel
    @Environment(\.dismiss) private var dismiss
    @Query(sort: \Garnish.name) var garnish: [Garnish]
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        Button{
            if viewModel.existingGarnishIsValid(allGarnishes: garnish) {
                viewModel.addExistingGarnishToCocktail(context: modelContext)
                viewModel.toggleShowAddGarnishView()
            } else {
                viewModel.isShowingingredientAlert.toggle()
                viewModel.didChooseExistingIngredient = false
            }
        } label: {
            
            HStack {
                Image(systemName: "plus.circle.fill")
                    .font(.footnote).bold()
                Text("Add to spec")
                    .font(.footnote).bold()
            }
            .tint(.blueTint)
            .padding()
        }
        .frame(width: 380, height: 40,  alignment: .center)
    }
}

struct CreateCustomGarnishButton: View {
    @Bindable var viewModel: AddCocktailViewModel
    
    var body: some View {
        NavigationLink{
            AddCustomGarnishView(viewModel: viewModel)
                .navigationBarBackButtonHidden(true)
        } label: {
            HStack{
                Text("Create Custom Garnish").font(.headline)
                Image(systemName: "plus")
            }
            .foregroundStyle(.brandPrimaryGold)
        }
    }
}

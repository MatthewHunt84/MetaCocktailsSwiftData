import SwiftUI
import SwiftData

struct AddCocktailView: View {
    
    @Bindable var viewModel: AddCocktailViewModel
    @State private var isShowingAddIngredients: Bool = false
    @Environment(\.modelContext) private var modelContext
    @Environment(\.currentTab) private var selectedTab
    @Environment(\.dismiss) private var dismiss
    @Query(sort: \Cocktail.cocktailName) var cocktails: [Cocktail]
    @FocusState private var yearKeyboardFocused: Bool
    @State private var isActive: Bool = false
    var sectionBackground = Color.black.opacity(0.15)
    
 
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                MeshGradients.meshRedRibbonBackground.ignoresSafeArea()
                
                Form {
                    Section(header: Text("Name").font(FontFactory.sectionHeader12)) {
                        TextField("Cocktail Name", text: $viewModel.cocktailName)
                            .focused($yearKeyboardFocused)
                            .font(FontFactory.fontBody16)
                    }
                    
                    AddedIngredientView(viewModel: viewModel, isShowingAddIngredients: $isShowingAddIngredients)
                    
                    Section(header: Text("Extras").font(FontFactory.sectionHeader12)) {
                        GlassPickerButton(viewModel: viewModel)
                        IcePicker(ice: $viewModel.ice)
                        VariationPicker(viewModel: viewModel)
                    }
                    
                    GarnishPicker(viewModel: viewModel)
                    Section(header: Text("Credit (optional)").font(FontFactory.sectionHeader12)) {
                        TextField("Author", text: $viewModel.authorName)
                            .focused($yearKeyboardFocused)
                            .font(FontFactory.formLabel18)
                        TextField("Origin", text: $viewModel.authorPlace)
                            .focused($yearKeyboardFocused)
                            .font(FontFactory.formLabel18)
                        TextField("Year", text: $viewModel.authorYear)
                            .keyboardType(.numberPad)
                            .focused($yearKeyboardFocused)
                            .font(FontFactory.formLabel18)
                    }
                    
                    
                    Section(header: Text("Build steps (optional)").font(FontFactory.sectionHeader12)) {
                        AddBuildStepView(viewModel: viewModel)
                    }
                    
                    
                    Button{
                        viewModel.clearData()
                    } label: {
                        
                        HStack {
                            Image(systemName: "arrow.triangle.2.circlepath")
                                .font(.headline).bold()
                            Text("Reset to Defaults")
                                .font(FontFactory.fontBody16)
                        }
                        .tint(Color.blueTint)
                        .padding()
                    }
                    .frame(width: 380, height: 40,  alignment: .center)
                    
                    
                }
                .scrollContentBackground(.hidden)
                .background(Color.clear)
                .navigationBarTitleDisplayMode(.inline)
                .jamesHeaderWithNavigation(title: "Add A Cocktail", dismiss: dismiss)
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button {
                            if nameIsUnique() {
                                viewModel.isShowingUniqueNameAlert = false
                            } else {
                                viewModel.isShowingUniqueNameAlert = true
                            }
                            
                            if viewModel.isValid() {
                                viewModel.addCocktailToModel(context: modelContext)
                                selectedTab.wrappedValue = .customCocktailsView
                                
                                
                            } else {
                                
                                if viewModel.isShowingUniqueNameAlert == false  {
                                    viewModel.isShowingAlert.toggle()
                                }
                            }
                            
                        } label: {
                            HStack {
                                Text("Add to Cocktails")
                                    .font(FontFactory.bottomToolbarButton20)
                                Image(systemName: "plus")
                            }
                            .foregroundStyle(viewModel.isValid() ? .brandPrimaryGold : .secondary)
                        }
                    }
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button {
                            yearKeyboardFocused = false
                        } label: {
                            Text("Done")
                                .font(FontFactory.fontBody16)
                        }
                        .tint(.blueTint)
                        
                    }
                    
                }
            }
            .navigationDestination(isPresented: $viewModel.addExistingGarnishViewIsActive) {
                GarnishDetailView(viewModel: viewModel)
                    .navigationBarBackButtonHidden(true)
            }
            .navigationDestination(isPresented: $viewModel.addIngredientDetailViewIsActive) {
                AddExistingIngredientDetailView(viewModel: viewModel)
                    .navigationBarBackButtonHidden(true)
            }
            
            if viewModel.isShowingAlert {
                CustomAlertView(isActive: $viewModel.isShowingAlert,
                                title: "Missing Information",
                                message: viewModel.cantAddCocktailMessage(),
                                buttonTitle: heardChef, action: {})
                .zIndex(1)
            }
            if viewModel.isShowingUniqueNameAlert {
                CustomAlertView(isActive: $viewModel.isShowingUniqueNameAlert,
                                title: "Name must be unique",
                                message: "Please modify your cocktail name. ",
                                buttonTitle: heardChef, action: {})
                .zIndex(1)
            }
            
        }
    }
}
private struct GlassPickerButton: View {
    @Bindable var viewModel: AddCocktailViewModel
    var body: some View {
        NavigationLink {
            GlassPickerDetailView(viewModel: viewModel)
                .navigationBarBackButtonHidden(true)
        } label: {
            HStack {
                Text("Glassware")
                    .font(FontFactory.formLabel18)
                Spacer()
                Text(viewModel.glasswareName)
                    .font(FontFactory.formLabel18)
                    .foregroundStyle(.gray)
                
            }
        }
    }
}



private struct GlassPickerDetailView: View {
    
   
    @Bindable var viewModel: AddCocktailViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            MeshGradients.meshRedRibbonBackground.ignoresSafeArea()
            
            List {
                ForEach(Glassware.allCases, id: \.self) { newGlass in
                    if newGlass != .blueBlazerMugs && newGlass != .cinnamonSugarRim && newGlass != .crustaGlass  && newGlass != .doubleOldAsparagusSaltRim  && newGlass != .doubleOldSmokedSalt  && newGlass != .doubleOldCelerySalt {
                        
                        Button{
                            viewModel.uniqueGlasswareName = newGlass
                            viewModel.glasswareName = newGlass.rawValue
                            dismiss()
                        } label: {
                            HStack {
                                newGlass.findGlass(for: newGlass)
                                    .resizable()
                                    .frame(width: 60, height: 60, alignment: .trailing)
                                
                                Text(newGlass.rawValue)
                                    .tag(Optional(newGlass))
                                    .font(FontFactory.bottomToolbarButton20)
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                }
                .listStyle(.plain)
                .listRowBackground(Color.clear)
            }
            .navigationBarTitleDisplayMode(.inline)
            .jamesHeaderWithNavigation(title: "Glassware Choice", dismiss: dismiss)
            .scrollContentBackground(.hidden)
        }
    }
}

private struct IcePicker: View {
    @Binding var ice: Ice?
    
    var body: some View {
        HStack {
            Text("Ice")
                .font(FontFactory.formLabel18)
            Spacer()
            Picker(selection: $ice, label: EmptyView()) {
                ForEach(Ice.allCases, id: \.rawValue) { ice in
                    Text(ice.rawValue)
                        .font(FontFactory.formLabel18)
                        .tag(Optional(ice))
                }
            }
            .pickerStyle(.menu)
            .labelsHidden()
            
        }
        .tint(ice == Ice.none ? Color.secondary : .white)
        .font(FontFactory.formLabel18)
    }
}

private struct GarnishPicker: View {
    
    @Bindable var viewModel: AddCocktailViewModel
    
    var body: some View {
        
        Section {
            
            List{
                ForEach(viewModel.addedGarnish, id: \.name) { garnish in
                    Text(garnish.name)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(FontFactory.formLabel18)
                }
                .onDelete(perform: { indexSet in
                    viewModel.addedGarnish.remove(atOffsets: indexSet)
                })
            }
            Button {
                viewModel.toggleShowAddGarnishView()
                
            } label: {
                HStack {
                    Text(viewModel.addedGarnish.count < 1 ? "Add Garnish" : "Add another garnish")
                        .tint(viewModel.addedGarnish.count < 1 ? .white : .secondary)
                        .font(FontFactory.formLabel18)
                    Spacer()
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(.blueTint)
                }
            }
            
        } header: {
            Text("Garnish")
        }
        
    }
}




#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    return AddCocktailView(viewModel: AddCocktailViewModel())
        .modelContainer(preview.container)
    
}

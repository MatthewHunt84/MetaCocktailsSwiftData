import SwiftUI
import SwiftData

struct AddCocktailView: View {
    
    @Bindable var viewModel = AddCocktailViewModel()
    @State private var isShowingAddIngredients: Bool = false
    @State private var addExistingGarnishViewIsActive: Bool = false
    @State private var isShowingCustomIngredientView: Bool = false
    @Environment(\.modelContext) private var modelContext
    @Environment(\.currentTab) private var selectedTab
    @Environment(\.dismiss) private var dismiss
    @Query(sort: \Cocktail.cocktailName) var cocktails: [Cocktail]
    @FocusState private var yearKeyboardFocused: Bool
    @State private var isActive: Bool = false
    @State private var isRiff: Bool = false
    @State private var isSelectingFromTemplate: Bool = false
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                ColorScheme.background.ignoresSafeArea()
                
                Form {
                    
                    Section(header: Text("Name").font(FontFactory.sectionHeader12)) {
                        TextField("Cocktail Name", text: $viewModel.cocktailName)
                            .focused($yearKeyboardFocused)
                            .font(FontFactory.fontBody16)
                    }
                    
                    AddedIngredientView(viewModel: viewModel, isShowingAddIngredients: $isShowingAddIngredients, isShowingCustomIngredientView: $isShowingCustomIngredientView)
                    
                    Section(header: Text("Extras").font(FontFactory.sectionHeader12)) {
                        GlassPickerButton(viewModel: viewModel)
                        IcePicker(ice: $viewModel.ice)
                        VariationPicker(viewModel: viewModel)
                    }
                    
                    GarnishPicker(viewModel: viewModel, addExistingGarnishViewIsActive: $addExistingGarnishViewIsActive)
                    
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
                        .tint(ColorScheme.interactionTint)
                        .padding()
                    }
                    .frame(width: 380, height: 40,  alignment: .center)
                    
                    
                }
                .blur(radius: (viewModel.isShowingUniqueNameAlert || viewModel.isShowingAlert) ? 3 : 0)
                .scrollContentBackground(.hidden)
                .background(Color.clear)
                .navigationBarTitleDisplayMode(.inline)
                .jamesHeader("Add New Cocktail")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            isSelectingFromTemplate = true
                        } label: {
                            Image("ChooseCocktailTemplate")
                                .resizable()
                                .tint(ColorScheme.interactionTint)
                        }
                    }
                    
                    ToolbarItem(placement: .bottomBar) {
                        Button {
                            guard nameIsUnique() else {
                                viewModel.isShowingUniqueNameAlert.toggle()
                                return
                            }
                            
                            if viewModel.isValid() {
                                
                                viewModel.addCocktailToModel(context: modelContext)
                                selectedTab.wrappedValue = .customCocktailsView
                            } else {
                                if !viewModel.isShowingUniqueNameAlert {
                                    viewModel.isShowingAlert.toggle()
                                }
                            }
                            
                        } label: {
                            HStack {
                                Text("Add to cocktails")
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
                        .tint(ColorScheme.interactionTint)
                        
                    }
                    
                }
                .fullScreenCover(isPresented: $viewModel.addExistingGarnishViewIsActive) {
                    GarnishDetailView(viewModel: viewModel, addExistingGarnishViewIsActive: $addExistingGarnishViewIsActive)
                        .navigationBarBackButtonHidden(true)
                }
                .fullScreenCover(isPresented: $isShowingAddIngredients) {
                    NavigationStack{
                        AddExistingIngredientDetailView(viewModel: viewModel, isShowingAddIngredients: $isShowingAddIngredients, isShowingCustomIngredientView: $isShowingCustomIngredientView)
                            .navigationBarBackButtonHidden(true)
                    }
                }
                .fullScreenCover(isPresented: $isSelectingFromTemplate) {
                    RiffPickerView(viewModel: viewModel)
                        .navigationBarBackButtonHidden(true)
                }
                .fullScreenCover(isPresented: $isShowingCustomIngredientView) {
                    AddCustomIngredientView(viewModel: viewModel, isShowingAddIngredients: $isShowingAddIngredients, isShowingCustomIngredientView: $isShowingCustomIngredientView)
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
                                    message: "Another cocktail already exists with that name",
                                    buttonTitle: heardChef, action: {})
                    .zIndex(1)
                }
            }
        }
    }
    
    func nameIsUnique() -> Bool {
        // We need to do a fresh fetch every time to make sure the name is unique.
        // Otherwise we don't include newly added cocktails in the cocktails array we check against
        // So if the user adds a riff twice swift data will crash

        do {
            let descriptor = FetchDescriptor<Cocktail>()
            let fetchedCocktails = try modelContext.fetch(descriptor)
            let cocktailNames: [String] = fetchedCocktails.map({$0.cocktailName})
            return cocktailNames.allSatisfy({ $0 != viewModel.cocktailName})

        } catch {
            print("Error fetching cocktail list: \(error)")
            return false
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
            
            ColorScheme.background.ignoresSafeArea()
            
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
    @Binding var addExistingGarnishViewIsActive: Bool
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
                addExistingGarnishViewIsActive.toggle()
                
            } label: {
                HStack {
                    Text(viewModel.addedGarnish.count < 1 ? "Add Garnish" : "Add another garnish")
                        .tint(viewModel.addedGarnish.count < 1 ? .white : .secondary)
                        .font(FontFactory.formLabel18)
                    Spacer()
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(ColorScheme.interactionTint)
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

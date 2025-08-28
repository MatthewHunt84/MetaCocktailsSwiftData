import SwiftUI
import SwiftData

struct AddCocktailView: View {
    
    @Bindable var viewModel = AddCocktailViewModel()
    @State private var isShowingAddIngredients: Bool = false
    @State private var isShowingAddGarnishView: Bool = false
    @Environment(\.modelContext) private var modelContext
    @Environment(\.currentTab) private var selectedTab
    @EnvironmentObject var cocktailListViewModel: CocktailListViewModel
    @Environment(\.dismiss) private var dismiss
    @Query(sort: \Cocktail.cocktailName) var cocktails: [Cocktail]
    @FocusState private var yearKeyboardFocused: Bool
    @State private var isActive: Bool = false
    @State private var isRiff: Bool = false
    @State private var isSelectingFromTemplate: Bool = false
    @FocusState private var cocktailBuildStepKeyboardFocused: Bool
    @State private var isShowingInfo = false
    
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
                    
                    AddedIngredientView(viewModel: viewModel, isShowingAddIngredients: $isShowingAddIngredients)
                    
                    Section(header: Text("Extras").font(FontFactory.sectionHeader12)) {
                        GlassPickerButton(viewModel: viewModel)
                        IcePicker(ice: $viewModel.ice)
                        VariationPicker(viewModel: viewModel, isShowingInfo: $isShowingInfo)
                    }
                    .navigationLinkIndicatorVisibility(.hidden)
                    
                    VariationInfoView(isShowingInfo: $isShowingInfo)
                    
                    Section(header: Text("Garnish").font(FontFactory.sectionHeader12)) {
                        GarnishPicker(viewModel: viewModel, addExistingGarnishViewIsActive: $isShowingAddGarnishView)
                    }
                    
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
                        AddBuildStepView(viewModel: viewModel, cocktailBuildStepKeyboardFocused: _cocktailBuildStepKeyboardFocused)
                    }
                    
                    HStack {
                        
                        UniversalButton(buttonText: "Start Over", rightImage: nil, leftImage: Image(systemName: "trash"), includeBorder: true, color: ColorScheme.nullAlertGradient, disabled: viewModel.hasNoData) {
                            viewModel.isAboutToClearForm = true
                        }
                        
                        UniversalButton(buttonText: "Add Cocktail", rightImage: nil, leftImage: nil, includeBorder: true, color: viewModel.isValid() ? ColorScheme.recipeBorderFlipped : ColorScheme.nullSecondaryGradient, disabled: false) {
                            guard nameIsUnique() else {
                                viewModel.isShowingUniqueNameAlert.toggle()
                                return
                            }
                            guard viewModel.cocktailName != "" else {
                                viewModel.isShowingAlert.toggle()
                                return
                            }
                            
                            if viewModel.isValid() {
                                viewModel.addCocktailToModel(context: modelContext)
                                cocktailListViewModel.shouldReloadCache = true
                                
                                Task {
                                    await cocktailListViewModel.fetchCocktails(modelContext: modelContext)
                                    cocktailListViewModel.updateAndCache()
                                }
                                selectedTab.wrappedValue = .favoritesView
                            } else {
                                if !viewModel.isShowingUniqueNameAlert {
                                    viewModel.isShowingAlert.toggle()
                                }
                            }
                        }
                    }
                    .listRowBackground(Color.clear)
                }
                .blur(radius: (viewModel.isShowingUniqueNameAlert || viewModel.isShowingAlert || viewModel.isAboutToClearForm) ? 3 : 0)
                .scrollContentBackground(.hidden)
                .background(Color.clear)
                .navigationBarTitleDisplayMode(.inline)
                .jamesHeader("Add New Cocktail")
                .modalPresentation(Image("useExistingRecipe"), labelText: "Use Existing", isPresented: $isSelectingFromTemplate)
                .sheet(isPresented: $isSelectingFromTemplate) {
                    RiffPickerView(viewModel: viewModel)
                        .navigationBarBackButtonHidden(true)
                }
                .toolbar {
                    
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button {
                            cocktailBuildStepKeyboardFocused = false 
                            yearKeyboardFocused = false
                        } label: {
                            Text("Done")
                                .font(FontFactory.fontBody16)
                        }
                        .tint(ColorScheme.interactionTint)
                        
                    }
                    
                }
                .fullScreenCover(isPresented: $isShowingAddGarnishView) {
                    GarnishDetailView(viewModel: viewModel)
                        .navigationBarBackButtonHidden(true)
                }
                .fullScreenCover(isPresented: $isShowingAddIngredients) {
                    NavigationStack{
                        AddIngredientDetailView(viewModel: viewModel, isShowingAddIngredients: $isShowingAddIngredients)
                            .navigationBarBackButtonHidden(true)
                    }
                }
                .overlay {
                    if viewModel.isAboutToClearForm {
                        TwoButtonAlertView(
                            isActive: $viewModel.isAboutToClearForm,
                            title: "Start Over?",
                            message: "This will reset all fields",
                            buttonTitle1: "Cancel",
                            action1: { },
                            buttonTitle2: "Reset",
                            action2: { viewModel.clearData() }
                        )
                    }
                }
                .animation(.spring(response: 0.3, dampingFraction: 0.7), value: viewModel.isAboutToClearForm)
                if viewModel.isShowingAlert {
                    ErrorAlertView(isActive: $viewModel.isShowingAlert,
                                    title: "Missing Information",
                                    message: viewModel.cantAddCocktailMessage(),
                                    buttonTitle: yesChef, action: {})
                    .zIndex(1)
                }
                
                if viewModel.isShowingUniqueNameAlert {
                    ErrorAlertView(isActive: $viewModel.isShowingUniqueNameAlert,
                                    title: "Name must be unique",
                                    message: "Another cocktail already exists with that name",
                                    buttonTitle: yesChef, action: {})
                    .zIndex(1)
                }
            }
            .sensoryFeedback(.error, trigger: viewModel.isShowingAlert)
            .sensoryFeedback(.error, trigger: viewModel.isShowingUniqueNameAlert)

        }
        .toolbar {
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
                                    .frame(width: 40, height: 40, alignment: .trailing)
                                    .padding(.trailing, 10)
                                
                                Text(newGlass.rawValue)
                                    .tag(Optional(newGlass))
                                    .font(FontFactory.mediumFont(size: 16))
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
            
            Menu {
                ForEach(Ice.allCases, id: \.rawValue) { iceOption in
                    Button(iceOption.rawValue) {
                        ice = iceOption
                    }
                }
            } label: {
                Text(ice?.rawValue ?? "None")
                    .font(FontFactory.formLabel18)
                    .foregroundColor(ice == Ice.none ? Color.secondary : .primary)
            }
        }
    }
}

private struct GarnishPicker: View {
    
    @Bindable var viewModel: AddCocktailViewModel
    @Binding var addExistingGarnishViewIsActive: Bool
    var body: some View {
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
                    .tint(viewModel.addedGarnish.count < 1 ? .primary : .secondary)
                    .font(FontFactory.formLabel18)
                Spacer()
                Image(systemName: "plus.circle.fill")
                    .foregroundStyle(ColorScheme.interactionTint)
            }
        }
    }
}




#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    return AddCocktailView(viewModel: AddCocktailViewModel())
        .modelContainer(preview.container)
    
}

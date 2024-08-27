import SwiftUI
import SwiftData

struct AddCocktailView: View {
    
    @Bindable var viewModel = AddCocktailViewModel()
    @State private var isShowingAddIngredients: Bool = false
    @Environment(\.modelContext) private var modelContext
    @Environment(\.currentTab) private var selectedTab
    @Query(sort: \Cocktail.cocktailName) var cocktails: [Cocktail]
    @FocusState private var yearKeyboardFocused: Bool
    @State private var isActive: Bool = false
    var sectionBackground = Color.black.opacity(0.15)
    
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                MeshGradients.meshRedRibbonBackground.ignoresSafeArea()
                VStack {
                    FontFactory.titleHeader(title: "Add a Cocktail")
                    
                    Form {
                        Section(header: Text("Name").font(FontFactory.sectionHeader)) {
                            TextField("Cocktail Name", text: $viewModel.cocktailName)
                                .focused($yearKeyboardFocused)
                                .font(FontFactory.body)
                        }
                        //                    .listRowBackground(sectionBackground)
                        
                        AddedIngredientView(viewModel: viewModel, isShowingAddIngredients: $isShowingAddIngredients)
                        
                        Section(header: Text("Extras").font(FontFactory.sectionHeader)) {
                            GlassPickerButton(viewModel: viewModel)
                            IcePicker(ice: $viewModel.ice)
                            VariationPicker(variation: $viewModel.variation)
                        }
                        //                    .listRowBackground(sectionBackground)
                        
                        GarnishPicker(viewModel: viewModel)
                        Section(header: Text("Credit (optional)").font(FontFactory.sectionHeader)) {
                            TextField("Author", text: $viewModel.authorName)
                                .focused($yearKeyboardFocused)
                                .font(FontFactory.formLabel)
                            TextField("Origin", text: $viewModel.authorPlace)
                                .focused($yearKeyboardFocused)
                                .font(FontFactory.formLabel)
                            TextField("Year", text: $viewModel.authorYear)
                                .keyboardType(.numberPad)
                                .focused($yearKeyboardFocused)
                                .font(FontFactory.formLabel)
                        }
                        //                    .listRowBackground(sectionBackground)
                        
                        Section(header: Text("Build steps (optional)").font(FontFactory.sectionHeader)) {
                            AddBuildStepView(viewModel: viewModel)
                        }
                        //                    .listRowBackground(sectionBackground)
                        
                        Button{
                            viewModel.clearData()
                        } label: {
                            
                            HStack {
                                Image(systemName: "arrow.triangle.2.circlepath")
                                    .font(.headline).bold()
                                Text("Reset to Defaults")
                                    .font(FontFactory.body)
                                    .font(.footnote).bold()
                            }
                            .tint(Color.blueTint)
                            .padding()
                        }
                        .frame(width: 380, height: 40,  alignment: .center)
                        
                        
                    }
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                }
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
                                selectedTab.wrappedValue = .cocktailListView
                                
                                
                            } else {
                                
                                if viewModel.isShowingUniqueNameAlert == false  {
                                    viewModel.isShowingAlert.toggle()
                                }
                            }
                            
                        } label: {
                            HStack {
                                Text("Add to Cocktails")
                                    .font(FontFactory.bottomToolbarButton)
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
                                .font(FontFactory.body)
                        }
                        .tint(.blueTint)
                        
                    }
                    
                }
            }
//            .navigationBarTitleDisplayMode(.inline)
//            .goldHeader(viewModel.cocktailName == "" ? viewModel.defaultName : viewModel.cocktailName)
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
    @State private var glasswareName = "None"
    var body: some View {
        NavigationLink {
            GlassPickerDetailView(glasswareName: $glasswareName, viewModel: viewModel)
                .navigationBarBackButtonHidden(true)
        } label: {
            HStack {
                Text("Glassware")
                    .font(FontFactory.formLabel)
                Spacer()
                Text(glasswareName)
                    .font(FontFactory.formLabel)
                    .foregroundStyle(.gray)
                
            }
        }
    }
}



private struct GlassPickerDetailView: View {
    
    @Binding var glasswareName: String
    @Bindable var viewModel: AddCocktailViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        VStack{
            BackButton()
            List {
                ForEach(Glassware.allCases, id: \.self) { newGlass in
                    if newGlass != .blueBlazerMugs && newGlass != .cinnamonSugarRim && newGlass != .crustaGlass  && newGlass != .doubleOldAsparagusSaltRim  && newGlass != .doubleOldSmokedSalt  && newGlass != .doubleOldCelerySalt {
                        
                        
                        Button{
                            viewModel.uniqueGlasswareName = newGlass
                            glasswareName = newGlass.rawValue
                            dismiss()
                        } label: {
                            HStack {
                                newGlass.findGlass(for: newGlass)
                                    .resizable()
                                    .frame(width: 60, height: 60, alignment: .trailing)
                                
                                Text(newGlass.rawValue)
                                    .tag(Optional(newGlass))
                                    .font(FontFactory.bottomToolbarButton)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .listStyle(.plain)
            .listRowBackground(Color.clear)
        }
    }
}


private struct IcePicker: View {
    @Binding var ice: Ice?
    
    var body: some View {
        
        Picker(selection: $ice) {
            ForEach(Ice.allCases, id: \.rawValue)  { ice in
                Text(ice.rawValue)
                    .font(FontFactory.formLabel)
                    .tag(Optional(ice))
            }
        } label: {
            Text("Ice")
                .font(FontFactory.formLabel)
        }
        .pickerStyle(.navigationLink)
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
                        .font(FontFactory.formLabel)
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
                        .font(FontFactory.formLabel)
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

private struct VariationPicker: View {
    @Binding var variation: Variation?
    @State var isShowingInfo = false
    
    var body: some View {
        VStack {
            Picker(selection: $variation) {
                ForEach(Variation.allCases, id: \.rawValue)  { variation in
                    Text(variation.rawValue)
                        .font(FontFactory.formLabel)
                        .tag(Optional(variation))
                }
            } label: {
                HStack(spacing: 15) {
                    Text("Variation")
                        .frame(alignment: .leading)
                        .font(FontFactory.formLabel)
                    
                    Image(systemName: "questionmark.circle.fill")
                        .foregroundStyle(isShowingInfo ? .brandPrimaryGold : .blue)
                        .onTapGesture {
                            isShowingInfo.toggle()
                        }
                }
            }.pickerStyle(.navigationLink)
            
            if isShowingInfo {
                Text("If this cocktail is a riff on another classic, you may add it here. Variations will be grouped together in the search list")
                    .font(FontFactory.buildBodySmall)
                    .foregroundStyle(.brandPrimaryGold)
                    .padding(.top, 10)
            }
        }
    }
}


#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    return AddCocktailView(viewModel: AddCocktailViewModel())
        .modelContainer(preview.container)
    
}

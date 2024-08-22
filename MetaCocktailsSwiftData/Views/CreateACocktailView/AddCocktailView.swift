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
                
                MeshGradients.blackGreyBackground.ignoresSafeArea()
                VStack {
                    Text("Add a Cocktail")
                        .font(.custom("AvenirNext-Regular", size: 24)).bold()
                    Form {
                        Section(header: Text("Name")) {
                            TextField("Cocktail Name", text: $viewModel.cocktailName)
                                .focused($yearKeyboardFocused)
                        }
                        //                    .listRowBackground(sectionBackground)
                        
                        AddedIngredientView(viewModel: viewModel, isShowingAddIngredients: $isShowingAddIngredients)
                        
                        Section(header: Text("Extras")) {
                            GlassPickerButton(viewModel: viewModel)
                            IcePicker(ice: $viewModel.ice)
                            VariationPicker(variation: $viewModel.variation)
                        }
                        //                    .listRowBackground(sectionBackground)
                        
                        GarnishPicker(viewModel: viewModel)
                        Section(header: Text("Credit (optional)")) {
                            TextField("Author", text: $viewModel.authorName)
                                .focused($yearKeyboardFocused)
                            TextField("Origin", text: $viewModel.authorPlace)
                                .focused($yearKeyboardFocused)
                            TextField("Year", text: $viewModel.authorYear)
                                .keyboardType(.numberPad)
                                .focused($yearKeyboardFocused)
                        }
                        //                    .listRowBackground(sectionBackground)
                        
                        Section(header: Text("Build steps (optional)")) {
                            AddBuildStepView(viewModel: viewModel)
                        }
                        //                    .listRowBackground(sectionBackground)
                        
                        Button{
                            viewModel.clearData()
                        } label: {
                            
                            HStack {
                                Image(systemName: "arrow.triangle.2.circlepath")
                                    .font(.footnote).bold()
                                Text("Reset to Defaults")
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
                                Text("Add to cocktails").font(.headline)
                                Image(systemName: "plus")
                            }
                            .foregroundStyle(viewModel.isValid() ? .brandPrimaryGold : .secondary)
                        }
                    }
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            yearKeyboardFocused = false
                        }
                        .tint(Color.brandPrimaryGold)
                        
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
                Spacer()
                Text(glasswareName)
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
        Picker("Ice", selection: $ice) {
            
            ForEach(Ice.allCases, id: \.rawValue)  { ice in
                Text(ice.rawValue)
                    .tag(Optional(ice))
            }
        }.pickerStyle(.navigationLink)
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
                        .tag(Optional(variation))
                }
            } label: {
                HStack(spacing: 15) {
                    Text("Variation")
                        .frame(alignment: .leading)
                    
                    Image(systemName: "questionmark.circle.fill")
                        .foregroundStyle(isShowingInfo ? .brandPrimaryGold : .blue)
                        .onTapGesture {
                            isShowingInfo.toggle()
                        }
                }
            }.pickerStyle(.navigationLink)
            
            if isShowingInfo {
                Text("If this cocktail is a riff on another classic, you may add it here. Variations will be grouped together in the search list")
                    .font(.caption)
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

import SwiftUI
import SwiftData

struct AddCocktailView: View {
 
    @Bindable var viewModel = AddCocktailViewModel()
    @State private var isShowingAddIngredients: Bool = false
    @Environment(\.modelContext) private var modelContext
    @Environment(\.currentTab) private var selectedTab
    @Query(sort: \Cocktail.cocktailName) var cocktails: [Cocktail]
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                VStack {
                    Form {
                        
                        Section(header: Text("Name")) {
                            TextField("Cocktail Name", text: $viewModel.cocktailName)
                        }
                        
                        AddedIngredientView(viewModel: viewModel, isShowingAddIngredients: $isShowingAddIngredients)
                        
                        
                        Section(header: Text("Extras")) {
                           
                            GlassPickerButton()
                            
                            IcePicker(ice: $viewModel.ice)
                            
                            VariationPicker(variation: $viewModel.variation)
                        }
                        Section {
                            
                            GarnishPicker(viewModel: viewModel)
                        } header: {
                            Text("Garnish")
                        }
                        
                        
                        Section(header: Text("Credit (optional)")) {
                            TextField("Author", text: $viewModel.authorName)
                            
                            TextField("Origin", text: $viewModel.authorPlace)
                            
                            TextField("Year", text: $viewModel.authorYear)
                                .keyboardType(.numberPad)
                        }
                        
                        Section(header: Text("Build steps (optional)")) {
                                AddBuildStepView(viewModel: viewModel)
                            
                        }
                    }
                    .navigationTitle(viewModel.cocktailName == "" ? $viewModel.defaultName : $viewModel.cocktailName)
                    .navigationBarTitleDisplayMode(.large)
                    .toolbar {
                        ToolbarItem(placement: .bottomBar) {
                            Button {
                                if nameIsUnique() {
                                    viewModel.isShowingUniqueNameAlert = false
                                } else {
                                    viewModel.isShowingUniqueNameAlert = true
                                }
                                
                                if viewModel.isValid() {
                                    
                                    viewModel.validateAuthor()
                                    viewModel.validateGarnish()
                                    viewModel.validateBuildInstructions()
                                    
                                    let cocktail = Cocktail(cocktailName: viewModel.cocktailName,
                                                            glasswareType: viewModel.glass!,
                                                            garnish: viewModel.garnish,
                                                            ice: viewModel.ice,
                                                            author: viewModel.author,
                                                            spec: viewModel.addedIngredients,
                                                            buildOrder: viewModel.buildOption,
                                                            tags: Tags(flavors: [], profiles: [], styles: [], booze: [], nA: []),
                                                            variation: viewModel.variation,
                                                            collection: .custom)
                                    
                                    modelContext.insert(cocktail)
                                    viewModel.clearData()
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
                    }
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
}
private struct GlassPickerButton: View {
   @State private var glasswareName = "none"
    var body: some View {
        NavigationLink {
            GlassPickerDetailView(glasswareName: $glasswareName)
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
    @Bindable var viewModel = AddCocktailViewModel()
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack{
            List {
                ForEach(Glassware.allCases, id: \.self) { newGlass in
                    if newGlass != .blueBlazerMugs && newGlass != .cinnamonSugarRim && newGlass != .crustaGlass  && newGlass != .doubleOldAsparagusSaltRim  && newGlass != .doubleOldSmokedSalt  && newGlass != .doubleOldCelerySalt {
                        Button{
                            viewModel.glass = newGlass
                            print("view model glass = \(viewModel.glass!.rawValue) the the new glass = \(newGlass.rawValue)")
                            print(viewModel.isValid())
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
            .listRowBackground(Color.black)
        }
//        Picker("Glass", selection: $glass) {
//            Text("Select Glassware").tag(Optional<String>(nil))
//            
//            ForEach(Glassware.allCases, id: \.rawValue)  { glass in
//                HStack {
//                    glass.findGlass(for: glass)
//                        .resizable()
//                        .frame(width: 50, height: 50, alignment: .trailing)
//                    Text(glass.rawValue)
//                        .tag(Optional(glass))
//                    
//                }
//                
//            }
//            .backgroundStyle(.black)
//        }.pickerStyle(.navigationLink)
            
    }
}


private struct IcePicker: View {
    @Binding var ice: Ice?
    
    var body: some View {
        Picker("Ice", selection: $ice) {
            Text("none").tag(Optional<String>(nil))
            
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
        VStack {
            List{
                ForEach(viewModel.addedGarnish, id: \.self) { garnish in
                    Text("\(garnish.rawValue)")
                }
                .onDelete(perform: { indexSet in
                    viewModel.addedGarnish.remove(atOffsets: indexSet)
                })
            }
            
            Menu {
                ForEach(Garnish.allCases, id: \.rawValue ) { garnish in
                    Button(action: {
                        viewModel.addedGarnish.append(garnish)
                    }, label: {
                        Text("\(garnish.rawValue)")
                    })
                }
            } label: {
                HStack {
                    Text(viewModel.addedGarnish.count < 1 ? "Add Garnish" : "Add another garnish")
                        .tint(viewModel.addedGarnish.count < 1 ? .white : .secondary)
                    Spacer()
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(.brandPrimaryGold)
                }
            }
        }
    }
}

private struct VariationPicker: View {
    @Binding var variation: Variation?
    @State var isShowingInfo = false
    
    var body: some View {
        VStack {
            Picker(selection: $variation) {
                Text("none").tag(Optional<String>(nil))
                
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

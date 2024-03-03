import SwiftUI

struct AddCocktailView: View {
    @EnvironmentObject var criteria: SearchCriteriaViewModel
    @Bindable var viewModel = AddCocktailViewModel()
    @State private var isShowingAddIngredients: Bool = false
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        
        NavigationStack {
           
            Form {
                
                Section(header: Text("Name")) {
                    TextField("Cocktail Name", text: $viewModel.cocktailName)
                }
                
                Section(header: Text("Ingredients")) {
                    
                    Button(action: {
                        isShowingAddIngredients.toggle()
                        
                    }, label: {
                        HStack{
                            Text("Add Ingredient")
                                .tint(.white)
                            Spacer()
                            Image(systemName: "plus.circle.fill")
                                .foregroundStyle(.brandPrimaryGold)
                        }
                    })
                    .sheet(isPresented: $isShowingAddIngredients) {
                        AddIngredientView(viewModel: viewModel, isShowingAddIngredients: $isShowingAddIngredients)
                    }
                    
                    List{
                        ForEach(viewModel.addedIngredients, id: \.ingredient.name) { ingredient in
                            Text("\(NSNumber(value: ingredient.value)) \(ingredient.unit.rawValue) \(ingredient.ingredient.name)")
                        }
                        .onDelete(perform: { indexSet in
                            viewModel.addedIngredients.remove(atOffsets: indexSet)
                        })
                    }
                }
             
                
                Section(header: Text("Extras")) {
                    GlassPicker(glass: $viewModel.glass)
                    
                    IcePicker(ice: $viewModel.ice)
                    
                    
                    
                    VariationPicker(variation: $viewModel.variation)
                }
                Section {
                    GarnishPicker(garnish: $viewModel.garnish)
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
                    AddBuildStepView(build: $viewModel.build)
                }
            }
            .navigationTitle(viewModel.cocktailName == "" ? $viewModel.defaultName : $viewModel.cocktailName)
            .navigationBarTitleDisplayMode(.large)
            .tint(Color.brandPrimaryGold)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        if viewModel.isValid() {
                            let cocktail = Cocktail(cocktailName: viewModel.cocktailName,
                                                    glasswareType: viewModel.glass!,
                                                    garnish: [viewModel.garnish!] ,
                                                    ice: viewModel.ice,
                                                    author: Author(person: viewModel.authorName,
                                                                   place: viewModel.authorPlace,
                                                                   year: viewModel.authorYear),
                                                    spec: viewModel.addedIngredients,
                                                    buildOrder: viewModel.build,
                                                    tags: Tags(flavors: [], profiles: [], styles: [], booze: [], nA: []), 
                                                    variation: viewModel.variation, 
                                                    collection: .custom)
                            
                            modelContext.insert(cocktail)
                            viewModel.clearData()
                            
                            criteria.tabSelection = 1
                            
                        } else {
                            viewModel.isShowingAlert.toggle()
                        }
                        
                    } label: {
                        HStack {
                            Text("Add to cocktails").font(.headline)
                            Image(systemName: "plus")
                        }
                        .foregroundStyle(viewModel.isValid() ? .brandPrimaryGold : .secondary)
                        .alert(isPresented: $viewModel.isShowingAlert, content: {
                            Alert(title: viewModel.cantAddCocktailMessage())
                        })
                    }
                }
            }
        }
    }
}

private struct AddedIngredientView: View {
    @Binding var addedIngredeints: CocktailIngredient?
    
    var body: some View {
        List {
            Button {
               
            } label: {
                HStack {
                    Text("Add ingredient")
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(.brandPrimaryGold)
                }
            }
        }
    }
}

private struct AddBuildStepView: View {
    @Binding var build: Build?
    var body: some View {
        List {
            Button {
                print("show the add build step view")
            } label: {
                HStack {
                    Text("Add build step")
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(.brandPrimaryGold)
                }
            }
        }
    }
}

private struct GlassPicker: View {
    @Binding var glass: Glassware?
    
    var body: some View {
        Picker("Glass", selection: $glass) {
            Text("Select Glassware").tag(Optional<String>(nil))
            
            ForEach(Glassware.allCases, id: \.rawValue)  { glass in
                Text(glass.rawValue)
                    .tag(Optional(glass))
            }
        }.pickerStyle(.navigationLink)
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
    @Binding var garnish: Garnish?
    
    var body: some View {
        Picker("Garnish", selection: $garnish) {
            Text("none").tag(Optional<String>(nil))
            
            ForEach(Garnish.allCases, id: \.rawValue)  { garnish in
                Text(garnish.rawValue)
                    .tag(Optional(garnish))
            }
        }.pickerStyle(.navigationLink)
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
    AddCocktailView(viewModel: AddCocktailViewModel())
        
}

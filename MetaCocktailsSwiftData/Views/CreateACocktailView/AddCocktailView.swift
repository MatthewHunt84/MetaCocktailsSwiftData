import SwiftUI
import Observation

@Observable class AddCocktailViewModel: Observable {
    var dateAdded = Date()
    var defaultName = "Add Cocktail"
    
    // Required
    var cocktailName: String = ""
    
    // Ingredients
    var ingredients: [CocktailIngredient]?
    
    // Extras
    var glass: Glassware?
    var ice: Ice?
    var garnish: Garnish?
    var variation: Variation?
    
    // Author
    var authorName: String = ""
    var authorPlace: String = ""
    var authorYear: String = ""
    
    // Build
    var build: Build?
    
    func isValid() -> Bool {
        return cocktailName != "" && glass != nil && ((ingredients?.count ?? 0) > 2)
    }
    
    // Can't add cocktail alert
    
    var isShowingAlert: Bool = false
    
    func cantAddCocktailMessage() -> Text {
        var text = ""
        
        if cocktailName == "" {
            text = "Your cocktail must have a name"
            if glass == nil {
                text += ", and a glass"
            }
        } else if glass == nil {
            text = "Select a glass"
        }
        if (ingredients?.count ?? 0) < 2 {
            if text == "" {
                text = "You must add at least two ingredients"
            } else {
                text += ", and at least two ingredients"
            }
        }
        return Text(text)
    }
}

struct AddCocktailView: View {
    
    @Bindable var viewModel = AddCocktailViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            Form {
                
                Section(header: Text("Name")) {
                    TextField("Cocktail Name", text: $viewModel.cocktailName)
                }
                
                Section(header: Text("Ingredients")) {
                    AddedIngredientView(ingredients: $viewModel.ingredients)
                }
                
                Section(header: Text("Extras")) {
                    GlassPicker(glass: $viewModel.glass)
                    
                    IcePicker(ice: $viewModel.ice)
                    
                    GarnishPicker(garnish: $viewModel.garnish)
                    
                    VariationPicker(variaton: $viewModel.variation)
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
                            print("Add cocktail to swift data")
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
    @Binding var ingredients: [CocktailIngredient]?
    
    var body: some View {
        List {
            Button {
                print("show the add ingredient modal view")
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
    @Binding var variaton: Variation?
    @State var isShowingInfo = false
    
    var body: some View {
        VStack {
            Picker(selection: $variaton) {
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
    AddCocktailView()
}

import SwiftUI

struct AddCocktailView: View {
 
    @Bindable var viewModel = AddCocktailViewModel()
    @State private var isShowingAddIngredients: Bool = false
    @Environment(\.modelContext) private var modelContext
    @Environment(\.currentTab) private var selectedTab
    
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
                            GlassPicker(glass: $viewModel.glass)
                            
                            IcePicker(ice: $viewModel.ice)
                            
                            VariationPicker(variation: $viewModel.variation)
                        }
                    
                            GarnishPicker(viewModel: viewModel)
                        
                        
                        
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
                                
                                if viewModel.isValid() {
                                    if viewModel.build.instructions != [] {
                                        viewModel.buildOption = viewModel.build
                                    }
                                    
                                    let cocktail = Cocktail(cocktailName: viewModel.cocktailName,
                                                            glasswareType: viewModel.glass!,
                                                            garnish: viewModel.addedGarnish,
                                                            ice: viewModel.ice,
                                                            author: Author(person: viewModel.authorName,
                                                                           place: viewModel.authorPlace,
                                                                           year: viewModel.authorYear),
                                                            spec: viewModel.addedIngredients,
                                                            buildOrder: viewModel.buildOption,
                                                            tags: Tags(flavors: [], profiles: [], styles: [], booze: [], nA: []),
                                                            variation: viewModel.variation,
                                                            collection: .custom)
                                    
                                    modelContext.insert(cocktail)
                                    viewModel.clearData()
                                    selectedTab.wrappedValue = .cocktailListView
                                    
                                } else {
                                    viewModel.isShowingAlert.toggle()
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
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button{
                            viewModel.clearData()
                        } label: {
                            
                            HStack {
                                Image(systemName: "trash")
                                    .font(.footnote).bold()
                                Text("Delete")
                                    .font(.footnote).bold()
                            }
                            .tint(.brandPrimaryRed)
                            .padding()
                        }
                    }
                   
                }
                if viewModel.isShowingAlert {
                    CustomAlertView(isActive: $viewModel.isShowingAlert,
                                    title: "Missing Information",
                                    message: viewModel.cantAddCocktailMessage(),
                                    buttonTitle: "Heard, Chef", action: {})
                    .zIndex(1)
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
    
    @Bindable var viewModel: AddCocktailViewModel
    
    var body: some View {
        Section {
           
                List{
                    ForEach(viewModel.addedGarnish, id: \.self) { garnish in
                        Text("\(garnish.rawValue)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .onDelete(perform: { indexSet in
                        viewModel.addedGarnish.remove(atOffsets: indexSet)
                    })
                }
                NavigationLink {
                    GarnishDetailView(viewModel: viewModel)
                        
                } label: {
                    HStack {
                        Text(viewModel.addedGarnish.count < 1 ? "Add Garnish" : "Add another garnish")
                            .tint(viewModel.addedGarnish.count < 1 ? .white : .secondary)
                        Spacer()
                        Image(systemName: "plus.circle.fill")
                            .foregroundStyle(.brandPrimaryGold)
                    }
                }
            
        } header: {
            Text("Garnish")
        }
    }
}
private struct GarnishDetailView: View {
    
    @Bindable var viewModel: AddCocktailViewModel
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        List{
            ForEach(Garnish.allCases, id: \.rawValue) { garnish in
                Button {
                    viewModel.addedGarnish.append(garnish)
                    dismiss()
                } label: {
                    Text(garnish.rawValue)
                        .tint(.white)
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

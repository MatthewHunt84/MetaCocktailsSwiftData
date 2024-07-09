//
//  Ingredient.swift
//  MetaCocktails
//
//  Created by Matthew Hunt on 8/30/23.
//

import Foundation
import SwiftData

@Model
class CocktailIngredient: Codable, Hashable {

    let id: UUID
    let ingredient: IngredientType
    let value: Double
    let unit: MeasurementUnit
    let prep: Prep?
    let info: String?
    
    
    init(_ ingredient: IngredientType, value: Double, unit: MeasurementUnit = .fluidOunces, prep: Prep? = nil, info: String? = nil) {
        self.ingredient = ingredient
        self.value = value
        self.unit = unit
        self.id = UUID()
        self.prep = prep
        self.info = {
            if ingredient.name == Syrup.grenadine.rawValue {
                return "Pomegranate syrup"
            }
            if ingredient.name == Whiskey.aberlourAbundah.rawValue {
                return "High Proof Single Malt"
            }
            if ingredient.name == Syrup.richDem.rawValue || ingredient.name == Syrup.richCinnamonAndVanill.rawValue {
                return "Rich 2:1 by weight syrup."
            }
            if ingredient.name == Juice.carrotJuice.rawValue || ingredient.name == Juice.grapefruit.rawValue || ingredient.name == Juice.lemon.rawValue || ingredient.name == Juice.lime.rawValue || ingredient.name == Juice.orange.rawValue || ingredient.name == Juice.pineappleJuice.rawValue {
                return "Juiced fresh"
            }
            if ingredient.name == Fruit.grapefruitPeel.rawValue {
                return "Shaken in"
            }
            if ingredient.name == Seasoning.pepper.rawValue {
                return "Fresh Ground"
            }
            if ingredient.name == OtherNA.bloodyMarryMixWnG.rawValue {
                return "Williams and Graham's recipe"
            }
            if ingredient.name == OtherNA.bloodyMarryMix.rawValue {
                return "Home Made"
            }
            if ingredient.name == OtherNA.celeryStrip.rawValue {
                return "Matchstick-size"
            }
            if ingredient.name == OtherNA.jalapenoSlice.rawValue {
                return "1/4 inch thick"
            }
            if ingredient.name == OtherNA.raspberryPreserves.rawValue {
                return "Preferably Bonne Maman"
            }
            if ingredient.name == OtherNA.springOnion.rawValue {
                return "or a ramp"
            }
            if ingredient.name == OtherNA.vanillaExtract.rawValue {
                return "Get the real stuff"
            }
            if ingredient.name == Agave.mezcalDelMagueyChichicapa.rawValue || ingredient.name == Agave.mezcalDelMagueyJabali.rawValue || ingredient.name == Agave.mezcalDelMagueyVida.rawValue || ingredient.name == Agave.mezcalDelMagueySanLuis.rawValue {
                return "Mezcal by Del Maguey"
            }
            if ingredient.name == Agave.puebloViejoBlanco104.rawValue {
                return "Pueblo Viejo Tequila"
            }
            if ingredient.name == Gin.leopoldNavy.rawValue || ingredient.name == Gin.leopoldAmericanSBGin.rawValue || ingredient.name == Liqueur.lopoldsApple.rawValue || ingredient.name == Liqueur.leopoldCherry.rawValue {
                return "By Leopold Bros"
            }
            if ingredient.name == Rum.uruapanAnejo.rawValue {
                return "Single Blended Rum"
            }
            if ingredient.name == Whiskey.portCharlotte.rawValue || ingredient.name == Whiskey.Ardbeg.rawValue {
                return "10 Yr Peated Scotch"
            }
            if ingredient.name == Whiskey.compassBoxOakCross.rawValue || ingredient.name == Whiskey.monkeyShoulder.rawValue{
                return "Blended Scotch"
            }
            if ingredient.name == Whiskey.elijahCraigSmallBatch.rawValue {
                return "Bourbon"
            }
            if ingredient.name == Whiskey.hibikiHarmony.rawValue {
                return "Blended Malt Whisky"
            }
            if ingredient.name == Whiskey.oGD114.rawValue {
                return "114 proof Bourbon"
            }
            if ingredient.name == Whiskey.straightRyeOrBourbon.rawValue {
                return "100 proof"
            }
            if ingredient.name == Whiskey.talisker10.rawValue {
                return "Single Malt Scotch"
            }
            if ingredient.name == Whiskey.tullamoreDew.rawValue || ingredient.name == Whiskey.tullamoreDew12.rawValue {
                return "Irish Whiskey"
            }
            if ingredient.name == Liqueur.anchoRayesAncho.rawValue || ingredient.name == Liqueur.anchoVerde.rawValue {
                return "By Ancho Reyes"
            }
            if ingredient.name == FortifiedWine.kinaLillet.rawValue {
                return "Stopped Production in 1986"
            }
            if ingredient.name == FortifiedWine.aeDorPineauDeCharantes.rawValue {
                return "By A.E. Dor "
            }
            if ingredient.name == FortifiedWine.cocchiDeTorino.rawValue {
                return "Sweet Vermouth"
            }
            if ingredient.name == FortifiedWine.byrrh.rawValue {
                return "French bitter apertif"
            }
            if ingredient.name == Bitters.bitterTruthJTDecanter.rawValue {
                return "By Bitter Truth"
            }
            if ingredient.name == Bitters.blackWalnut.rawValue {
                return "By Fee Brothers"
            }
            if ingredient.name == Bitters.blackWalnut.rawValue {
                return "Dale Degroff's"
            }
            if ingredient.name == Amaro.amereNouvelle.rawValue {
                return "By Bittermans"
            }
            return info
        }()
    }
    
    func localizedVolumetricString(location: Location) -> String {
        switch location {
        case .usa:
            return "\(value) \(unit)"
        case .world:
            return "\(self.value * 29.5735) mls"
        }
    }
    
    // MARK: Equatable + Hashable Conformance
    
    static func == (lhs: CocktailIngredient, rhs: CocktailIngredient) -> Bool {
        lhs.id > rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    // MARK: - @Model codable conformance

    enum CodingKeys: CodingKey {
        case id, ingredient, value, unit, prep
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.ingredient = try container.decode(IngredientType.self, forKey: .ingredient)
        self.value = try container.decode(Double.self, forKey: .value)
        self.unit = try container.decode(MeasurementUnit.self, forKey: .unit)
        self.prep = try container.decode(Prep.self, forKey: .prep)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(value, forKey: .value)
        try container.encode(ingredient, forKey: .ingredient)
        try container.encode(unit, forKey: .unit)
        try container.encode(prep, forKey: .prep
        )
    }
}


@Model
class Ingredient: Codable, Hashable {

    let id: UUID
    let name: String
    let category: Category
    let tags: Tags?
    let value: Double
    let unit: MeasurementUnit
    let prep: Prep?
    let isCustom: Bool? 
    var matchesCurrentSearch: Bool
    var info: String?
    @Relationship(deleteRule: .cascade) let ingredientModel: IngredientModel
    
    
    init(_ name: String, ingredientCategory: Category, tagsWithSubcategories: Tags? = Tags(), value: Double, unit: MeasurementUnit = .fluidOunces, prep: Prep? = nil, isCustom: Bool? = false, info: String? = nil) {
        self.name = name
        self.category = ingredientCategory
        self.tags = tagsWithSubcategories
        self.value = value
        self.unit = unit
        self.id = UUID()
        self.prep = prep
        self.isCustom = isCustom
        self.matchesCurrentSearch = false
        self.info = info
        self.ingredientModel = IngredientModel(name: name, category: ingredientCategory, tags: tagsWithSubcategories, prep: prep)
    }
    
    init(oldIngredient: CocktailIngredient) {
        let newCategory = {
            var newCategory: Category = .agaves
            for category in Category.allCases {
                if oldIngredient.ingredient.category == category.rawValue {
                    newCategory = category
                    return newCategory
                }
            }
            return newCategory
        }()
        
        self.id = UUID()
        self.name = oldIngredient.ingredient.name
        self.category = newCategory
        self.tags = oldIngredient.ingredient.tags
        self.value = oldIngredient.value
        self.unit = oldIngredient.unit
        self.prep = oldIngredient.prep
        self.isCustom = false
        self.matchesCurrentSearch = false
        self.info = oldIngredient.info
        self.ingredientModel = IngredientModel(name: oldIngredient.ingredient.name, category: newCategory, tags: oldIngredient.ingredient.tags, prep: oldIngredient.prep)
    }
    func localizedVolumetricString(location: Location) -> String {
        switch location {
        case .usa:
            return "\(value) \(unit)"
        case .world:
            return "\(self.value * 29.5735) mls"
        }
    }
    
    // MARK: Equatable + Hashable Conformance
    
    static func == (lhs: Ingredient, rhs: Ingredient) -> Bool {
        lhs.id > rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    // MARK: - @Model codable conformance

    enum CodingKeys: CodingKey {
        case id, name, ingredientCategory, tagsWithSubcategories, value, unit, prep, matchesCurrentSearch, info, ingredientModel
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.category = try container.decode(Category.self, forKey: .ingredientCategory)
        self.tags = try container.decode(Tags.self, forKey: .tagsWithSubcategories)
        self.value = try container.decode(Double.self, forKey: .value)
        self.unit = try container.decode(MeasurementUnit.self, forKey: .unit)
        self.prep = try container.decode(Prep.self, forKey: .prep)
        self.matchesCurrentSearch = try container.decode(Bool.self, forKey: .matchesCurrentSearch)
        self.info = try container.decode(String.self, forKey: .info)
        self.ingredientModel = try container.decode(IngredientModel.self, forKey: .ingredientModel)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(value, forKey: .value)
        try container.encode(name, forKey: .name)
        try container.encode(category, forKey: .ingredientCategory)
        try container.encode(tags, forKey: .tagsWithSubcategories)
        try container.encode(unit, forKey: .unit)
        try container.encode(prep, forKey: .prep)
        try container.encode(matchesCurrentSearch, forKey: .matchesCurrentSearch)
        try container.encode(info, forKey: .info)
        try container.encode(ingredientModel, forKey: .ingredientModel)
    }
}



enum Category: String, Codable, CaseIterable  {
    
    case syrups            = "Syrups"
    case juices            = "Juice"
    case herbs             = "Herbs"
    case fruit             = "Fruit"
    case seasoning         = "Seasoning"
    case soda              = "Sodas"
    case otherNonAlc       = "Other N/A"
    case agaves            = "Agave"
    case brandies          = "Brandy"
    case gins              = "Gin"
    case otherAlcohol      = "Other Alcohol"
    case rums              = "Rum"
    case vodkas            = "Vodka"
    case whiskies          = "Whiskies"
    case liqueurs          = "Liqueurs"
    case fortifiedWines    = "Fortified Wine"
    case wines             = "Wine"
    case bitters           = "Bitters"
    case amari             = "Amari"
}



@Model
class IngredientModel: Codable, Hashable {
//    #Unique<IngredientModel>([\.name])
    let name: String
    let category: Category
    let tags: Tags?
    let prep: Prep?
    
    init(name: String, category: Category, tags: Tags? = Tags(), prep: Prep?) {
        self.name = name
        self.category = category
        self.tags = tags
        self.prep = prep
    }
    
    // MARK: Equatable + Hashable Conformance
    
    static func == (lhs: IngredientModel, rhs: IngredientModel) -> Bool {
        lhs.name > rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    enum CodingKeys: CodingKey {
        case name, category, tags, prep
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.category = try container.decode(Category.self, forKey: .category)
        self.tags = try container.decode(Tags.self, forKey: .tags)
        self.prep = try container.decode(Prep.self, forKey: .prep)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(category, forKey: .category)
        try container.encode(tags, forKey: .tags)
        try container.encode(prep, forKey: .prep)
    }
    
    static func removeDuplicates(in context: ModelContext) throws {
        let descriptor = FetchDescriptor<IngredientModel>()
        let allObjects = try context.fetch(descriptor)
        
        let groupedObjects = Dictionary(grouping: allObjects, by: { $0.name })
        
        for (_, objects) in groupedObjects where objects.count > 1 {
            // Keep the first object, delete the rest
            for object in objects.dropFirst() {
                context.delete(object)
            }
        }
        
        try context.save()
    }
}



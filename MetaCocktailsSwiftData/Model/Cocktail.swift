//
//  Cocktail.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/11/23.
//

import SwiftData
import SwiftUI

@Model
class Cocktail {
    
    
    var id = UUID()
    var cocktailName: String
    var imageAsset: CocktailImage?
    var glasswareType: Glassware
    var garnish: [Garnish]?
    var ice: Ice?
    var author: String?
    var spec: [CocktailIngredient]
    var buildOrder: Build?
    var tags: Tags
    
    init(id: UUID = UUID(), cocktailName: String, imageAsset: CocktailImage? = nil, glasswareType: Glassware, garnish: [Garnish]? = nil, ice: Ice? = nil, author: String? = nil, spec: [CocktailIngredient], buildOrder: Build? = nil, tags: Tags) {
        self.id = id
        self.cocktailName = cocktailName
        self.imageAsset = imageAsset
        self.glasswareType = glasswareType
        self.garnish = garnish
        self.ice = ice
        self.author = author
        self.spec = spec
        self.buildOrder = buildOrder
        self.tags = tags
    }
    
    func CompileTags() -> Tags {
        
        var compileTags = self.tags

        for ingredient in self.spec {
            if let agave = ingredient.ingredient.tags.agave {
                for agave in agave {
                    if compileTags.agave?.append(agave) == nil {
                        compileTags.agave = [agave]
                    }
                }
                compileTags.agave = Array(Set(compileTags.agave!))
            }
            if let amari = ingredient.ingredient.tags.amari {
                for amaro in amari {
                    if compileTags.amari?.append(amaro) == nil {
                        compileTags.amari = [amaro]
                    }
                }
                compileTags.amari = Array(Set(compileTags.amari!))
            }
            if let bitters = ingredient.ingredient.tags.bitters {
                for bitter in bitters {
                    if compileTags.bitters?.append(bitter) == nil {
                        compileTags.bitters = [bitter]
                    }
                }
                compileTags.bitters = Array(Set(compileTags.bitters!))
            }
            if let brandy = ingredient.ingredient.tags.brandy {
                for brandy in brandy {
                    if compileTags.brandy?.append(brandy) == nil {
                        compileTags.brandy = [brandy]
                    }
                }
                compileTags.brandy = Array(Set(compileTags.brandy!))
            }
            if let fortifiedWine = ingredient.ingredient.tags.fortifiedWine {
                for fortified in fortifiedWine {
                    if compileTags.fortifiedWine?.append(fortified) == nil {
                        compileTags.fortifiedWine = [fortified]
                    }
                }
                compileTags.fortifiedWine = Array(Set(compileTags.fortifiedWine!))
            }
            if let gin = ingredient.ingredient.tags.gin {
                for gin in gin {
                    if compileTags.gin?.append(gin) == nil {
                        compileTags.gin = [gin]
                    }
                }
                compileTags.gin = Array(Set(compileTags.gin!))
            }
            if let liqueurs = ingredient.ingredient.tags.liqueur {
                for liqueur in liqueurs {
                    if compileTags.liqueur?.append(liqueur) == nil {
                        compileTags.liqueur = [liqueur]
                    }
                }
                compileTags.liqueur = Array(Set(compileTags.liqueur!))
            }
            if let others = ingredient.ingredient.tags.other {
                for other in others {
                    if compileTags.other?.append(other) == nil {
                        compileTags.other = [other]
                    }
                }
                compileTags.other = Array(Set(compileTags.other!))
            }
            if let rum = ingredient.ingredient.tags.rum {
                for rum in rum {
                    if compileTags.rum?.append(rum) == nil {
                        compileTags.rum = [rum]
                    }
                }
                compileTags.rum = Array(Set(compileTags.rum!))
            }
            if let vodkas = ingredient.ingredient.tags.vodka {
                for vodka in vodkas {
                    if compileTags.vodka?.append(vodka) == nil {
                        compileTags.vodka = [vodka]
                    }
                }
                compileTags.vodka = Array(Set(compileTags.vodka!))
            }
            if let whiskies = ingredient.ingredient.tags.whiskies {
                for whisky in whiskies {
                    if compileTags.whiskies?.append(whisky) == nil {
                        compileTags.whiskies = [whisky]
                    }
                }
                compileTags.whiskies = Array(Set(compileTags.whiskies!))
            }
            if let wines = ingredient.ingredient.tags.wine {
                for wine in wines {
                    if compileTags.wine?.append(wine) == nil {
                        compileTags.wine = [wine]
                    }
                }
                compileTags.wine = Array(Set(compileTags.wine!))
            }

            if let flavors = ingredient.ingredient.tags.flavors {
                for flavor in flavors {
                    
                    if compileTags.flavors?.append(flavor) == nil {
                        compileTags.flavors = [flavor]
                    }
                }
                compileTags.flavors = Array(Set(compileTags.flavors!))
            }
            if let profiles = ingredient.ingredient.tags.profiles {
                for profile in profiles {
                    if compileTags.profiles?.append(profile) == nil {
                        compileTags.profiles = [profile]
                    }
                }
                compileTags.profiles = Array(Set(compileTags.profiles!))
            }
            if let styles =  ingredient.ingredient.tags.styles {
                for style in styles {
                    if compileTags.styles?.append(style) == nil {
                        compileTags.styles = [style]
                    }
                }
                compileTags.styles = Array(Set(compileTags.styles!))
            }
            if let textures = ingredient.ingredient.tags.textures {
                for texture in textures {
                    if compileTags.textures?.append(texture) == nil {
                        compileTags.textures = [texture]
                    }
                }
                compileTags.textures = Array(Set(compileTags.textures!))
            }
            
            
        }

        return compileTags
    }

}

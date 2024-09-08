//
//  SearchPredicateFactory.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 8/7/24.
//

import Foundation
import SwiftData


enum PredicateType {
    case perfect
    case minusOne
    case minusTwo
    case unknown
}

enum SearchType {
    case simple
    case complex
}

extension SearchViewModel {
    
    func matchPredicateType(_ matchCount: Int) -> PredicateType {
        switch matchCount {
        case preferredCount:
                .perfect
        case preferredCount - 1:
                .minusOne
        case preferredCount - 2:
                .minusTwo
        default:
                .unknown
        }
    }
    
    func predicateFactory(for matchCount: Int) -> Predicate<Cocktail> {
       
        if searchType == .complex {
            return complicatedPredicateSearch(matchPredicateType(matchCount))
        }
        
        // Prepare expressions
        let countPreferredIngredients = countPrefIngredients()
        let hasUmbrella = hasUmbrella()
        let hasBase = hasBaseCategory()
        let hasSpecialty = hasSpecialty()
        let totalUnwanted = totalUnwantedIngredients()
        
        // Check for preferred ingredients only
        if preferredUmbrellaCategories.isEmpty && preferredBaseCategories.isEmpty && preferredSpecialtyCategories.isEmpty && !preferredIngredients.isEmpty {
            return makeSimplePredicate(totalUnwanted: totalUnwanted, expression: countPreferredIngredients, matchCount: matchCount)
        }
        
        // Check for single umbrella category
        if preferredUmbrellaCategories.count == 1 && preferredBaseCategories.isEmpty && preferredSpecialtyCategories.isEmpty && preferredIngredients.isEmpty {
            return makeSimplePredicate(totalUnwanted: totalUnwanted, expression: hasUmbrella, matchCount: matchCount)
        }
        
        // Check for single base category
        if preferredUmbrellaCategories.isEmpty && preferredBaseCategories.count == 1 && preferredSpecialtyCategories.isEmpty && preferredIngredients.isEmpty {
            return makeSimplePredicate(totalUnwanted: totalUnwanted, expression: hasBase, matchCount: matchCount)
        }
        
        // Check for single specialty category
        if preferredUmbrellaCategories.isEmpty && preferredBaseCategories.isEmpty && preferredSpecialtyCategories.count == 1 && preferredIngredients.isEmpty {
            return makeSimplePredicate(totalUnwanted: totalUnwanted, expression: hasSpecialty, matchCount: matchCount)
        }

        
        // Check for combined categories and ingredients
        return makeCombinedPredicate(
            totalUnwanted: totalUnwanted,
            hasUmbrella: hasUmbrella,
            hasBase: hasBase,
            hasSpecialty: hasSpecialty,
            countPreferredIngredients: countPreferredIngredients,
            matchCount: matchCount
        )
    }
    
    private func makeSimplePredicate(totalUnwanted: Expression<[Ingredient], Bool>, expression: Expression<[Ingredient], Int>, matchCount: Int) -> Predicate<Cocktail> {
        return #Predicate<Cocktail> { cocktail in
            !totalUnwanted.evaluate(cocktail.spec) &&
            expression.evaluate(cocktail.spec) == matchCount
        }
    }

    private func makeCombinedPredicate(
        totalUnwanted: Expression<[Ingredient], Bool>,
        hasUmbrella: Expression<[Ingredient], Int>,
        hasBase: Expression<[Ingredient], Int>,
        hasSpecialty: Expression<[Ingredient], Int>,
        countPreferredIngredients: Expression<[Ingredient], Int>,
        matchCount: Int) -> Predicate<Cocktail> {
            
            let predicate: Predicate<Cocktail>
            
            switch (preferredUmbrellaCategories.count, preferredBaseCategories.count, preferredSpecialtyCategories.count, preferredIngredients.count) {
            case (1, 1, 0, 0):
                // One umbrella and one base category
                predicate = #Predicate<Cocktail> { cocktail in
                    hasUmbrella.evaluate(cocktail.spec) + hasBase.evaluate(cocktail.spec) == matchCount
                }
                
            case (1, 0, 1, 0):
                // One umbrella and one specialty category
                predicate = #Predicate<Cocktail> { cocktail in
                    hasUmbrella.evaluate(cocktail.spec) + hasSpecialty.evaluate(cocktail.spec) == matchCount
                }
                
            case (0, 1, 1, 0):
                // One base and one specialty category
                predicate = #Predicate<Cocktail> { cocktail in
                    hasBase.evaluate(cocktail.spec) + hasSpecialty.evaluate(cocktail.spec) == matchCount
                }
                
            case (1, 1, 1, 0):
                // One umbrella, one base, and one specialty category
                predicate = #Predicate<Cocktail> { cocktail in
                    hasUmbrella.evaluate(cocktail.spec) + hasBase.evaluate(cocktail.spec) + hasSpecialty.evaluate(cocktail.spec) == matchCount
                }
                //This part matches a tuple where the first three elements are 0 and the fourth element is captured in a constant named ingredientCount. where ingredientCount > 0: This condition specifies that the case should only match if ingredientCount is greater than 0. This is the first time I've used this syntax. Super neat!!
            case (0, 0, 0, let ingredientCount) where ingredientCount > 0:
                // Only preferred ingredients
                predicate = #Predicate<Cocktail> { cocktail in
                    countPreferredIngredients.evaluate(cocktail.spec) == matchCount
                }
                
            case (1, 0, 0, let ingredientCount) where ingredientCount > 0:
                // One umbrella and preferred ingredients
                predicate = #Predicate<Cocktail> { cocktail in
                    hasUmbrella.evaluate(cocktail.spec) + countPreferredIngredients.evaluate(cocktail.spec) == matchCount
                }
                
            case (0, 1, 0, let ingredientCount) where ingredientCount > 0:
                // One base and preferred ingredients
                predicate = #Predicate<Cocktail> { cocktail in
                    hasBase.evaluate(cocktail.spec) + countPreferredIngredients.evaluate(cocktail.spec) == matchCount
                }
                
            case (0, 0, 1, let ingredientCount) where ingredientCount > 0:
                // One specialty and preferred ingredients
                predicate = #Predicate<Cocktail> { cocktail in
                    hasSpecialty.evaluate(cocktail.spec) + countPreferredIngredients.evaluate(cocktail.spec) == matchCount
                }
                
            case (1, 1, 0, let ingredientCount) where ingredientCount > 0:
                // One umbrella, one base, and preferred ingredients
                predicate = #Predicate<Cocktail> { cocktail in
                    hasUmbrella.evaluate(cocktail.spec) + hasBase.evaluate(cocktail.spec) + countPreferredIngredients.evaluate(cocktail.spec) == matchCount
                }
                
            case (1, 0, 1, let ingredientCount) where ingredientCount > 0:
                // One umbrella, one specialty, and preferred ingredients
                predicate = #Predicate<Cocktail> { cocktail in
                    hasUmbrella.evaluate(cocktail.spec) + hasSpecialty.evaluate(cocktail.spec) + countPreferredIngredients.evaluate(cocktail.spec) == matchCount
                }
                
            case (0, 1, 1, let ingredientCount) where ingredientCount > 0:
                // One base, one specialty, and preferred ingredients
                predicate = #Predicate<Cocktail> { cocktail in
                    hasBase.evaluate(cocktail.spec) + hasSpecialty.evaluate(cocktail.spec) + countPreferredIngredients.evaluate(cocktail.spec) == matchCount
                }
                
            default:
                // Do all the checks
                predicate = #Predicate<Cocktail> { cocktail in
                    hasUmbrella.evaluate(cocktail.spec) + hasBase.evaluate(cocktail.spec) + hasSpecialty.evaluate(cocktail.spec) + countPreferredIngredients.evaluate(cocktail.spec) == matchCount
                }
            }
            
            // Finally, return the resulting predicate.
            
            if unwantedSelections.isEmpty {
                // If there are no unwanted selections, we can avoid the findIngredientNamesForUnwantedSubcategories() loops
                return #Predicate<Cocktail> { cocktail in
                    predicate.evaluate(cocktail)
                }
            } else {
                return #Predicate<Cocktail> { cocktail in
                    !totalUnwanted.evaluate(cocktail.spec) && predicate.evaluate(cocktail)
                }
            }
        }
    
    //build expression for preferred ingredients
    private func countPrefIngredients() -> Expression<[Ingredient], Int> {
        return #Expression<[Ingredient], Int> { ingredients in
            ingredients.filter { ingredient in
                preferredIngredients.contains(ingredient.ingredientBase.name)
            }.count
        }
    }
    
    //build expression for umbrella
    private func hasUmbrella() -> Expression<[Ingredient], Int> {
        return #Expression<[Ingredient], Int> { ingredients in
            ingredients.filter { ingredient in
                preferredUmbrellaCategories.contains(ingredient.ingredientBase.umbrellaCategory)
            }.count > 0 ? 1 : 0
        }
    }
    
    //build expression for baseCategory
    private func hasBaseCategory() -> Expression<[Ingredient], Int> {
        return #Expression<[Ingredient], Int> { ingredients in
            ingredients.filter { ingredient in
                preferredBaseCategories.contains(ingredient.ingredientBase.baseCategory)
            }.count > 0 ? 1 : 0
        }
    }
    
    //build expression for specialty
    private func hasSpecialty() -> Expression<[Ingredient], Int> {
        return #Expression<[Ingredient], Int> { ingredients in
            ingredients.filter { ingredient in
                preferredSpecialtyCategories.contains(ingredient.ingredientBase.specialtyCategory)
            }.count > 0 ? 1 : 0
        }
    }
    
    private func totalUnwantedIngredients() -> Expression<[Ingredient], Bool> {
        let totalUnwantedIngredients: [String] = unwantedIngredients + findAllCategoryIngredients().excluded
        
        return #Expression<[Ingredient], Bool> { ingredients in
            ingredients.filter { ingredient in
                totalUnwantedIngredients.contains(ingredient.ingredientBase.name)
            }.count > 0
        }
    }
    
    func generateComplicatedPredicates() async {
        await toggleLoading()
        
        let numberOfSelections = preferredCount
        var perfectMatches = [String]()
        var minusOne = [String]()
        var minusTwo = [String]()
        
        let _ = allCocktails.reduce(into: 0) { partialResult, cocktail in
                if !updatedUnwantedSelections.isEmpty {
                    let hasUnwantedIngredient = cocktail.spec.contains { ingredient in
                        updatedUnwantedSelections.contains(ingredient.ingredientBase.name) ||
                        updatedUnwantedSelections.contains(ingredient.ingredientBase.umbrellaCategory) ||
                        updatedUnwantedSelections.contains(ingredient.ingredientBase.baseCategory) ||
                        updatedUnwantedSelections.contains(ingredient.ingredientBase.specialtyCategory)
                    }
                    
                    let hasUnwantedFlavor = cocktail.compiledTags.flavors?.contains { updatedUnwantedSelections.contains($0.rawValue) } ?? false
                    let hasUnwantedProfile = cocktail.compiledTags.profiles?.contains { updatedUnwantedSelections.contains($0.rawValue) } ?? false
                    let hasUnwantedStyle = cocktail.compiledTags.styles?.contains { updatedUnwantedSelections.contains($0.rawValue) } ?? false
                    
                    if hasUnwantedIngredient || hasUnwantedFlavor || hasUnwantedProfile || hasUnwantedStyle {
                        return // if the cocktail has an unwanted selection, flavor, or profile, bail out early.
                    }
                }
            
            var umbrellas = preferredUmbrellaCategories
            var bases = preferredBaseCategories
            var specialties = preferredSpecialtyCategories
            var ingredients = preferredIngredients
            
            var matchedSelections = 0
            
            // Check for Profiles
            if let profileTags = cocktail.compiledTags.profiles {
                matchedSelections += profileTags.filter { preferredProfileStrings.contains($0.rawValue) }.count
            }
            
            //check flavors
            if let flavorTags = cocktail.compiledTags.flavors {
                matchedSelections += flavorTags.filter { preferredFlavorStrings.contains($0.rawValue)}.count
            }
            
            //check styles
            if let styleTags = cocktail.compiledTags.styles {
                matchedSelections += styleTags.filter { preferredStyleStrings.contains($0.rawValue)}.count
            }
            
            
            cocktail.spec.forEach { ingredient in
                if !umbrellas.isEmpty && umbrellas.contains(ingredient.ingredientBase.umbrellaCategory) {
                    matchedSelections += 1
                    if let index = umbrellas.firstIndex(of: ingredient.ingredientBase.umbrellaCategory) {
                        umbrellas.remove(at: index)
                    }
                } else if !bases.isEmpty && bases.contains(ingredient.ingredientBase.baseCategory) {
                    matchedSelections += 1
                    if let index = bases.firstIndex(of: ingredient.ingredientBase.baseCategory) {
                        bases.remove(at: index)
                    }
                } else if !specialties.isEmpty && specialties.contains(ingredient.ingredientBase.specialtyCategory) {
                    matchedSelections += 1
                    if let index = specialties.firstIndex(of: ingredient.ingredientBase.specialtyCategory) {
                        specialties.remove(at: index)
                    }
                } else if !ingredients.isEmpty && ingredients.contains(ingredient.ingredientBase.name) {
                    matchedSelections += 1
                    if let index = ingredients.firstIndex(of: ingredient.ingredientBase.name) {
                        ingredients.remove(at: index)
                    }
                }
                
            }
            
            
            
            if matchedSelections >= numberOfSelections {
                perfectMatches.append(cocktail.cocktailName)
                partialResult += 1
            } else if matchedSelections == numberOfSelections - 1 {
                minusOne.append(cocktail.cocktailName)
            } else if matchedSelections == numberOfSelections - 2 {
                minusTwo.append(cocktail.cocktailName)
            }
        }
        
        perfectMatchCocktails = perfectMatches
        minusOneMatchCocktails = minusOne
        minusTwoMatchCocktails = minusTwo
        
        await toggleLoading()
    }
    
    private func complicatedPredicateSearch(_ predicateType: PredicateType) -> Predicate<Cocktail> {
        
        if predicateType == .unknown {
            print("--- FOUND UNKNOWN PREDICATE TYPE!!!!!!!")
        }
        
        switch predicateType {
        case .perfect:
            let expression = #Expression<Cocktail, Bool> { cocktail in
                perfectMatchCocktails.contains(cocktail.cocktailName)
            }
            
            return #Predicate<Cocktail> { cocktail in
                expression.evaluate(cocktail)
            }
        case .minusOne:
            let expression = #Expression<Cocktail, Bool> { cocktail in
                minusOneMatchCocktails.contains(cocktail.cocktailName)
            }
            
            return #Predicate<Cocktail> { cocktail in
                expression.evaluate(cocktail)
            }
        case .minusTwo:
            
            let expression = #Expression<Cocktail, Bool> { cocktail in
                minusTwoMatchCocktails.contains(cocktail.cocktailName)
            }
            
            return #Predicate<Cocktail> { cocktail in
                expression.evaluate(cocktail)
            }
        case .unknown:
            print("--- PROBLEM: We shouldn't be here") // I'll remove this, just want to be sure I know if this happens
            return #Predicate<Cocktail> { cocktail in
                cocktail.cocktailName == "SHAMALAMADINGDONG"
            }
        }
    }
}

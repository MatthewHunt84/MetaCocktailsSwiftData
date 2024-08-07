//
//  SearchPredicateFactory.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 8/7/24.
//

import Foundation
import SwiftData

extension SearchViewModel {
    
    func predicateFactory(for matchCount: Int) -> Predicate<Cocktail> {
        // Early exit for complicated predicate search
        if preferredUmbrellaCategories.count > 1 ||
            preferredBaseCategories.count > 1 ||
            preferredSpecialtyCategories.count > 1 {
            return complicatedPredicateSearch()
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
    
    
    private func complicatedPredicateSearch() -> Predicate<Cocktail>{
        return #Predicate<Cocktail> { cocktail in
            cocktail.cocktailName == "Daiquiri"
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
}

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
    
    private func complicatedPredicateSearch() -> Predicate<Cocktail> {
        
        // Should probably take this into a background thread using async.
        // Once this is run, it populates three arrays: perfectCocktails, minusOneCocktails, and minusTwoCocktails.
        // Before we continue we check to see if they are populated, if so - return the correct predicate immediately without looping repeatedly
        
        let numberOfSelections = preferredSelections.count
        var matchedCocktails = [String]()

        let numberOfCocktailsWithUmbrellas = allCocktails.reduce(into: 0) { partialResult, cocktail in

            var umbrellas = preferredUmbrellaCategories
            var bases = preferredBaseCategories
            var specialties = preferredSpecialtyCategories
            var ingredients = preferredIngredients
            
            var cocktailCount = 0
            
            cocktail.spec.forEach { ingredient in
                
                if umbrellas.contains(ingredient.ingredientBase.umbrellaCategory) {
                    cocktailCount += 1
                    if let index = umbrellas.firstIndex(of: ingredient.ingredientBase.umbrellaCategory) {
                        umbrellas.remove(at: index)
                    }
                } else if bases.contains(ingredient.ingredientBase.baseCategory) {
                    cocktailCount += 1
                    if let index = bases.firstIndex(of: ingredient.ingredientBase.baseCategory) {
                        bases.remove(at: index)
                    }
                } else if specialties.contains(ingredient.ingredientBase.specialtyCategory) {
                    cocktailCount += 1
                    if let index = specialties.firstIndex(of: ingredient.ingredientBase.specialtyCategory) {
                        specialties.remove(at: index)
                    }
                    
                } else if ingredients.contains(ingredient.ingredientBase.name) {
                    cocktailCount += 1
                    if let index = ingredients.firstIndex(of: ingredient.ingredientBase.name) {
                        ingredients.remove(at: index)
                    }
                }
            }
            
            if cocktailCount >= numberOfSelections {
                matchedCocktails.append(cocktail.cocktailName)
            }
            
            partialResult += cocktailCount
        }
        

        if numberOfCocktailsWithUmbrellas >= numberOfSelections {
            
            let expression = #Expression<Cocktail, Bool> { cocktail in
                matchedCocktails.contains(cocktail.cocktailName)
            }
            
            return #Predicate<Cocktail> { cocktail in
                expression.evaluate(cocktail)
            }
            
        } else {
            
            return #Predicate<Cocktail> { cocktail in
                cocktail.cocktailName == "Daiquiri"
            }
        }
    }
}


/// Welcome to the complicated predicate search!
/// We'll enter this search if we have more than one subcategory (umbrella, base, or specialty)
///
/// The reason that these cases are problematic is that our basic checks look to see if a cocktail spec contains at least one of whatever.
/// So if we had [Whiskies, Gin] in our umbrellas, a expressions can only return a max of one to avoid cases where a spec might have multiple whiskies.
/// This leaves that case where the multiple umbrellas represent selections unto themselves.
///
/// So how do we approach this problem? Lets take a complicated example:
///
/// Lets say we have 3 umbrellas [whiskey, ginLondonDry, agave]
/// and also 3 bases [cognac, rumJamaicanAged, and rum(dark)]
/// and also 3 specialties [tawnyPort, amontillado, sweetVermouth]
/// and then 3 ingredients for good measure [lemon juice, raspberries, egg white]
///
/// The first step would be to count these up. So in this case there would be 12 selections here.
///
///         /// The next step would be to filter through the cocktails. I think because we can use more advanced swift functions we should be able to tackle this in a single loop.
///
/// So first we grab all cocktails from the model, using a predicate. allCocktails = [Cocktail]
        
        /// then for each cocktail, we grab it's spec = [Ingredient]
        ///
        /// for each ingredient in the spec we grab it's base [IngredientBase]
        ///
        /// then we run checks on that base
        ///
        /// - what is your umbrella? if it matches one from our list we +1 to our count.
        /// what if umbrella is whiskies, we can't have any bases or specialties that would match - since those will have already been filtered out by the search (can't be a bourbon for instance, but also couldn't be a jamaican rum, or lemon juice since the categories are mutually exclusive. So if we match an umbrella we would +1 and break out).
        /// - what is your base? Similarly, if we match cognac we +1 and bail, none of the specialities or ingredients could also match in this case
        /// - what is your specialty? This again is a +1 or 0 question.
        /// - finally, if we are still here we'll check the ingredientName. If that matches +1 otherwise 0
        ///
        /// So essentially, for each ingredientBase we're going to add one to the count, or add zero.
        /// This means we can distill this whole thing down to a reduce function!
        /// We're reducing the cocktails array into the number of matches we find.
        ///
        /// Now, assuming this all works the way we expect - will the minus one cells be able to show the missing umbrellas/bases/specialties for cocktails which fall into this bucket?
        /// Actually yeah it still does, because for each cocktail in that list it's running a filter of the cocktails ingredients vs the selected ingredients to find the missing ones. Cool.
        ///
        /// So at this point we'll just have a number for the cocktail. If it's 13 thats a perfect match, if it's 12 that's a minus1 match, and if it's 11 that's a minus 2 match.
        /// I think we should catch all three cases here, because the alternative is to run this function 3 times and that's horribly inefficient.
        /// It's probably a good idea actually to check how many selections we have and if:
        /// selections cant be less than 2
        /// selections == 3 we only care about perfect and minus one.
        /// Anything above 4 selections and we run like normal
        ///
        /// Okay, what about unwanted things? I guess that can happen before we look for umbrellas. if somebody has 'bourbon' in their dislikes we'll need to compare each ingredient against that massive array.
        /// I don't love this, but don't think there is a better way. That's why this is complicated.
        /// So lets run the totalCombinedUnwantedIngredients array function once at the top, and reference it first in the loop before we do the check for umbrella/base etc.
        
        /// Oh yeah, then what about passing the cocktails to a predicate?

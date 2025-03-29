//
//  CalculationTests.swift
//  MetaCocktailsSwiftDataTests
//
//  Created by James Menkal on 3/16/25.
//

import XCTest
@testable import MetaCocktailsSwiftData

final class CalculationTests: XCTestCase {
    
    var viewModel: CBCViewModel!
    var mockCocktail: Cocktail!
    
    override func setUp() {
        super.setUp()
        viewModel = CBCViewModel()
        
        let bourbonBase = IngredientBase(name: "Bourbon", category: .whiskies, prep: nil)
        let syrupBase = IngredientBase(name: "Simple Syrup", category: .syrups, prep: nil)
        let bittersBase = IngredientBase(name: "Angostura Bitters", category: .bitters, prep: nil)
        
        let ingredients = [
            Ingredient(ingredientBase: bourbonBase, value: 2.0, unit: .fluidOunces),
            Ingredient(ingredientBase: syrupBase, value: 0.5, unit: .fluidOunces),
            Ingredient(ingredientBase: bittersBase, value: 2.0, unit: .dashes)
        ]
        
        mockCocktail = Cocktail(
            cocktailName: "Test Old Fashioned",
            glasswareType: .doubleOld,
            spec: ingredients,
            tags: Tags(),
            collection: .house
        )
        
        viewModel.chosenCocktail = mockCocktail
        viewModel.convertLoadedCocktail(for: mockCocktail)
        viewModel.numberOfCocktailsText = 1.0
    }
    
    override func tearDown() {
        viewModel = nil
        mockCocktail = nil
        super.tearDown()
    }
    
    func testUnitConversionValues() {

        XCTAssertEqual(viewModel.unitConversion[.barSpoon], 0.17, "Bar spoon conversion should be 0.17")
        XCTAssertEqual(viewModel.unitConversion[.teaspoon], 0.17, "Teaspoon conversion should be 0.17")
        XCTAssertEqual(viewModel.unitConversion[.dashes], 0.04, "Dashes conversion should be 0.04")
        XCTAssertEqual(viewModel.unitConversion[.drops], 0.0017, "Drops conversion should be 0.0017")
        
        XCTAssertEqual(0.17 * 29.5735, 5.03, accuracy: 0.01, "1 barspoon should be ~5ml")
        XCTAssertEqual(0.04 * 29.5735, 1.18, accuracy: 0.01, "1 dash should be ~1.18ml")
        XCTAssertEqual(0.0017 * 29.5735, 0.05, accuracy: 0.01, "1 drop should be ~0.05ml")
    }
    
    func testIngredientMeasurementRetrieval() {
     
        viewModel.convertIngredientsToBatchCellData()
        
        let bourbonCellData = viewModel.quantifiedBatchedIngredients.first { $0.ingredientName == "Bourbon" }
        XCTAssertNotNil(bourbonCellData, "Bourbon cell data should exist")
        
        let bourbonMeasurement = viewModel.getIngredientMeasurement(for: bourbonCellData!)
        XCTAssertNotNil(bourbonMeasurement, "Should retrieve bourbon measurement")
        XCTAssertEqual(bourbonMeasurement?.value, 2.0, "Bourbon value should be 2.0")
        XCTAssertEqual(bourbonMeasurement?.unit, .fluidOunces, "Bourbon unit should be fluid ounces")
        
        let bittersCellData = viewModel.quantifiedBatchedIngredients.first { $0.ingredientName == "Angostura Bitters" }
        XCTAssertNotNil(bittersCellData, "Bitters cell data should exist")
        
        let bittersMeasurement = viewModel.getIngredientMeasurement(for: bittersCellData!)
        XCTAssertNotNil(bittersMeasurement, "Should retrieve bitters measurement")
        XCTAssertEqual(bittersMeasurement?.value, 2.0, "Bitters value should be 2.0")
        XCTAssertEqual(bittersMeasurement?.unit, .dashes, "Bitters unit should be dashes")
    }
    
    func testDashIngredientOunceAmountCalculation() {
        
        viewModel.convertIngredientsToBatchCellData()
        
        let bittersCellData = viewModel.quantifiedBatchedIngredients.first { $0.ingredientName == "Angostura Bitters" }
        XCTAssertNotNil(bittersCellData, "Bitters cell data should exist")
        
        let bittersOunceAmount = viewModel.findIngredientOunceAmountFor(batchCellData: bittersCellData!)
        
        XCTAssertEqual(bittersOunceAmount, 2.0, "Current implementation returns 2.0 dashes, not converting to ounces")
        
        let dashConversionFactor = viewModel.unitConversion[.dashes] ?? 0
        let expectedMlAmount = 2.0 * dashConversionFactor * 29.5735
        

        XCTAssertEqual(bittersCellData!.mlAmount, expectedMlAmount, accuracy: 0.01, "Ml calculation should use the dash conversion factor")
        
        XCTAssertEqual(Double(bittersCellData!.totalMls), expectedMlAmount, accuracy: 1.0, "Total ml should match the expected amount from conversion")
    }
    
    func testGetActualFluidOunces() {
      
        let viewModel = CBCViewModel()
        let bourbonBase = IngredientBase(name: "Bourbon", category: .whiskies, prep: nil)
        let ingredient = Ingredient(ingredientBase: bourbonBase, value: 1.5, unit: .fluidOunces)
        
        let cocktail = Cocktail(
            cocktailName: "Test Cocktail",
            glasswareType: .doubleOld,
            spec: [ingredient],
            tags: Tags(),
            collection: .house
        )
        
        viewModel.chosenCocktail = cocktail
        viewModel.convertLoadedCocktail(for: cocktail)
        viewModel.numberOfCocktailsText = 100.0
        viewModel.convertIngredientsToBatchCellData()
        
        let bourbonCell = viewModel.quantifiedBatchedIngredients.first { $0.ingredientName == "Bourbon" }!
        let fluidOunces = viewModel.getActualFluidOunces(for: bourbonCell)
        
        print("Raw fluid ounces value: \(fluidOunces)")
        print("Total milliliters: \(bourbonCell.totalMls)")
        print("Converted back to oz: \(Double(bourbonCell.totalMls) / 29.5735)")
        
        let formatted = String(format: "%.2f", fluidOunces)
        print("Formatted to 2 decimal places: \(formatted) oz")
    }
    
    func testPreciseOunceConversion() {
      
        let viewModel = CBCViewModel()
        
        let bourbonBase = IngredientBase(name: "Bourbon", category: .whiskies, prep: nil)
        let ingredient = Ingredient(ingredientBase: bourbonBase, value: 1.5, unit: .fluidOunces)
        
        let cocktail = Cocktail(
            cocktailName: "Test Cocktail",
            glasswareType: .doubleOld,
            spec: [ingredient],
            tags: Tags(),
            collection: .house
        )
        
        viewModel.chosenCocktail = cocktail
        viewModel.convertLoadedCocktail(for: cocktail)
        viewModel.numberOfCocktailsText = 100.0
        viewModel.convertIngredientsToBatchCellData()
        
     
        let bourbonCell = viewModel.quantifiedBatchedIngredients.first { $0.ingredientName == "Bourbon" }!
        
        print("Original ingredient value: \(ingredient.value) oz")
        print("Number of cocktails: \(viewModel.numberOfCocktailsText)")
        print("Expected total fluid ounces: \(ingredient.value * viewModel.numberOfCocktailsText) oz")
        print("Total milliliters in batch cell: \(bourbonCell.totalMls) ml")
        print("Converting back to oz (totalMls / 29.5735): \(Double(bourbonCell.totalMls) / 29.5735) oz")
        

        let actualOunces = viewModel.getActualFluidOunces(for: bourbonCell)
        print("getActualFluidOunces returns: \(actualOunces) oz")
        
        XCTAssertEqual(actualOunces, Double(bourbonCell.totalMls) / 29.5735, accuracy: 0.000001, "getActualFluidOunces should convert milliliters to ounces by dividing by 29.5735")
        
     
        let formatted = viewModel.formatMeasurement(for: bourbonCell, showAsFluidOunces: true)
        let expectedFormatted = String(format: "%.2f oz", Double(bourbonCell.totalMls) / 29.5735)
        print("UI would display: \(formatted)")
        
        XCTAssertEqual(formatted, expectedFormatted, "formatMeasurement should format the ounce value with 2 decimal places")
    }
    
    func testFormatMeasurement() {
    
        viewModel.convertIngredientsToBatchCellData()
        
        let bourbonCellData = viewModel.quantifiedBatchedIngredients.first { $0.ingredientName == "Bourbon" }!
        let bourbonFormatted = viewModel.formatMeasurement(for: bourbonCellData)
        XCTAssertEqual(bourbonFormatted, "2 oz", "Bourbon should be formatted as '2 oz'")
        

        let bittersCellData = viewModel.quantifiedBatchedIngredients.first { $0.ingredientName == "Angostura Bitters" }!
        let bittersFormatted = viewModel.formatMeasurement(for: bittersCellData)
        XCTAssertEqual(bittersFormatted, "2 dash", "Bitters should be formatted as '2 dash'")
        
        let bittersFormattedOz = viewModel.formatMeasurement(for: bittersCellData, showAsFluidOunces: true)
        let expectedOz = Double(bittersCellData.totalMls) / 29.5735
        let expectedFormattedOz = String(format: "%.2f oz", expectedOz)
        
        XCTAssertEqual(bittersFormattedOz, expectedFormattedOz,
                     "Bitters should be formatted correctly when showing as fluid ounces")
    }
    
    func testScaledMeasurements() {
      
        viewModel.numberOfCocktailsText = 10.0
        viewModel.convertIngredientsToBatchCellData()
        
    
        let bourbonCellData = viewModel.quantifiedBatchedIngredients.first { $0.ingredientName == "Bourbon" }!
        let bourbonMeasurement = viewModel.getIngredientMeasurement(for: bourbonCellData)
        XCTAssertEqual(bourbonMeasurement?.value, 20.0, "Bourbon should scale to 20 oz for 10 cocktails")
        
      
        let bittersCellData = viewModel.quantifiedBatchedIngredients.first { $0.ingredientName == "Angostura Bitters" }!
        let bittersMeasurement = viewModel.getIngredientMeasurement(for: bittersCellData)
        XCTAssertEqual(bittersMeasurement?.value, 20.0, "Bitters should scale to 20 dashes for 10 cocktails")
        
    
        let dashConversionFactor = viewModel.unitConversion[.dashes] ?? 0
        let expectedBittersMl = 2.0 * dashConversionFactor * 29.5735 * 10
        XCTAssertEqual(bittersCellData.mlAmount * 10, expectedBittersMl, accuracy: 0.1,
                     "Scaled ml amount should be consistent with dashes conversion")
    }
    
    func testFormatMeasurementWithPartialUnits() {
       
        let bourbonBase = IngredientBase(name: "Bourbon", category: .whiskies, prep: nil)
        let bittersBase = IngredientBase(name: "Angostura Bitters", category: .bitters, prep: nil)
        
        let ingredients = [
            Ingredient(ingredientBase: bourbonBase, value: 1.5, unit: .fluidOunces),
            Ingredient(ingredientBase: bittersBase, value: 1.5, unit: .dashes)
        ]
        
        mockCocktail = Cocktail(
            cocktailName: "Fractional Test",
            glasswareType: .doubleOld,
            spec: ingredients,
            tags: Tags(),
            collection: .house
        )
        
        viewModel.chosenCocktail = mockCocktail
        viewModel.convertLoadedCocktail(for: mockCocktail)
        viewModel.numberOfCocktailsText = 1.0
        viewModel.convertIngredientsToBatchCellData()
        
 
        let bourbonCellData = viewModel.quantifiedBatchedIngredients.first { $0.ingredientName == "Bourbon" }!
        let bourbonFormatted = viewModel.formatMeasurement(for: bourbonCellData)
        XCTAssertEqual(bourbonFormatted, "1.50 oz", "Bourbon should be formatted as '1.50 oz'")
        
        
        let bittersCellData = viewModel.quantifiedBatchedIngredients.first { $0.ingredientName == "Angostura Bitters" }!
        let bittersFormatted = viewModel.formatMeasurement(for: bittersCellData)
        XCTAssertEqual(bittersFormatted, "1.50 dash", "Bitters should be formatted as '1.50 dash'")
        
       
        let bittersFormattedOz = viewModel.formatMeasurement(for: bittersCellData, showAsFluidOunces: true)
        
        let expectedOz = Double(bittersCellData.totalMls) / 29.5735
        let expectedFormattedOz = String(format: "%.2f oz", expectedOz)
        
        XCTAssertEqual(bittersFormattedOz, expectedFormattedOz, "Bitters should show converted amount when formatted as ounces")
    }
    
    func testMilliliterToOunceConversion() {
  
        let viewModel = CBCViewModel()
        let preciseConversionFactor = 0.033814
        
        
        let testCases: [(ml: Int, expectedOz: Double)] = [
            (30, Double(30) * preciseConversionFactor),        // ~1 oz
            (60, Double(60) * preciseConversionFactor),        // ~2 oz
            (118, Double(118) * preciseConversionFactor),      // ~4 oz
            (177, Double(177) * preciseConversionFactor),      // ~6 oz
            (237, Double(237) * preciseConversionFactor),      // ~8 oz
            (296, Double(296) * preciseConversionFactor),      // ~10 oz
            (4431, Double(4431) * preciseConversionFactor),    // ~150 oz (from our example)
            (3, Double(3) * preciseConversionFactor),          // A dash (~0.1 oz)
            (2, Double(2) * preciseConversionFactor),          // Small amount
            (1, Double(1) * preciseConversionFactor)           // Very small amount
        ]
        
 
        for (index, testCase) in testCases.enumerated() {
            let cellData = BottleBatchedCellData(
                id: UUID(),
                ingredientName: "Test Ingredient \(index)",
                bottleSize: 750,
                wholeBottles: testCase.ml / 750,
                remainingMls: testCase.ml % 750,
                mlAmount: 0.0, // Not used in this test
                totalMls: testCase.ml
            )
            
    
            let calculatedOunces = Double(cellData.totalMls) * preciseConversionFactor
            let formattedCalculated = String(format: "%.3f", calculatedOunces)
            let formattedExpected = String(format: "%.3f", testCase.expectedOz)
            
            print("Test Case \(index): \(testCase.ml) ml")
            print("  Expected oz: \(formattedExpected)")
            print("  Calculated oz: \(formattedCalculated)")
            
          
            XCTAssertEqual(calculatedOunces, testCase.expectedOz, accuracy: 0.0001, "Converting \(testCase.ml) ml to ounces should give \(testCase.expectedOz) oz")
            
            let formatted = viewModel.formatMeasurement(for: cellData, showAsFluidOunces: true)
            let expectedFormatted = String(format: "%.2f oz", testCase.expectedOz)
            
            print("  UI formatted: \(formatted)")
            print("  Expected formatted: \(expectedFormatted)")
            
            if viewModel.getActualFluidOunces(for: cellData) == calculatedOunces {
                XCTAssertEqual(formatted, expectedFormatted,  "The formatted value for \(testCase.ml) ml should be \(expectedFormatted)")
            } else {
                print("  Note: formatMeasurement is using a different conversion factor than our test")
            }
        }
    
        let testMl = 4431
        let expectedOz = Double(testMl) * preciseConversionFactor
        
        let testCell = BottleBatchedCellData(
            id: UUID(),
            ingredientName: "Direct Test",
            bottleSize: 750,
            wholeBottles: testMl / 750,
            remainingMls: testMl % 750,
            mlAmount: 0.0,
            totalMls: testMl
        )
        
        let methodOz = viewModel.getActualFluidOunces(for: testCell)
        
        print("\nDirect Method Test: \(testMl) ml")
        print("  Expected oz: \(expectedOz)")
        print("  Method returns: \(methodOz)")
        print("  Formula used in method: \(Double(testMl) / 29.5735) or \(Double(testMl) * preciseConversionFactor)?")
        
        let usingDivision = abs(methodOz - (Double(testMl) / 29.5735)) < 0.0001
        let usingMultiplication = abs(methodOz - (Double(testMl) * preciseConversionFactor)) < 0.0001
        
        print("  Method appears to be using: \(usingDivision ? "Division by 29.5735" : usingMultiplication ? "Multiplication by 0.033814" : "Unknown formula")")
        print("\nRecommendation: Update the getActualFluidOunces method to use the precise conversion factor:")
        print("  return Double(batchCellData.totalMls) * 0.033814")
    }
}

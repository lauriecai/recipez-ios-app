//
//  HomeViewModel_Tests.swift
//  Recipez_Tests
//
//  Created by Laurie Cai on 2/15/25.
//

import XCTest
@testable import Recipez

// Testing framework
/*
 1️⃣ Test Initial State → Verify default values and setup.
 2️⃣ Test Successful Behavior → Ensure correct execution under normal conditions.
 3️⃣ Test Failed Behavior → Simulate failures and validate error handling.
 4️⃣ Test Repeated Behavior → Ensure stability with multiple calls.
 5️⃣ Test Edge Cases → Handle unusual inputs, boundary values, or empty states.
 6️⃣ Test Concurrency → Ensure parallel execution doesn’t break logic.
 */

// Naming structure: test_<UnitOfWork>_<Method>_<ExpectedBehavior>
/*
 test_HomeViewModel_initialState()
 test_HomeViewModel_fetchRecipes_success()
 test_HomeViewModel_fetchRecipes_failure()
 */

// Testing structure: given, when, then
/*
 // Given
 // When
 // Then
 */

final class HomeViewModel_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	@MainActor func test_HomeViewModel_initialState() {
		// Given
		let mockService = MockRecipeDataService()
		// When
		let viewModel = HomeViewModel(recipeDataService: mockService)
		// Then
		XCTAssertTrue(viewModel.recipes.isEmpty, "recipes should start as an empty array")
		XCTAssertFalse(viewModel.showFeedError, "showFeedError should start as false")
	}
	
	@MainActor func test_HomeViewModel_fetchRecipes_success() async {
		// Given
		let mockService = MockRecipeDataService()
		let viewModel = HomeViewModel(recipeDataService: mockService)
		// When
		await viewModel.fetchRecipes()
		// Then
		XCTAssertFalse(viewModel.recipes.isEmpty, "recipes should not be empty after a successful fetch")
		XCTAssertFalse(viewModel.showFeedError, "showFeedError should be false after a successful fetch")
	}
	
	@MainActor func test_HomeViewModel_fetchRecipes_failure() async {
		// Given
		let mockService = MockRecipeDataService()
		let viewModel = HomeViewModel(recipeDataService: mockService)
		for error in MockRecipeDataService.RecipeDataError.allCases {
			// When
			mockService.failureScenario = error
			await viewModel.fetchRecipes()
			// Then
			XCTAssertTrue(viewModel.showFeedError, "showFeedError should be true after a failed fetch")
		}
	}
}

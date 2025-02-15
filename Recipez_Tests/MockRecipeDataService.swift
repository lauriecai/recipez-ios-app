//
//  MockRecipeDataService.swift
//  Recipez_Tests
//
//  Created by Laurie Cai on 2/15/25.
//

import Foundation
@testable import Recipez

class MockRecipeDataService: DataService {
	
	enum RecipeDataError: Error, LocalizedError, CaseIterable {
		case invalidURL, badServerResponse, malformedData, emptyData
		
		var errorDescription: String? {
			switch self {
			case .invalidURL:
				return "Invalid URL"
			case .badServerResponse:
				return "Bad server response"
			case .malformedData:
				return "Malformed recipes data"
			case .emptyData:
			   return "Recipes response empty"
			}
		}
	}
	
	let recipes: [Recipe] = [
		Recipe(id: "1", name: "Congee", cuisine: "Chinese", photoUrlLarge: "https://cdn4.groupbuyforms.tw/upload/images/v3/2c/ori/2c36221205e14ef78b353ccd4b4edadc.jpg", photoUrlSmall: nil, sourceUrl: nil, youtubeUrl: nil),
		Recipe(id: "2", name: "Tacos", cuisine: "Mexican", photoUrlLarge: "https://media1.popsugar-assets.com/files/thumbor/7JvlkzPhn4tk5tr3JbXerVvhWzQ=/fit-in/1584x1056/top/filters:format_auto():upscale()/2023/03/07/905/n/1922195/tmp_RlG5rM_ad647f2e1c444212_GettyImages-1347087219.jpg", photoUrlSmall: nil, sourceUrl: nil, youtubeUrl: nil)
	]
	
	var failureScenario: RecipeDataError? = nil
	
	func getRecipes() async throws -> [Recipe] {
		if let failureScenario = failureScenario {
			switch failureScenario {
			case .invalidURL:
				throw RecipeDataError.invalidURL
			case .badServerResponse:
				throw RecipeDataError.badServerResponse
			case .malformedData:
				throw RecipeDataError.malformedData
			case .emptyData:
				throw RecipeDataError.emptyData
			}
		} else {
			try? await Task.sleep(nanoseconds: 1_000_000_000)
			return recipes
		}
	}
}

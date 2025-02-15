//
//  RecipeDataService.swift
//  Recipez
//
//  Created by Laurie Cai on 2/12/25.
//

import Foundation

class RecipeDataService: DataService {
	
	let urlString: String
	
	init(url: String) {
		self.urlString = url
	}
	
	enum RecipeManagerError: Error, LocalizedError {
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
	
	func getRecipes() async throws -> [Recipe] {
		
		let recipesData: AllRecipes
		
		do {
			// ensure valid url
			guard
				let url = URL(string: urlString) else {
				throw RecipeManagerError.invalidURL
			}
			
			// fetch data from url
			let (data, response) = try await URLSession.shared.data(from: url)
			
			// validate data and response
			guard
				!data.isEmpty,
				let httpResponse = response as? HTTPURLResponse,
				httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
				throw RecipeManagerError.badServerResponse
			}
			
			// decode data into recipes array
			do {
				recipesData = try JSONDecoder().decode(AllRecipes.self, from: data)
			} catch {
				throw RecipeManagerError.malformedData
			}
			
			// ensure recipes array isn't empty
			guard
				!recipesData.recipes.isEmpty else {
				throw RecipeManagerError.emptyData
			}
			
			return recipesData.recipes
		} catch let error as RecipeManagerError {
			print("Error: \(error.localizedDescription)")
			throw error
		}
	}
}

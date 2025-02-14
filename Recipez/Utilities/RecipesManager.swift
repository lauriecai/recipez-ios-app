//
//  RecipeManager.swift
//  Recipez
//
//  Created by Laurie Cai on 2/12/25.
//

import Foundation

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

class RecipeManager {
	
	// Test URLs
	/*
	 All recipes:
	 https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json

	 Malformed data:
	 https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json
	 
	 Empty data:
	 https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json
	 */
	
	static let urlString = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json"
	
	static func getRecipes() async throws -> [Recipe] {
		do {
			// ensure valid url
			guard let url = URL(string: urlString)
			else {
				throw RecipeManagerError.invalidURL
			}
			
			// fetch data from url
			let (data, response) = try await URLSession.shared.data(from: url)
			
			// validate data and response
			guard
				!data.isEmpty,
				let httpResponse = response as? HTTPURLResponse,
				httpResponse.statusCode >= 200 && httpResponse.statusCode < 300
			else {
				throw RecipeManagerError.badServerResponse
			}
			
			// decode data into recipes array
			do {
				let recipesData = try JSONDecoder().decode(AllRecipes.self, from: data)
				guard !recipesData.recipes.isEmpty else { throw RecipeManagerError.emptyData }
				return recipesData.recipes
			} catch {
				throw RecipeManagerError.malformedData
			}
		} catch let error as RecipeManagerError {
			print("Error: \(error.localizedDescription)")
			throw error
		}
	}
}

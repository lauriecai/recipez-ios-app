//
//  RecipeDataService.swift
//  Recipez
//
//  Created by Laurie Cai on 2/12/25.
//

import Foundation

class RecipeDataService {
	
	let urlString = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
	
	func getRecipes() async throws -> [Recipe] {
		do {
			// ensure valid url
			guard let url = URL(string: urlString)
			else {
				throw URLError(.badURL)
			}
			
			// fetch data from url
			let (data, response) = try await URLSession.shared.data(from: url)
			
			// validate data and response
			guard
				!data.isEmpty,
				let httpResponse = response as? HTTPURLResponse,
				httpResponse.statusCode >= 200 && httpResponse.statusCode < 300
			else {
				throw URLError(.badServerResponse)
			}
			
			// decode data into recipes array
			let recipesData = try JSONDecoder().decode(AllRecipes.self, from: data)
			print(recipesData.recipes[0])
			return recipesData.recipes
		} catch {
			print("Error fetching recipes: \(error.localizedDescription)")
			throw error
		}
	}
}

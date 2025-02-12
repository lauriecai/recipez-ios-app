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
			guard let url = URL(string: urlString) else { throw URLError(.badURL)}
			let (data, response) = try await URLSession.shared.data(from: url)
			let recipes = try JSONDecoder().decode([Recipe].self, from: data)
			return recipes
		} catch {
			print("Error fetching recipes: \(error.localizedDescription)")
			throw error
		}
	}
}

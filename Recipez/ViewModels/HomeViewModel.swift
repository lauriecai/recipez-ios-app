//
//  HomeViewModel.swift
//  Recipez
//
//  Created by Laurie Cai on 2/11/25.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
	
	@Published var recipes: [Recipe] = []
	@Published var errorMessage: String? = nil
	let recipeService = RecipeDataService.shared
	
	init() {
		Task {
			await fetchRecipes()
		}
	}
	
	func fetchRecipes() async {
		do {
			let fetchedRecipes = try await recipeService.getRecipes()
			self.recipes = fetchedRecipes
		} catch {
			self.errorMessage = "Error loading recipes"
			print("Error: ", error.localizedDescription)
		}
	}
}

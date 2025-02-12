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
	
	private let recipeDataService = RecipeDataService()
	
	func fetchRecipes() async {
		do {
			let fetchedRecipes = try await recipeDataService.getRecipes()
			self.recipes = fetchedRecipes
		} catch {
			self.errorMessage = "Error loading recipes"
		}
	}
}

//
//  HomeViewModel.swift
//  Recipez
//
//  Created by Laurie Cai on 2/11/25.
//

import Foundation

class HomeViewModel: ObservableObject {
	
	@Published var recipes: [Recipe]? = nil
	@Published var errorMessage: String? = nil
	
	private let recipeDataService = RecipeDataService()
	
	func fetchRecipes() async {
		do {
			self.recipes = try await recipeDataService.getRecipes()
		} catch {
			self.errorMessage = "Error loading recipes"
		}
	}
}

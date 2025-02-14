//
//  HomeViewModel.swift
//  Recipez
//
//  Created by Laurie Cai on 2/11/25.
//

import Foundation
import UIKit

@MainActor
class HomeViewModel: ObservableObject {
	
	@Published var recipes: [Recipe] = []
	@Published var showFeedError: Bool = false
	let recipeDataService: RecipeDataService
	
	init(recipeDataService: RecipeDataService) {
		self.recipeDataService = recipeDataService
		Task {
			await fetchRecipes()
		}
	}
	
	func fetchRecipes() async {
		do {
			self.showFeedError = false
			let fetchedRecipes = try await recipeDataService.getRecipes()
			self.recipes = fetchedRecipes
			print("Recipes fetched")
		} catch {
			self.showFeedError = true
		}
	}}

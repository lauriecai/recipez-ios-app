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
	@Published var errorMessage: String? = nil
	
	init() {
		Task {
			await fetchRecipes()
		}
	}
	
	func fetchRecipes() async {
		do {
			let fetchedRecipes = try await RecipeManager.getRecipes()
			self.recipes = fetchedRecipes
		} catch {
			self.errorMessage = "Error loading recipes"
			print("Error: ", error.localizedDescription)
		}
	}}

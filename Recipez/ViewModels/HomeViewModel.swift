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
			self.showFeedError = true
			print("Error: ", error.localizedDescription)
		}
	}}

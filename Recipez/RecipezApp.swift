//
//  RecipezApp.swift
//  Recipez
//
//  Created by Laurie Cai on 2/11/25.
//

import SwiftUI

@main
struct RecipezApp: App {
	// Test URLs
	/*
	 All recipes:
	 https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json

	 Malformed data:
	 https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json
	 
	 Empty data:
	 https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json
	 */
	
    var body: some Scene {
        WindowGroup {
			HomeView(recipeDataService: RecipeDataService(url: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"))
        }
    }
}

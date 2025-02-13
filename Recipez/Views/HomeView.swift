//
//  HomeView.swift
//  Recipez
//
//  Created by Laurie Cai on 2/12/25.
//

import SwiftUI

struct HomeView: View {
	
	@StateObject private var viewModel = HomeViewModel()
	
	var body: some View {
		NavigationView {
			ScrollView(showsIndicators: false) {
				Image("image-background-cover")
					.resizable()
					.frame(maxWidth: .infinity)
					.aspectRatio(contentMode: .fit)
				recipesList
					.onAppear {
						Task {
							await viewModel.fetchRecipes()
						}
					}
			}
			.background(Color.white).ignoresSafeArea()
			.navigationTitle("All Recipes")
		}
		
	}
}

#Preview {
    HomeView()
}

extension HomeView {
	
	private var recipesList: some View {
		VStack {
			ForEach(viewModel.recipes) { recipe in
				RecipeCardView(recipe: recipe)
			}
		}
		.padding(.top, 10)
		.padding(.horizontal, 10)
	}
}

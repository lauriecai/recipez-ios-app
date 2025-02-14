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
		LazyVStack {
			ForEach(viewModel.recipes) { recipe in
				RecipeCardView(recipe: recipe)
			}
		}
		.padding(.top, 10)
		.padding(.horizontal, 10)
	}
}

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
			ZStack {
				Color.theme.backgroundPrimary.ignoresSafeArea()
				
				Group {
					if viewModel.showFeedError {
						errorMessage
					} else {
						ScrollView(showsIndicators: false) {
							recipesList
						}
					}
				}
			}
			.navigationTitle("All Recipes")
		}
	}
}

#Preview {
    HomeView()
}

extension HomeView {
	
	private var recipesList: some View {
		LazyVStack(spacing: 10) {
			ForEach(viewModel.recipes) { recipe in
				RecipeCardView(recipe: recipe)
			}
		}
		.padding(.top, 10)
		.padding(.horizontal, 20)
	}
	
	private var errorMessage: some View {
		VStack(alignment: .center, spacing: 10) {
			Image("baker")
				.resizable()
				.frame(width: 250, height: 250)
			Text("Error loading recipes")
				.font(.jaro(size: 20))
				.foregroundStyle(Color.theme.textPrimary)
			Text("Please try again later")
				.font(.inter(.medium, size: 14))
				.foregroundStyle(Color.theme.textSecondary)
		}
		.padding(.bottom, 80)
	}
}

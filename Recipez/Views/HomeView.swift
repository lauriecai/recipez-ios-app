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
		ScrollView(showsIndicators: false) {
			VStack(spacing: 5) {
				ForEach(viewModel.recipes) { recipe in
					RecipeCardView(recipe: recipe)
				}
			}
			.onAppear {
				Task {
					await viewModel.fetchRecipes()
				}
			}
		}
    }
}

#Preview {
    HomeView()
}

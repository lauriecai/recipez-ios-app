//
//  RecipeCardView.swift
//  Recipez
//
//  Created by Laurie Cai on 2/11/25.
//

import SwiftUI

struct RecipeCardView: View {
	
	let recipe = Recipe.example
	
    var body: some View {
		ZStack(alignment: .bottomLeading) {
			recipeImage
			recipeLabel
				.padding(.bottom, 30)
		}
    }
}

#Preview {
    RecipeCardView()
}

// MARK: - UI

extension RecipeCardView {
	private var recipeImage: some View {
		AsyncImage(url: URL(string: recipe.photoURLLarge)) { phase in
			switch phase {
			case .empty:
				ProgressView()
			case .success(let image):
				image
					.resizable()
					.frame(width: 350, height: 350, alignment: .center)
					.scaledToFill()
					.cornerRadius(20)
			case .failure(let error):
				Text("Failed to load image")
					.onAppear {
						print("Error loading image: \(error.localizedDescription)")
					}
			@unknown default:
				EmptyView()
			}
		}
	}
	
	private var recipeLabel: some View {
		VStack(alignment: .leading, spacing: 5) {
			Text(recipe.name)
				.font(.jaro(size: 18))
			HStack(spacing: 8) {
				Image("icon-location")
					.renderingMode(.template)
				Text(recipe.cuisine)
					.font(.inter(.medium, size: 14))
			}
			.foregroundStyle(Color.theme.colorAccentDarkYellow)
		}
		.padding(.horizontal, 20)
		.padding(.vertical, 8)
		.background(Color.theme.colorAccentYellow)
		.frame(maxWidth: 350, alignment: .leading)
		.fixedSize(horizontal: false, vertical: true)
	}
}

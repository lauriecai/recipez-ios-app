//
//  RecipeCardView.swift
//  Recipez
//
//  Created by Laurie Cai on 2/11/25.
//

import SwiftUI

struct RecipeCardView: View {
	
	@State private var imageLoaded: Bool = false
	
	let recipe: Recipe
	
    var body: some View {
		ZStack(alignment: .bottomLeading) {
			recipeImage
			if imageLoaded {
				recipeLabel
					.padding(.bottom, 30)
			}
		}
    }
}

#Preview {
	RecipeCardView(recipe: Recipe.example)
}

// MARK: - UI

extension RecipeCardView {
	
	private var recipeImage: some View {
		AsyncImage(url: URL(string: recipe.photoUrlLarge)) { phase in
			switch phase {
			case .empty:
				imagePlaceholder
			case .success(let image):
				image
					.resizable()
					.aspectRatio(1, contentMode: .fit)
					.frame(maxWidth: .infinity)
					.cornerRadius(20)
					.onAppear {
						imageLoaded = true
					}
			case .failure(_):
				ZStack(alignment: .center) {
					imagePlaceholder
					Text("Error loading image")
						.font(.inter(.bold, size: 20))
						.foregroundStyle(Color.black.opacity(0.25))
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
				.foregroundStyle(Color.theme.colorTextPrimary)
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
	
	private var imagePlaceholder: some View {
		RoundedRectangle(cornerRadius: 20, style: .continuous)
			.fill(Color.black.opacity(0.08))
			.frame(width: 350, height: 350)
	}
}

//
//  RecipeCardView.swift
//  Recipez
//
//  Created by Laurie Cai on 2/11/25.
//

import SwiftUI
import UIKit

struct RecipeCardView: View {
	
	@State private var imageLoaded: Bool = false
	
	let recipe: Recipe
	
    var body: some View {
		VStack(alignment: .leading, spacing: 10) {
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
		Group {
			if let cachedImage = ImageCacheService.shared.loadImage(id: recipe.id) {
				Image(uiImage: cachedImage)
					.resizable()
					.aspectRatio(1, contentMode: .fit)
					.frame(maxWidth: .infinity)
					.cornerRadius(20)
					.onAppear {
						imageLoaded = true
					}
			} else {
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
								if let image = image.asUIImage() {
									ImageCacheService.shared.cacheImage(image: image, id: recipe.id)
								}
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
		}
	}
	
	private var recipeLabel: some View {
		HStack(alignment: .firstTextBaseline) {
			Text(recipe.name)
				.font(.jaro(size: 20))
				.foregroundStyle(Color.theme.textPrimary)
				.lineLimit(2)
				.truncationMode(.tail)
			Spacer()
			HStack(spacing: 8) {
				Image("icon-location")
					.renderingMode(.template)
				Text(recipe.cuisine)
					.font(.inter(.medium, size: 14))
					.lineLimit(1)
					.truncationMode(.tail)
			}
			.foregroundStyle(Color.theme.textSecondary)
		}
	}
	
	private var imagePlaceholder: some View {
		RoundedRectangle(cornerRadius: 20, style: .continuous)
			.fill(Color.black.opacity(0.08))
			.frame(width: 350, height: 350)
	}
}

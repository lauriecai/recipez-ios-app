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
		ZStack {
			VStack(alignment: .leading) {
				Text(recipe.name)
					.font(.jaro(size: 24))
				Text(recipe.cuisine)
					.font(.inter(.bold, size: 16))
			}
		}
    }
}

#Preview {
    RecipeCardView()
}

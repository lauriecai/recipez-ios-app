//
//  Recipe.swift
//  Recipez
//
//  Created by Laurie Cai on 2/11/25.
//

// Recipes API info
/*
 URL:
 https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json
 
 JSON response:
 {
   "recipes": [
	 {
	   "cuisine": "Malaysian",
	   "name": "Apam Balik",
	   "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg",
	   "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
	   "source_url": "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ",
	   "uuid": "0c6ca6e7-e32a-4053-b824-1dbf749910d8",
	   "youtube_url": "https://www.youtube.com/watch?v=6R8ffRRJcrg"
	 },
	 {
	   "cuisine": "British",
	   "name": "Apple & Blackberry Crumble",
	   "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/large.jpg",
	   "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/small.jpg",
	   "source_url": "https://www.bbcgoodfood.com/recipes/778642/apple-and-blackberry-crumble",
	   "uuid": "599344f4-3c5c-4cca-b914-2210e3b3312f",
	   "youtube_url": "https://www.youtube.com/watch?v=4vhcOwVBDO4"
	 },
	 {
	   "cuisine": "British",
	   "name": "Apple Frangipan Tart",
	   "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/7276e9f9-02a2-47a0-8d70-d91bdb149e9e/large.jpg",
	   "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/7276e9f9-02a2-47a0-8d70-d91bdb149e9e/small.jpg",
	   "uuid": "74f6d4eb-da50-4901-94d1-deae2d8af1d1",
	   "youtube_url": "https://www.youtube.com/watch?v=rp8Slv4INLk"
	 }
 ]}
 */

struct Recipe: Identifiable, Codable {
	let id, name, cuisine, photoURLLarge: String
	let photoURLSmall: String?
	let sourceURL: String?
	let youtubeURL: String?
	
	enum CodingKeys: String, CodingKey {
		case id, name, cuisine
		case photoURLLarge = "photo_url_large"
		case photoURLSmall = "photo_url_small"
		case sourceURL = "source_url"
		case youtubeURL = "youtube_url"
	}
	
	static let example = Recipe(id: "1", name: "Peking Duck", cuisine: "Chinese", photoURLLarge: "https://miro.medium.com/v2/resize:fit:1400/format:webp/1*nfaPwEk8lGpdK3l0ZZYMmw.jpeg", photoURLSmall: nil, sourceURL: nil, youtubeURL: nil)
}

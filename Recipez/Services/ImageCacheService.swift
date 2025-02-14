//
//  ImageCacheService.swift
//  Recipez
//
//  Created by Laurie Cai on 2/13/25.
//

import Foundation
import SwiftUI

class ImageCacheService {
	
	static let shared = ImageCacheService()
	
	init() {
		createFolderIfNeeded()
	}
	
	func createFolderIfNeeded() {
		guard
			let path = FileManager
				.default
				.urls(for: .cachesDirectory, in: .userDomainMask)
				.first?
				.appendingPathComponent("recipez_images")
				.path else { return }
		
		if !FileManager.default.fileExists(atPath: path) {
			do {
				try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true)
				print("Folder created")
			} catch let error {
				print("Error creating folder. \(error)")
			}
		}
	}
	
	func saveImage(image: UIImage, id: String) {
		DispatchQueue.global(qos: .background).async {
			guard
				let data = image.jpegData(compressionQuality: 1.0),
				let path = self.getPathForImage(id: id) else {
				print("Error saving image")
				return
			}
			
			do {
				try data.write(to: path)
			} catch {
				print("Error caching image: ", error.localizedDescription)
			}
		}
	}
	
	func loadImage(id: String) -> UIImage? {
		guard
			let path = getPathForImage(id: id)?.path,
			FileManager.default.fileExists(atPath: path) else {
			print("Error loading image")
			return nil
		}
		
		return UIImage(contentsOfFile: path)
	}
	
	private func getPathForImage(id: String) -> URL? {
		guard let path = FileManager
			.default
			.urls(for: .cachesDirectory, in: .userDomainMask)
			.first?
			.appendingPathComponent("recipez_images")
			.appendingPathComponent("\(id).jpg") else {
			print("Unable to find image path")
			return nil
		}
		return path
	}
}

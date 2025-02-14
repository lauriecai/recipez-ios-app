//
//  Image.swift
//  Recipez
//
//  Created by Laurie Cai on 2/13/25.
//

import SwiftUI
import UIKit

extension Image {
	func asUIImage() -> UIImage? {
		let controller = UIHostingController(rootView: self)
		let view = controller.view
		
		// Use a reasonable target size, let's assume 300x300 for now
		let targetSize = CGSize(width: 300, height: 300)
		
		// Ensure the view is in place before drawing
		view?.bounds = CGRect(origin: .zero, size: targetSize)
		
		let renderer = UIGraphicsImageRenderer(size: targetSize)
		
		return renderer.image { context in
			view?.drawHierarchy(in: context.format.bounds, afterScreenUpdates: true)
		}
	}
}

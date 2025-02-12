//
//  Font.swift
//  Recipez
//
//  Created by Laurie Cai on 2/11/25.
//

import Foundation
import SwiftUI

extension Font {
	
	enum InterFont {
		case medium, bold
		
		var value: String {
			switch self {
			case .medium:
				return "Inter-Regular_Medium"
			case .bold:
				return "Inter-Regular_Bold"
			}
		}
	}
	
	static func jaro(_ type: String = "Jaro-Regular", size: CGFloat) -> Font {
		return .custom(type, size: size)
	}
	
	static func inter(_ type: InterFont, size: CGFloat) -> Font {
		return .custom(type.value, size: size)
	}
	
	// usage examples
	/*
	 .font(.jaro(size: 24))
	 .font(.inter(.bold, size: 16))
	 */
}

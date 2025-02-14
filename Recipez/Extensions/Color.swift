//
//  Color.swift
//  Recipez
//
//  Created by Laurie Cai on 2/11/25.
//

import Foundation
import SwiftUI

extension Color {
	static let theme = ColorTheme()
}

struct ColorTheme {
	let textPrimary = Color("color-text-primary")
	let textSecondary = Color("color-text-secondary")
	let backgroundPrimary = Color("color-background-primary")
	let accentYellow = Color("color-accent-yellow")
	let accentDarkYellow = Color("color-accent-dark-yellow")
	let accentRed = Color("color-accent-red")
}

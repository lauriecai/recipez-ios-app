//
//  DataService.swift
//  Recipez
//
//  Created by Laurie Cai on 2/15/25.
//

import Foundation

protocol DataService {
	func getRecipes() async throws -> [Recipe]
}

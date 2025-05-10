//
//  Recipe.swift
//  Filburam
//
//  Created by Joseph Dizon on 5/5/25.
//

import Foundation

struct Recipe: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var cuisine: String
    var imageName: String
    var ingredients: [String]
    var instructions: [String]
}

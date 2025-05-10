//
//  FavoritesManager.swift
//  Filburam
//
//  Created by Joseph Dizon on 5/5/25.
//

import SwiftUI

class FavoritesManager: ObservableObject {
    @Published var favorites: [Recipe] = []

    func isFavorite(_ recipe: Recipe) -> Bool {
        return favorites.contains { $0.id == recipe.id }
    }

    func toggleFavorite(_ recipe: Recipe) {
        if isFavorite(recipe) {
            removeFavorite(recipe)
        } else {
            addFavorite(recipe)
        }
    }

    func addFavorite(_ recipe: Recipe) {
        favorites.append(recipe)
    }

    func removeFavorite(_ recipe: Recipe) {
        favorites.removeAll { $0.id == recipe.id }
    }
}

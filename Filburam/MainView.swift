//
//  MainView.swift
//  Filburam
//
//  Created by Joseph Dizon on 5/9/25.
//

import SwiftUI

struct MainView: View {
    @State private var selectedScreen: AppScreen = .home

    var body: some View {
        VStack(spacing: 0) {
            switch selectedScreen {
            case .home:
                ContentView(selectedScreen: $selectedScreen)
            case .favorites:
                FavoritesView(selectedScreen: $selectedScreen)
            case .profile:
                ProfileView(selectedScreen: $selectedScreen)
            case .categories:
                CategoryView(selectedScreen: $selectedScreen)
            case .filipinoList:
                RecipeListView(cuisine: "Filipino", selectedScreen: $selectedScreen)
            case .burmeseList:
                RecipeListView(cuisine: "Burmese", selectedScreen: $selectedScreen)
            case .comingSoon(let category):
                ComingSoonView(category: category, selectedScreen: $selectedScreen)
            case .recipeDetail(let recipe):
                RecipeDetailView(recipe: recipe, selectedScreen: $selectedScreen)
            }
        }
    }
}


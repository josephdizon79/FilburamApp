//
//  RecipeDetailView.swift
//  Filburam
//
//  Created by Joseph Dizon on 5/5/25.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    @EnvironmentObject var favoritesManager: FavoritesManager
    @EnvironmentObject var session: UserSession
    @Binding var selectedScreen: AppScreen
    @State private var isMenuOpen = false

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                VStack(spacing: 0) {
                    HStack {
                        Image("FilBuramLogo").resizable().frame(width: 32, height: 32)
                        Spacer()
                        Text("FilBuram").font(.headline).fontWeight(.bold)
                        Spacer()
                        Button(action: { isMenuOpen.toggle() }) {
                            Image("Line3Horizontal").resizable().frame(width: 24, height: 24)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    .padding(.bottom, 5)

                    Divider()
                    TabBarView(selectedScreen: $selectedScreen)
                    Divider()
                }

                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Image(recipe.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .clipped()
                            .cornerRadius(10)
                            .padding(.horizontal)

                        Text(recipe.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .center)

                        Text("Ingredients").font(.headline).padding(.horizontal)

                        HStack(alignment: .top) {
                            VStack(alignment: .leading, spacing: 4) {
                                ForEach(recipe.ingredients.prefix(recipe.ingredients.count / 2), id: \.self) { item in
                                    Text("• \(item)")
                                }
                            }
                            VStack(alignment: .leading, spacing: 4) {
                                ForEach(recipe.ingredients.suffix(recipe.ingredients.count / 2), id: \.self) { item in
                                    Text("• \(item)")
                                }
                            }
                        }
                        .padding(.horizontal)

                        Text("Instructions").font(.headline).padding(.horizontal)

                        VStack(alignment: .leading, spacing: 4) {
                            ForEach(Array(recipe.instructions.enumerated()), id: \.offset) { index, step in
                                Text("\(index + 1). \(step)")
                            }
                        }
                        .padding(.horizontal)

                        Button(action: {
                            favoritesManager.toggleFavorite(recipe)
                        }) {
                            HStack {
                                Image(systemName: favoritesManager.isFavorite(recipe) ? "heart.fill" : "heart")
                                    .foregroundColor(favoritesManager.isFavorite(recipe) ? .red : .white)
                                Text("Save to Favorites")
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 60)
                    }
                }
            }

            if isMenuOpen {
                HamburgerMenu(
                    onClose: { isMenuOpen = false },
                    onLogout: {
                        session.logout()
                        isMenuOpen = false
                    }
                )
                .transition(.move(edge: .trailing))
                .zIndex(1)
            }
        }
    }
}

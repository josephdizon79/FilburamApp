//
//  FavoritesView.swift
//  Filburam
//
//  Created by Joseph Dizon on 5/5/25.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager
    @EnvironmentObject var session: UserSession
    @Binding var selectedScreen: AppScreen
    @State private var isMenuOpen = false

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                // Header + TabBarView
                VStack(spacing: 0) {
                    HStack {
                        Image("FilBuramLogo")
                            .resizable()
                            .frame(width: 32, height: 32)

                        Spacer()

                        Text("FilBuram")
                            .font(.headline)
                            .fontWeight(.bold)

                        Spacer()

                        Button(action: {
                            isMenuOpen.toggle()
                        }) {
                            Image("Line3Horizontal")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    .padding(.bottom, 5)

                    Divider()
                    TabBarView(selectedScreen: $selectedScreen)
                    Divider()
                }

                if favoritesManager.favorites.isEmpty {
                    Spacer()
                    Text("Favorites")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("Your favorite recipes will appear here.")
                        .foregroundColor(.gray)
                    Spacer()
                } else {
                    List {
                        ForEach(favoritesManager.favorites) { recipe in
                            HStack {
                                NavigationLink(destination: RecipeDetailView(recipe: recipe, selectedScreen: $selectedScreen)) {
                                    HStack {
                                        Image(recipe.imageName)
                                            .resizable()
                                            .frame(width: 60, height: 60)
                                            .cornerRadius(8)
                                        Text(recipe.name)
                                            .font(.headline)
                                    }
                                }
                                Spacer(minLength: 20)
                                Button(action: {
                                    favoritesManager.removeFavorite(recipe)
                                }) {
                                    Text("Remove")
                                        .font(.caption)
                                        .foregroundColor(.red)
                                }
                                .buttonStyle(BorderlessButtonStyle())
                            }
                            .contentShape(Rectangle())
                            .padding(.vertical, 4)
                        }
                    }
                    .listStyle(PlainListStyle())
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
        .navigationBarTitleDisplayMode(.inline)
    }
}

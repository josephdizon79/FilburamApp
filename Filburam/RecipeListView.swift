//
//  RecipeListView.swift
//  Filburam
//
//  Created by Joseph Dizon on 5/5/25.
//

import SwiftUI

struct RecipeListView: View {
    let cuisine: String
    @Binding var selectedScreen: AppScreen
    @EnvironmentObject var session: UserSession
    @State private var isMenuOpen = false

    var filteredRecipes: [Recipe] {
        sampleRecipes.filter { $0.cuisine == cuisine }
    }

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

                List(filteredRecipes) { recipe in
                    Button(action: { selectedScreen = .recipeDetail(recipe) }) {
                        HStack {
                            Image(recipe.imageName).resizable().frame(width: 60, height: 60).cornerRadius(8)
                            Text(recipe.name).font(.headline)
                        }
                        .padding(.vertical, 4)
                    }
                }
                .listStyle(PlainListStyle())
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

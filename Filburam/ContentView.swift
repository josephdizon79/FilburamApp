//
//  ContentView.swift
//  Filburam
//
//  Created by Joseph Dizon on 5/5/25.
//

import SwiftUI

struct FeaturedRecipe: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
}

struct ContentView: View {
    @Binding var selectedScreen: AppScreen
    @EnvironmentObject var session: UserSession
    @State private var isMenuOpen = false

    let featuredRecipes = [
        FeaturedRecipe(title: "Pork Adobo", imageName: "PorkAdobo"),
        FeaturedRecipe(title: "Lumpia", imageName: "Lumpia"),
        FeaturedRecipe(title: "Mohinga", imageName: "Mohinga")
    ]

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
                    VStack(spacing: 16) {
                        Text("Discover Recipes by Cuisine").font(.subheadline).foregroundColor(.gray)

                        TabView {
                            ForEach(featuredRecipes) { recipe in
                                VStack(spacing: 5) {
                                    Text(recipe.title).font(.headline)
                                    Image(recipe.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(height: 200)
                                        .clipped()
                                        .cornerRadius(10)
                                }
                                .padding(.horizontal)
                            }
                        }
                        .frame(height: 240)
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))

                        Button(action: { selectedScreen = .filipinoList }) {
                            HStack {
                                Image("PhilippinesLogo").resizable().frame(width: 40, height: 24).cornerRadius(4)
                                Text("Filipino Cuisine").font(.headline)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }

                        Button(action: { selectedScreen = .burmeseList }) {
                            HStack {
                                Image("MyanmarLogo").resizable().frame(width: 40, height: 24).cornerRadius(4)
                                Text("Burmese Cuisine").font(.headline)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }

                        Button(action: { selectedScreen = .categories }) {
                            HStack {
                                Image(systemName: "square.grid.2x2")
                                Text("View Categories").font(.headline)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                    }
                    .padding()
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

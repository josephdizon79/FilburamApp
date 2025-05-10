//
//  CategoryView.swift
//  Filburam
//
//  Created by Joseph Dizon on 5/5/25.
//

import SwiftUI

struct CategoryView: View {
    @Binding var selectedScreen: AppScreen
    @EnvironmentObject var session: UserSession
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

                VStack(spacing: 16) {
                    Text("Recipe Categories")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 10)

                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        Button(action: {
                            selectedScreen = .filipinoList
                        }) {
                            CategoryTile(image: "PhilippinesLogo", label: "Filipino Cuisine")
                        }

                        Button(action: {
                            selectedScreen = .burmeseList
                        }) {
                            CategoryTile(image: "MyanmarLogo", label: "Burmese Cuisine")
                        }

                        Button(action: {
                            selectedScreen = .comingSoon("Seafood")
                        }) {
                            CategoryTile(image: "Seafood", label: "Seafood")
                        }

                        Button(action: {
                            selectedScreen = .comingSoon("Vegetarian")
                        }) {
                            CategoryTile(image: "Vegetarian", label: "Vegetarian")
                        }

                        Button(action: {
                            selectedScreen = .comingSoon("Asian Desserts")
                        }) {
                            CategoryTile(image: "Desserts", label: "Asian Desserts")
                        }
                    }
                    .padding(.horizontal)
                }

                Spacer()
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

struct CategoryTile: View {
    var image: String
    var label: String

    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.white)
                    .frame(width: 80, height: 80)
                    .shadow(radius: 2)
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
            }
            Text(label)
                .font(.subheadline)
                .multilineTextAlignment(.center)
        }
    }
}

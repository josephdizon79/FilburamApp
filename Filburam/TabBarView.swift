//
//  TabBarView.swift
//  Filburam
//
//  Created by Joseph Dizon on 5/5/25.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selectedScreen: AppScreen

    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                selectedScreen = .home
            }) {
                VStack {
                    Image(systemName: "house")
                    Text("Home")
                }
            }
            Spacer()
            Button(action: {
                selectedScreen = .categories
            }) {
                VStack {
                    Image(systemName: "square.grid.2x2")
                    Text("Categories")
                }
            }
            Spacer()
            Button(action: {
                selectedScreen = .favorites
            }) {
                VStack {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
            }
            Spacer()
            Button(action: {
                selectedScreen = .profile
            }) {
                VStack {
                    Image(systemName: "person")
                    Text("Profile")
                }
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .shadow(radius: 2)
    }
}

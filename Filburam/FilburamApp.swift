//
//  FilburamApp.swift
//  Filburam
//
//  Created by Joseph Dizon on 5/5/25.
//

import SwiftUI

@main
struct FilburamApp: App {
    @StateObject var session = UserSession()
    @StateObject var favoritesManager = FavoritesManager()
    @StateObject var languageManager = LanguageManager()

    var body: some Scene {
        WindowGroup {
            if session.isLoggedIn {
                MainView()
                    .environmentObject(session)
                    .environmentObject(favoritesManager)
                    .environmentObject(languageManager)
            } else {
                LoginView()
                    .environmentObject(session)
                    .environmentObject(languageManager)
            }
        }
    }
}

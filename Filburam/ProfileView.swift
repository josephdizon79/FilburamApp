//
//  ProfileView.swift
//  Filburam
//
//  Created by Joseph Dizon on 5/5/25.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var session: UserSession
    @EnvironmentObject var languageManager: LanguageManager
    @Binding var selectedScreen: AppScreen
    @State private var isMenuOpen = false

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                VStack(spacing: 0) {
                    HStack {
                        Image("FilBuramLogo")
                            .resizable()
                            .frame(width: 40, height: 40)
                        Spacer()
                        Text("FilBuram")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                        Button(action: {
                            isMenuOpen.toggle()
                        }) {
                            Image("Line3Horizontal")
                                .resizable()
                                .frame(width: 28, height: 28)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    .padding(.bottom, 5)

                    Divider()

                    // ✅ This ensures the top nav bar shows like on other screens
                    TabBarView(selectedScreen: $selectedScreen)

                    Divider()
                }

                VStack(alignment: .leading, spacing: 12) {
                    Text(localized("user_profile", lang: languageManager.selectedLanguage))
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom, 10)

                    Text("\(localized("name", lang: languageManager.selectedLanguage)): Admin")
                    Text("\(localized("diet", lang: languageManager.selectedLanguage)): None")
                    Text("\(localized("saved", lang: languageManager.selectedLanguage)): Synced")

                    Text(localized("language", lang: languageManager.selectedLanguage))
                        .padding(.top)

                    Picker("Language", selection: $languageManager.selectedLanguage) {
                        Text("None").tag("none")
                        Text("English").tag("en")
                        Text("Tagalog").tag("tl")
                        Text("Burmese").tag("my")
                    }
                    .pickerStyle(SegmentedPickerStyle())

                    Spacer()

                    Button(action: {
                        session.logout()
                    }) {
                        Text(localized("logout", lang: languageManager.selectedLanguage))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
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

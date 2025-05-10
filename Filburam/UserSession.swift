//
//  UserSession.swift
//  Filburam
//
//  Created by Joseph Dizon on 5/5/25.
//

import SwiftUI

class UserSession: ObservableObject {
    @Published var isLoggedIn: Bool {
        didSet {
            UserDefaults.standard.set(isLoggedIn, forKey: "isLoggedIn")
        }
    }

    @Published var username: String {
        didSet {
            UserDefaults.standard.set(username, forKey: "username")
        }
    }

    init() {
        self.isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
        self.username = UserDefaults.standard.string(forKey: "username") ?? ""
    }

    func login(user: String, password: String) -> Bool {
        let savedUser = UserDefaults.standard.string(forKey: "saved_username") ?? ""
        let savedPass = UserDefaults.standard.string(forKey: "saved_password") ?? ""

        if user == savedUser && password == savedPass {
            username = user
            isLoggedIn = true
            return true
        }

        return false
    }

    func logout() {
        isLoggedIn = false
        username = ""
    }
}

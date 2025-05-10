//
//  SignUpView.swift
//  Filburam
//
//  Created by Joseph Dizon on 5/5/25.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var session: UserSession
    @Binding var showSignUp: Bool

    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var errorMessage = ""

    var body: some View {
        VStack(spacing: 0) {
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
                }
                .padding(.horizontal)
                .padding(.top, 10)
                .padding(.bottom, 5)
                Divider()
            }

            Spacer()

            VStack(spacing: 20) {
                Text("Sign Up")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                TextField("Email", text: $email)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)

                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)

                SecureField("Confirm Password", text: $confirmPassword)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)

                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.caption)
                }

                Button(action: {
                    if email.isEmpty || password.isEmpty || confirmPassword.isEmpty {
                        errorMessage = "All fields are required."
                    } else if password != confirmPassword {
                        errorMessage = "Passwords do not match."
                    } else {
                        UserDefaults.standard.set(email, forKey: "saved_username")
                        UserDefaults.standard.set(password, forKey: "saved_password")
                        _ = session.login(user: email, password: password)
                        showSignUp = false
                    }
                }) {
                    Text("Create Account")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Button("Cancel") {
                    showSignUp = false
                }
                .foregroundColor(.gray)
                .padding(.top, 10)
            }
            .padding()

            Spacer()
        }
    }
}

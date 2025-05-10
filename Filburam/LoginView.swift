//
//  LoginView.swift
//  Filburam
//
//  Created by Joseph Dizon on 5/5/25.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var session: UserSession
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var showSignUp = false
    @State private var showPassword = false

    var body: some View {
        if showSignUp {
            SignUpView(showSignUp: $showSignUp)
        } else {
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
                        Image("Line3Horizontal")
                            .resizable()
                            .frame(width: 28, height: 28)
                            .opacity(0)
                    }
                    .padding(.horizontal)
                    .padding(.top, 12)
                    .padding(.bottom, 8)
                    Divider()
                }

                Spacer()

                VStack(spacing: 20) {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.gray)

                    Text("LOGIN")
                        .font(.title)
                        .fontWeight(.bold)

                    TextField("Username or Email", text: $email)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.5))
                        )

                    ZStack(alignment: .trailing) {
                        Group {
                            if showPassword {
                                TextField("Password", text: $password)
                            } else {
                                SecureField("Password", text: $password)
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.5))
                        )

                        Button(action: {
                            showPassword.toggle()
                        }) {
                            Image(systemName: showPassword ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                        }
                        .padding(.trailing, 12)
                    }

                    if !errorMessage.isEmpty {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.caption)
                    }

                    Button(action: {
                        if email.isEmpty || password.isEmpty {
                            errorMessage = "Email and password are required."
                        } else if session.login(user: email, password: password) {
                            errorMessage = ""
                        } else {
                            errorMessage = "Invalid email or password."
                        }
                    }) {
                        Text("LOG IN")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                    Text("Don't have an account?")
                        .font(.footnote)
                        .foregroundColor(.gray)

                    Button("SIGN UP") {
                        showSignUp = true
                    }
                    .font(.headline)
                    .foregroundColor(.blue)
                }
                .padding(.horizontal)
                .padding(.bottom)

                Spacer()
            }
            .background(Color(UIColor.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        }
    }
}

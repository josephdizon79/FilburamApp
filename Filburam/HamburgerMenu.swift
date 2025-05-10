//
//  HamburgerMenu.swift
//  Filburam
//
//  Created by Joseph Dizon on 5/5/25.
//

import SwiftUI

struct HamburgerMenu: View {
    var onClose: () -> Void
    var onLogout: () -> Void

    var body: some View {
        VStack {
            HStack {
                Spacer()
                VStack(alignment: .trailing, spacing: 12) {
                    Button(action: {
                        onLogout()
                    }) {
                        Text("Logout")
                            .font(.headline)
                            .foregroundColor(.red)
                    }

                    Button(action: {
                        onClose()
                    }) {
                        Text("Close")
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
                }
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .shadow(radius: 5)
                .padding(.top, 60)
                .padding(.trailing, 16)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

//
//  CarouselView.swift
//  Filburam
//
//  Created by Joseph Dizon on 5/5/25.
//

import SwiftUI

struct CarouselView: View {
    let featuredRecipes: [Recipe] = sampleRecipes.prefix(3).map { $0 }

    var body: some View {
        TabView {
            ForEach(featuredRecipes) { recipe in
                VStack(spacing: 8) {
                    Image(recipe.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 180)
                        .cornerRadius(10)
                    Text(recipe.name)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 240)
    }
}


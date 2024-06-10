//
//  FavoritesView.swift
//  About Me
//
//  Created by Dawei Hao on 2024/6/10.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        VStack {
            Text("Favorites")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 40)
            
            // HStack for hobbies
            Text("Hobbies")
                .font(.title2)
            
            HStack {
                ForEach(information.hobbies, id: \.self) { hobby in
                    Image(systemName: hobby)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 80, maxHeight: 60)
                }
                .padding()
            }
            .padding()
            
            // HStack for Foods
            Text("Foods")
                .font(.title2)
            
            HStack(spacing: 60) {
                ForEach(information.foods, id: \.self) { food in
                    Text(food)
                        .font(.system(size: 48))
                }
            }
            .padding()
            
            // HStack for color
            HStack(spacing: 30) {
                ForEach(information.colors, id: \.self) { Color in
                    Color
                        .frame(width: 70, height: 70)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

#Preview {
    FavoritesView()
}

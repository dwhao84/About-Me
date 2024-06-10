//
//  HomeView.swift
//  About Me
//
//  Created by Dawei Hao on 2024/6/10.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        VStack {
            Text("All About")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Image(information.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(150)
                .padding(40)
            
            Text(information.name)
                .font(.title)
        }
    }
}

#Preview {
    HomeView()
}

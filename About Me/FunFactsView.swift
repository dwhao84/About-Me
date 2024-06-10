//
//  FunFactsView.swift
//  About Me
//
//  Created by Dawei Hao on 2024/6/10.
//

import SwiftUI

struct FunFactsView: View {
    
    @State private var funFact: String = ""
    
    var body: some View {
        VStack {
            Text("Fun Facts")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(funFact)
                .padding()
                .font(.title)
                .frame(minHeight: 400)
            
            Button("Show Random Fact") {
                funFact = information.funFacts.randomElement()!
            }
        }
        .padding()
    }
}

#Preview {
    FunFactsView()
}

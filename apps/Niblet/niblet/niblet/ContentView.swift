//
//  ContentView.swift
//  niblet
//
//  Created by Leonardo Siu on 6/26/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("niblet")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("a tiny AI palette for your mac")
                .font(.subheadline)
                .foregroundColor(.secondary)

            Divider()

            Text("Next up: build the main app shell.")
                .font(.headline)

            Text("This window will eventually show History, Nibbles, and Settings.")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

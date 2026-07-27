//
//  ContentView.swift
//  niblet
//
//  Created by Leonardo Siu on 6/26/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Niblet")
                .font(.largeTitle)
                .fontWeight(.semibold)

            Text("Available Nibbles")
                .foregroundStyle(.secondary)

            ForEach(NibbleAction.samples) { nibble in
                VStack(alignment: .leading, spacing: 4) {
                    Text(nibble.title)
                        .fontWeight(.semibold)

                    Text(nibble.description)
                        .foregroundStyle(.secondary)
                }
                .padding(.vertical, 4)
            }
        }
        .padding(32)
        .frame(minWidth: 520, minHeight: 320)
    }
}

#Preview {
    ContentView()
}
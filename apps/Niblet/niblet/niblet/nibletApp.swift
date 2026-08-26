//
//  nibletApp.swift
//  niblet
//
//  Created by Leonardo Siu on 6/26/26.
//

import SwiftUI

@main
struct nibletApp: App {
    @StateObject private var appState = NibletAppState()

    var body: some Scene {
        WindowGroup {
            MainWindowView()
                .environmentObject(appState)
        }

        Window("Niblet Palette", id: "palette") {
            PaletteWindowView()
                .environmentObject(appState)
        }
        .defaultSize(width: 520, height: 420)
        .windowResizability(.contentSize)
    }
}

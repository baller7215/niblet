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
            ContentView()
                .environmentObject(appState)
        }
    }
}

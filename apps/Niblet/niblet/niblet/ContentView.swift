import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var appState: NibletAppState

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Niblet")
                .font(.largeTitle)
                .fontWeight(.semibold)

            Text("A tiny AI palette for your Mac.")
                .foregroundStyle(.secondary)

            Divider()

            Text("Current Input")
                .font(.headline)

            Text(appState.currentInputText)
                .foregroundStyle(.secondary)

            Divider()

            Text("Available Nibbles")
                .font(.headline)

            ForEach(appState.availableNibbles) { nibble in
                Button(nibble.title) {
                    appState.selectNibble(nibble)
                }
            }

            if let selectedNibble = appState.selectedNibble {
                Divider()

                Text("Selected Nibble")
                    .font(.headline)

                Text(selectedNibble.title)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(32)
        .frame(minWidth: 520, minHeight: 420)
    }
}

#Preview {
    ContentView()
        .environmentObject(NibletAppState())
}
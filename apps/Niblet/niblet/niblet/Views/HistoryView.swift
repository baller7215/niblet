import SwiftUI

struct HistoryView: View {
    @EnvironmentObject private var appState: NibletAppState

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("History")
                .font(.largeTitle)
                .fontWeight(.semibold)

            Text("Completed Nibbles will appear here as Crumbs.")
                .foregroundStyle(.secondary)

            if appState.crumbs.isEmpty {
                ContentUnavailableView(
                    "No Crumbs Yet",
                    systemImage: "tray",
                    description: Text("Run a Nibble to save your first result.")
                )
            } else {
                List(appState.crumbs) { crumb in
                    VStack(alignment: .leading, spacing: 6) {
                        Text(crumb.nibbleTitle)
                            .fontWeight(.semibold)

                        Text(crumb.responseText)
                            .foregroundStyle(.secondary)
                            .lineLimit(2)

                        Text(crumb.createdAt.formatted(date: .abbreviated, time: .shortened))
                            .font(.caption)
                            .foregroundStyle(.tertiary)
                    }
                    .padding(.vertical, 6)
                }
            }

            Spacer()
        }
        .padding(24)
    }
}

#Preview {
    HistoryView()
        .environmentObject(NibletAppState())
}
import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Settings")
                .font(.largeTitle)
                .fontWeight(.semibold)

            Text("Niblet settings will live here later.")
                .foregroundStyle(.secondary)

            GroupBox("Planned Settings") {
                VStack(alignment: .leading, spacing: 12) {
                    Label("Global shortcut", systemImage: "keyboard")
                    Label("AI provider", systemImage: "brain")
                    Label("Privacy and local-first options", systemImage: "lock")
                    Label("Custom Nibbles", systemImage: "slider.horizontal.3")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 4)
            }

            Spacer()
        }
        .padding(24)
    }
}

#Preview {
    SettingsView()
}
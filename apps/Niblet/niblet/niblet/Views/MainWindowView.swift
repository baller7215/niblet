import SwiftUI

struct MainWindowView: View {
    @State private var selectedSection: MainWindowSection? = .history

    var body: some View {
        NavigationSplitView {
            List(MainWindowSection.allCases, selection: $selectedSection) { section in
                Label(section.title, systemImage: section.systemImage)
                    .tag(section)
            }
            .navigationTitle("Niblet")
        } detail: {
            switch selectedSection {
            case .history:
                HistoryView()
            case .nibbles:
                NibblesView()
            case .settings:
                SettingsView()
            case .none:
                ContentUnavailableView(
                    "Choose a Section",
                    systemImage: "sidebar.left",
                    description: Text("Select a section from the sidebar.")
                )
            }
        }
        .frame(minWidth: 760, minHeight: 480)
    }
}

private enum MainWindowSection: String, CaseIterable, Identifiable {
    case history
    case nibbles
    case settings

    var id: String {
        rawValue
    }

    var title: String {
        switch self {
        case .history:
            return "History"
        case .nibbles:
            return "Nibbles"
        case .settings:
            return "Settings"
        }
    }

    var systemImage: String {
        switch self {
        case .history:
            return "clock"
        case .nibbles:
            return "square.grid.2x2"
        case .settings:
            return "gearshape"
        }
    }
}

#Preview {
    MainWindowView()
        .environmentObject(NibletAppState())
}
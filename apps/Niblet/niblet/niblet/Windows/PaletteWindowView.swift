import SwiftUI

struct PaletteWindowView: View {
    @EnvironmentObject private var appState: NibletAppState

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            header

            inputPreview

            nibbleGrid

            Spacer(minLength: 0)
        }
        .padding(20)
        .frame(width: 520, height: 420)
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Niblet")
                .font(.title2)
                .fontWeight(.semibold)

            Text("Choose a Nibble")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }

    private var inputPreview: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Input")
                .font(.headline)

            Text(appState.currentInputText.isEmpty ? "No input selected yet." : appState.currentInputText)
                .font(.body)
                .foregroundStyle(appState.currentInputText.isEmpty ? .secondary : .primary)
                .lineLimit(4)
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.quaternary.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }

    private var nibbleGrid: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Nibbles")
                .font(.headline)

            LazyVGrid(columns: [GridItem(.adaptive(minimum: 140))], spacing: 10) {
                ForEach(appState.availableNibbles) { nibble in
                    Button {
                        appState.selectedNibble = nibble
                        print("Selected Nibble: \(nibble.title)")
                    } label: {
                        VStack(alignment: .leading, spacing: 6) {
                            Text(nibble.title)
                                .fontWeight(.semibold)

                            Text(nibble.description)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .lineLimit(2)
                                .multilineTextAlignment(.leading)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(10)
                    }
                    .buttonStyle(.bordered)
                }
            }
        }
    }
}

#Preview {
    PaletteWindowView()
        .environmentObject(NibletAppState())
}
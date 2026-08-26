import SwiftUI

struct NibblesView: View {
    @EnvironmentObject private var appState: NibletAppState

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Nibbles")
                .font(.largeTitle)
                .fontWeight(.semibold)

            Text("Bite-sized actions you can run from the floating palette.")
                .foregroundStyle(.secondary)

            LazyVGrid(columns: [GridItem(.adaptive(minimum: 180))], spacing: 12) {
                ForEach(appState.availableNibbles) { nibble in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(nibble.title)
                            .fontWeight(.semibold)

                        Text(nibble.description)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, minHeight: 96, alignment: .topLeading)
                    .background(.quaternary.opacity(0.4))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }

            Spacer()
        }
        .padding(24)
    }
}

#Preview {
    NibblesView()
        .environmentObject(NibletAppState())
}
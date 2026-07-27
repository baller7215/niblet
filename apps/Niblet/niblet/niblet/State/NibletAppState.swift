import Foundation

@MainActor
final class NibletAppState: ObservableObject {
    @Published var currentInputText: String = """
    Niblet is a tiny AI palette for your Mac. Select text, press a shortcut, and choose a bite-sized action.
    """

    @Published var selectedNibble: NibbleAction?
    @Published var responseText: String = ""
    @Published var isGenerating: Bool = false
    @Published var crumbs: [Crumb] = []

    let availableNibbles: [NibbleAction] = NibbleAction.samples

    func selectNibble(_ nibble: NibbleAction) {
        selectedNibble = nibble
        responseText = ""
    }

    func updateInputText(_ text: String) {
        currentInputText = text
    }

    func startGenerating() {
        isGenerating = true
        responseText = ""
    }

    func finishGenerating(response: String) {
        responseText = response
        isGenerating = false

        guard let selectedNibble else {
            return
        }

        let crumb = Crumb(
            inputText: currentInputText,
            nibbleID: selectedNibble.id,
            nibbleTitle: selectedNibble.title,
            responseText: response
        )

        crumbs.insert(crumb, at: 0)
    }

    func clearResponse() {
        selectedNibble = nil
        responseText = ""
        isGenerating = false
    }

    func clearHistory() {
        crumbs.removeAll()
    }
}
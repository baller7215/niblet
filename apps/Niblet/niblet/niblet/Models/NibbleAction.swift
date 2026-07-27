import Foundation

struct NibbleAction: Identifiable, Hashable, Codable {
    // id - stable internal name like "summarize_text" or "extract_entities"
    let id: String
    // title - human-readable name like "Summarize Text" or "Extract Entities"
    let title: String
    // description - human-readable description of what the action does
    let description: String
    // category - the category of the action, like "Reading" or "Writing"
    let category: NibbleCategory
    // promptTemplate - the prompt template to use for this action, with placeholders for user input
    let promptTemplate: String
}



extension NibbleAction {
    static let samples: [NibbleAction] = [
        NibbleAction(
            id: "summarize",
            title: "Summarize",
            description: "Turn selected text into a short summary.",
            category: .reading,
            promptTemplate: """
            Summarize the following text clearly and concisely:

            {{input}}
            """
        ),
        NibbleAction(
            id: "explain-simply",
            title: "Explain Simply",
            description: "Explain selected text in plain language.",
            category: .reading,
            promptTemplate: """
            Explain the following text simply and intuitively:

            {{input}}
            """
        ),
        NibbleAction(
            id: "rewrite",
            title: "Rewrite",
            description: "Rewrite selected text to be clearer.",
            category: .writing,
            promptTemplate: """
            Rewrite the following text to be clearer, more natural, and concise:

            {{input}}
            """
        ),
        NibbleAction(
            id: "extract-todos",
            title: "Extract TODOs",
            description: "Pull out action items and next steps.",
            category: .extraction,
            promptTemplate: """
            Extract the TODOs, action items, and next steps from the following text:

            {{input}}
            """
        ),
        NibbleAction(
            id: "explain-code",
            title: "Explain Code",
            description: "Explain what selected code does.",
            category: .coding,
            promptTemplate: """
            Explain what the following code does. Be clear and practical:

            {{input}}
            """
        )
    ]
}
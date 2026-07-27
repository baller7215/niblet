import Foundation

/// A reusable AI action template that users can invoke with their own input.
///
/// A `NibbleAction` is a pre-configured prompt template that defines what kind of AI task
/// the user can perform (e.g., "Summarize Text", "Explain Code"). It's a blueprint or tool,
/// not a record of usage.
///
/// **Relationships:**
/// - Belongs to a `NibbleCategory` to group similar actions
/// - Many `Crumb` objects reference a single `NibbleAction` (via `nibbleID`)
/// - One `NibbleAction` instance can be used to create many different `Crumb` records
/// - Static samples provide the built-in Nibbles available to all users
///
/// **Example Flow:**
/// 1. User selects the "Summarize" NibbleAction
/// 2. User provides input text
/// 3. The promptTemplate is filled with the user's input
/// 4. The AI processes it
/// 5. A `Crumb` is created recording this interaction
struct NibbleAction: Identifiable, Hashable, Codable {
    /// Stable internal identifier (e.g., "summarize", "explain-code")
    /// Used to reference this action in Crumbs and persisted data
    let id: String
    
    /// Human-readable display name (e.g., "Summarize", "Explain Code")
    /// Shown in the UI for users to select this action
    let title: String
    
    /// Human-readable description of what this action does
    /// Helps users understand what result to expect
    let description: String
    
    /// The category this action belongs to (Reading, Writing, Coding, etc.)
    /// Used for organizing and filtering actions in the UI
    let category: NibbleCategory
    
    /// Template string containing the AI prompt
    /// Uses {{input}} placeholder that gets replaced with the user's text
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
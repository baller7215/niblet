import Foundation

/// Categorizes different types of AI actions available in Niblet.
///
/// Each Nibble (AI action template) belongs to a category, helping users find and organize their tools.
/// Categories include reading aids (summarize, explain), writing tools (rewrite), coding helpers,
/// and extraction tasks (pull out TODOs).
///
/// **Relationships:**
/// - Used by `NibbleAction` to classify what type of action it is
/// - Displayed in the UI to filter and group available Nibbles
/// - Part of the core data structure for the Niblet app
enum NibbleCategory: String, CaseIterable, Codable, Identifiable {
    /// Text analysis and understanding tools (summarize, explain)
    case reading = "Reading"
    /// Text creation and improvement tools (rewrite, compose)
    case writing = "Writing"
    /// Code-related tools (explain, refactor, document)
    case coding = "Coding"
    /// Information extraction tools (extract TODOs, entities, facts)
    case extraction = "Extraction"
    /// User-defined custom actions
    case custom = "Custom"

    var id: String { rawValue }
}
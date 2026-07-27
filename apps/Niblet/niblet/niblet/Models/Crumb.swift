import Foundation

/// A record of a completed AI interaction (a saved "breadcrumb" in the user's history).
///
/// When a user runs a `NibbleAction` with their text and receives a response, a `Crumb` is created
/// to preserve that interaction. This forms the user's History—a searchable, replayable log of
/// everything they've done in the app.
///
/// **Relationships:**
/// - References a single `NibbleAction` (via `nibbleID` and `nibbleTitle`) that was used
/// - One per user interaction; many Crumbs can reference the same NibbleAction
/// - Stored persistently (e.g., in UserDefaults, a database, or iCloud) so history survives app restarts
/// - Displayed in the History view for users to review past results
///
/// **Example:**
/// - User runs "Summarize" action with text "The quick brown fox..."
/// - AI returns a summary
/// - A Crumb is created with:
///   - nibbleID: "summarize"
///   - inputText: "The quick brown fox..."
///   - responseText: "A fast brown fox..."
///   - createdAt: current timestamp
struct Crumb: Identifiable, Hashable {
    /// Unique identifier for this specific interaction/crumb
    let id: UUID
    
    /// The text the user provided as input
    let inputText: String
    
    /// The stable ID of the NibbleAction that was used (e.g., "summarize")
    /// Allows retrieving the original action template if needed
    let nibbleID: String
    
    /// The human-readable title of the action at the time it was used
    /// Cached here for display in history even if the action was modified later
    let nibbleTitle: String
    
    /// The AI-generated response text
    let responseText: String
    
    /// When this interaction occurred
    /// Used for sorting history chronologically
    let createdAt: Date

    init(
        id: UUID = UUID(),
        inputText: String,
        nibbleID: String,
        nibbleTitle: String,
        responseText: String,
        createdAt: Date = Date()
    ) {
        self.id = id
        self.inputText = inputText
        self.nibbleID = nibbleID
        self.nibbleTitle = nibbleTitle
        self.responseText = responseText
        self.createdAt = createdAt
    }
}
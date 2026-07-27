import Foundation

enum NibbleCategory: String, CaseIterable, Codable, Identifiable {
    case reading = "Reading"
    case writing = "Writing"
    case coding = "Coding"
    case extraction = "Extraction"
    case custom = "Custom"

    var id: String { rawValue }
}
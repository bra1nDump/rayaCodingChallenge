import Foundation

enum Model {
    // MARK: - SearchShow
    struct ShowSearchMatch: Codable {
        let score: Double
        let show: Show
    }

    // MARK: - Show
    struct Show: Codable {
        let id: Int
        let name: String
    }
    
    // MARK: - Image
    struct Image: Codable {
        let medium, original: String
    }
    
    typealias ShowSearchMatches = [ShowSearchMatch]
    
    // MARK: - Episode
    struct Episode: Codable {
        let id: Int
        let name: String
        let season, number: Int
        let summary: String
        let image: Image
    }
    
    typealias Episodes = [Episode]
}

// Identifiable required for .popover to work
extension Model.Episode: Hashable, Identifiable {
    static func == (lhs: Model.Episode, rhs: Model.Episode) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

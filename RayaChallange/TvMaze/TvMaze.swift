import Foundation
import Combine

class TvMaze {
    // MARK: Model
    struct ShowSearchMatch: Codable {
        let score: Double
        let show: Show
    }

    struct Show: Codable {
        let id: Int
        let name: String
    }
    
    struct Image: Codable {
        let medium, original: String
    }
    
    typealias ShowSearchMatches = [ShowSearchMatch]
    
    struct Episode: Codable {
        let id: Int
        let name: String
        let season, number: Int
        let summary: String
        let image: Image
    }
    
    typealias Episodes = [Episode]
    
    // MARK: Endpoints
    static func search(query: String) -> AnyPublisher<ShowSearchMatches, Never> {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "api.tvmaze.com"
        components.path = "/search/shows"
        components.queryItems = [ URLQueryItem(name: "q", value: query) ]
        guard let url = components.url else {
            return Just(ShowSearchMatches()).eraseToAnyPublisher()
        }

        return
            URLSession
            .get(url: url, type: ShowSearchMatches.self)
            .map { $0 ?? ShowSearchMatches() }
            .eraseToAnyPublisher()
    }
    
    static func episodes(showId: Int) -> AnyPublisher<Episodes, Never> {
        URLSession
        .get(url: "http://api.tvmaze.com/shows/\(showId)/episodes", type: Episodes.self)
        .map { $0 ?? Episodes() }
        .eraseToAnyPublisher()
    }
}

// Identifiable required for .popover to work
extension TvMaze.Episode: Hashable, Identifiable {
    static func == (lhs: TvMaze.Episode, rhs: TvMaze.Episode) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

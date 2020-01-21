import Foundation
import Combine

extension URLSession {
    static func get<T: Decodable>(url: String, type: T.Type) -> AnyPublisher<T?, Never> {
        shared
        .dataTaskPublisher(for: URL(string: url)!)
        .map { try? JSONDecoder().decode(type, from: $0.0)}
        .replaceError(with: nil)
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}

class TvMaze {
    static func search(query: String) -> AnyPublisher<Data.SearchShows, Never> {
        URLSession.get(url: "http://api.tvmaze.com/search/shows?q=\(query)", type: Data.SearchShows.self)
        .map { $0 ?? Data.SearchShows() }
        .eraseToAnyPublisher()
    }
    
    static func episodes(showId: Int) -> AnyPublisher<Data.Episodes, Never> {
        URLSession.get(url: "http://api.tvmaze.com/shows/\(showId)/episodes", type: Data.Episodes.self)
        .map { $0 ?? Data.Episodes() }
        .eraseToAnyPublisher()
    }
}

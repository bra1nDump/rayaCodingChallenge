import Foundation
import Combine

extension URLSession {
    static func get<T: Decodable>(url: String, type: T.Type) -> AnyPublisher<T?, Never> {
        guard let url = URL(string: url) else { return Just(nil).eraseToAnyPublisher() }
        return get(url: url, type: type)
    }
    
    static func get<T: Decodable>(url: URL, type: T.Type) -> AnyPublisher<T?, Never> {
        shared
        .dataTaskPublisher(for: url)
        .map { try? JSONDecoder().decode(type, from: $0.0) }
        .replaceError(with: nil)
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}

class TvMaze {
    static func search(query: String) -> AnyPublisher<Model.ShowSearchMatches, Never> {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "api.tvmaze.com"
        components.path = "/search/shows"
        components.queryItems = [ URLQueryItem(name: "q", value: query) ]
        guard let url = components.url else {
            return Just(Model.ShowSearchMatches()).eraseToAnyPublisher()
        }

        return
            URLSession
            .get(url: url, type: Model.ShowSearchMatches.self)
            .map { $0 ?? Model.ShowSearchMatches() }
            .eraseToAnyPublisher()
    }
    
    static func episodes(showId: Int) -> AnyPublisher<Model.Episodes, Never> {
        URLSession.get(url: "http://api.tvmaze.com/shows/\(showId)/episodes", type: Model.Episodes.self)
        .map { $0 ?? Model.Episodes() }
        .eraseToAnyPublisher()
    }
}

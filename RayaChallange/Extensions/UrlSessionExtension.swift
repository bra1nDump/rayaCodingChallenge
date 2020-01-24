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

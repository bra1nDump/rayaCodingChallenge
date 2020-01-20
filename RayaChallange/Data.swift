// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let searchShows = try? newJSONDecoder().decode(SearchShows.self, from: jsonData)

import Foundation

enum Data {

    // MARK: - SearchShow
    struct SearchShow: Codable {
        let score: Double
        let show: Show
    }

    // MARK: - Show
    struct Show: Codable {
        let id: Int
        let url: String
        let name: String
        let type: TypeEnum
        let language: Language
        let genres: [String]
        let status: Status
        let runtime: Int?
        let premiered: String?
        let officialSite: String?
        let schedule: Schedule
        let rating: Rating
        let weight: Int
        let network, webChannel: Network?
        let externals: Externals
        let image: Image?
        let summary: String?
        let updated: Int
        let links: Links

        enum CodingKeys: String, CodingKey {
            case id, url, name, type, language, genres, status, runtime, premiered, officialSite, schedule, rating, weight, network, webChannel, externals, image, summary, updated
            case links = "_links"
        }
    }

    // MARK: - Externals
    struct Externals: Codable {
        let tvrage, thetvdb: Int?
        let imdb: String?
    }

    // MARK: - Image
    struct Image: Codable {
        let medium, original: String
    }

    enum Language: String, Codable {
        case english = "English"
        case mongolian = "Mongolian"
    }

    // MARK: - Links
    struct Links: Codable {
        let linksSelf: Nextepisode
        let previousepisode, nextepisode: Nextepisode?

        enum CodingKeys: String, CodingKey {
            case linksSelf = "self"
            case previousepisode, nextepisode
        }
    }

    // MARK: - Nextepisode
    struct Nextepisode: Codable {
        let href: String
    }

    // MARK: - Network
    struct Network: Codable {
        let id: Int
        let name: String
        let country: Country?
    }

    // MARK: - Country
    struct Country: Codable {
        let name, code, timezone: String
    }

    // MARK: - Rating
    struct Rating: Codable {
        let average: Double?
    }

    // MARK: - Schedule
    struct Schedule: Codable {
        let time: String
        let days: [String]
    }

    enum Status: String, Codable {
        case ended = "Ended"
        case inDevelopment = "In Development"
        case running = "Running"
    }

    enum TypeEnum: String, Codable {
        case animation = "Animation"
        case scripted = "Scripted"
    }

    typealias SearchShows = [SearchShow]
    
    // MARK: - Episode
    struct Episode: Codable, Hashable, Identifiable {
        static func == (lhs: Data.Episode, rhs: Data.Episode) -> Bool {
            lhs.id == rhs.id
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
        
        let id: Int
        let url: String
        let name: String
        let season, number: Int
        let airdate: String
        let airtime: String
        let airstamp: String // TODO: change to date
        let runtime: Int
        let image: Image
        let summary: String
        let links: Links

        enum CodingKeys: String, CodingKey {
            case id, url, name, season, number, airdate, airtime, airstamp, runtime, image, summary
            case links = "_links"
        }
    }

    // MARK: - SelfClass
    struct SelfClass: Codable {
        let href: String
    }

    typealias Episodes = [Episode]
}

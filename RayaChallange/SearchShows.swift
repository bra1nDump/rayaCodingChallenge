// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let searchShows = try? newJSONDecoder().decode(SearchShows.self, from: jsonData)

import Foundation

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

let searchShowsSample =
"""
[
  {
    "score": 17.261711,
    "show": {
      "id": 139,
      "url": "http://www.tvmaze.com/shows/139/girls",
      "name": "Girls",
      "type": "Scripted",
      "language": "English",
      "genres": [
        "Drama",
        "Romance"
      ],
      "status": "Ended",
      "runtime": 30,
      "premiered": "2012-04-15",
      "officialSite": "http://www.hbo.com/girls",
      "schedule": {
        "time": "22:00",
        "days": [
          "Sunday"
        ]
      },
      "rating": {
        "average": 6.9
      },
      "weight": 75,
      "network": {
        "id": 8,
        "name": "HBO",
        "country": {
          "name": "United States",
          "code": "US",
          "timezone": "America/New_York"
        }
      },
      "webChannel": null,
      "externals": {
        "tvrage": 30124,
        "thetvdb": 220411,
        "imdb": "tt1723816"
      },
      "image": {
        "medium": "http://static.tvmaze.com/uploads/images/medium_portrait/31/78286.jpg",
        "original": "http://static.tvmaze.com/uploads/images/original_untouched/31/78286.jpg"
      },
      "summary": "<p>This Emmy winning series is a comic look at the assorted humiliations and rare triumphs of a group of girls in their 20s.</p>",
      "updated": 1577601053,
      "_links": {
        "self": {
          "href": "http://api.tvmaze.com/shows/139"
        },
        "previousepisode": {
          "href": "http://api.tvmaze.com/episodes/1079686"
        }
      }
    }
  }
]
""".data(using: .utf8)!

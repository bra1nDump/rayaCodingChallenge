import Foundation

// MARK: - Episode
struct Episode: Codable {
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

let episodesSample = """
[
  {
    "id": 1,
    "url": "http://www.tvmaze.com/episodes/1/under-the-dome-1x01-pilot",
    "name": "Pilot",
    "season": 1,
    "number": 1,
    "airdate": "2013-06-24",
    "airtime": "22:00",
    "airstamp": "2013-06-25T02:00:00+00:00",
    "runtime": 60,
    "image": {
      "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/1/4388.jpg",
      "original": "http://static.tvmaze.com/uploads/images/original_untouched/1/4388.jpg"
    },
    "summary": "<p>When the residents of Chester's Mill find themselves trapped under a massive transparent dome with no way out, they struggle to survive as resources rapidly dwindle and panic quickly escalates.</p>",
    "_links": {
      "self": {
        "href": "http://api.tvmaze.com/episodes/1"
      }
    }
  }
]
""".data(using: .utf8)!

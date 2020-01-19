import XCTest
@testable import RayaChallange

class RayaChallangeTests: XCTestCase {
    func testSearchShowsParsing() {
        let searchShows = try! JSONDecoder().decode(SearchShows.self, from: searchShowsSample)
        XCTAssert(searchShows.first!.show.id == 139)
    }
    
    func testEpisodesParsing() {
        let episodes = try! JSONDecoder().decode(Episodes.self, from: episodesSample)
        XCTAssert(episodes.first!.id == 1)
    }
}

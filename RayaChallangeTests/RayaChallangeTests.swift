import XCTest
@testable import RayaChallange

class RayaChallangeTests: XCTestCase {
    func testSearchShowsParsing() {
        let searchShows = try! JSONDecoder().decode(Data.SearchShows.self, from: MockData.searchShowsSampleJsonData)
        XCTAssert(searchShows.first!.show.id == 139)
    }
    
    func testEpisodesParsing() {
        let episodes = try! JSONDecoder().decode(Data.Episodes.self, from: MockData.episodesSampleJsonData)
        XCTAssert(episodes.first!.id == 1)
    }
}

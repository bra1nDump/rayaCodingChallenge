import XCTest
@testable import RayaChallange

class RayaChallangeTests: XCTestCase {
    func testSearchShowsParsing() {
        let searchShows = try! JSONDecoder().decode(Model.ShowSearchMatches.self, from: MockData.searchShowsSampleJsonData)
        XCTAssert(searchShows.first!.show.id == 139)
    }
    
    func testEpisodesParsing() {
        let episodes = try! JSONDecoder().decode(Model.Episodes.self, from: MockData.episodesSampleJsonData)
        XCTAssert(episodes.first!.id == 1)
    }
    
    func testArrayGroupBy() {
        XCTAssertEqual([1, 1, 4, 3, 3].group(by: ==), [[1, 1], [4], [3, 3]])
    }
    
    func testSearch() {
        let expectation = XCTestExpectation()
        let _ = TvMaze.search(query: "girls")
            .sink { (shows) in
                if shows.isNotEmpty {
                    expectation.fulfill()
                } else {
                    fatalError("Show search result for girs should not be emtpy")
                }
            }
    }
    
    func testSearchWithSpaceInQuery() {
        let expectation = XCTestExpectation()
        let _ = TvMaze.search(query: "Model Squad") // matches exactly one show name, should not be empty
            .sink { (shows) in
                if shows.isNotEmpty {
                    expectation.fulfill()
                } else {
                    fatalError("Show search result for girs should not be emtpy")
                }
            }
    }
    
    func testEpisodes() {
        let expectation = XCTestExpectation()
        let _ = TvMaze.episodes(showId: 1)
            .sink { (episodes) in
                if episodes.isNotEmpty {
                    expectation.fulfill()
                } else {
                    fatalError("Show search result for girs should not be emtpy")
                }
            }
    }
}

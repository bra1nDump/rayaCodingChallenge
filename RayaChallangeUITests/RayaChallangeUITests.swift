import XCTest

class RayaChallangeUITests: XCTestCase {
    func testSearchShows() {
        let app = XCUIApplication()
        app.launch()
        
        let searchTextField = app.textFields["Search"]
        searchTextField.tap()
        searchTextField.typeText("Girls")
        sleep(3)
    }
    
    func testClearSearchBar() {
        let app = XCUIApplication()
        app.launch()
        
        let searchTextField = app.textFields["Search"]
        searchTextField.tap()
        searchTextField.typeText("Girls")
        
        app.buttons["Clear"].tap()
        XCTAssertEqual(app.textFields["Search"].firstMatch.title, "")
    }
    
    func testNavigateToEpisode() {
        let app = XCUIApplication()
        app.launch()
        
        let searchTextField = app.textFields["Search"]
        searchTextField.tap()
        searchTextField.typeText("Girls")
        sleep(3)
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Girls"]/*[[".cells.buttons[\"Girls\"]",".buttons[\"Girls\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        sleep(3)
        
        tablesQuery.staticTexts["Episode 1"].firstMatch.tap()
    }
    
    func testCanDismissEpisode() {
        let app = XCUIApplication()
        app.launch()
        
        let searchTextField = app.textFields["Search"]
        searchTextField.tap()
        searchTextField.typeText("Girls")
        
        let tablesQuery = app.tables
        let girlsShow = tablesQuery.buttons["Girls"]
        XCTAssert(girlsShow.waitForExistence(timeout: 1000))
        girlsShow.tap()
        
        let firstEpisodeRow = tablesQuery.staticTexts["Episode 1"]
        XCTAssert(firstEpisodeRow.waitForExistence(timeout: 1000))
        firstEpisodeRow.tap()
        
        // this should dismiss the detail view
        let start = app.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.1))
        let end = app.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.9))

        start.press(forDuration: 0.5, thenDragTo: end)
    }
    
    func testNavigateBackToSearch() {
        let app = XCUIApplication()
        app.launch()
        
        let searchTextField = app.textFields["Search"]
        searchTextField.tap()
        searchTextField.typeText("Girls")
        sleep(3)
        
        let tablesQuery = app.tables
        tablesQuery.buttons["Girls"].tap()
        
        app.navigationBars.buttons["Show Search"].tap()
        
        XCTAssert(app.staticTexts["Show Search"].firstMatch.exists)
    }
}

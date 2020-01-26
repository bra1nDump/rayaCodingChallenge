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
        sleep(3)
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Girls"]/*[[".cells.buttons[\"Girls\"]",".buttons[\"Girls\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        sleep(3)
        
        tablesQuery.staticTexts["Episode 1"].firstMatch.tap()
        sleep(3)
        
        // this should dismiss the detail view
        app.buttons["Close"].tap()
        sleep(3)
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

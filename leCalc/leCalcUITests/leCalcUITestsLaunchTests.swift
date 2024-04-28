//
//  leCalcUITestsLaunchTests.swift
//  leCalcUITests
//
//  Created by Martin Čech on 16.11.2023.
//

import XCTest

final class leCalcUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
        
        let app = XCUIApplication()
    }

    /*func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }*/
    
    func testOne() {
        
        
        
        let app = XCUIApplication()
        app.launch()
        
        app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Roman Numbers"]/*[[".cells.buttons[\"Roman Numbers\"]",".buttons[\"Roman Numbers\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertTrue(app.staticTexts["please, insert number 0-3999"].exists)
        app.textFields["arabic number"].tap()
        app.textFields["arabic number"].typeText("123")
        XCTAssertTrue(app.staticTexts["CXXIII"].exists)
        
        
        
    }
}

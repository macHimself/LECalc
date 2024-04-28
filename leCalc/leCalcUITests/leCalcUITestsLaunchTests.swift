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
    
    func testRomanNumbersConvertor() {
        // APP it self
        let app = XCUIApplication()
        
        app.launch()
        
        // go to converter R<-->A numbers
        app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Roman Numbers"]/*[[".cells.buttons[\"Roman Numbers\"]",".buttons[\"Roman Numbers\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        // check visible messages
        XCTAssertTrue(app.staticTexts["please, insert number 0-3999"].exists)
        XCTAssertTrue(app.staticTexts["!!!0!!!"].exists)
        
        //check invisible description by openin and closing it
        app.buttons[">>>"].tap()
                // too long text need to work over it limit for static text is 128 chars.
        //XCTAssertTrue failed: throwing "NSInternalInconsistencyException: Invalid query - string identifier 'Roman numerals are a numeral system that originated in ancient Rome and remained the usual way of writing numbers throughout Europe well into the Late Middle Ages. Numbers are written with combinations of letters from the Latin alphabet, each letter with a fixed integer value. Modern style uses only these seven: I = 1 .. V = 5 .. X = 10 .. L = 50 .. C = 100 .. D = 500 .. M = 1000' exceeds maximum length of 128 characters. You can work around this limitation by constructing a query with a custom NSPredicate that specifies the property (label, title, value, placeholderValue, or identifier) to match against."
        
              //  XCTAssertTrue(app.staticTexts["Roman numerals are a numeral system that originated in ancient Rome and remained the usual way of writing numbers throughout Europe well into the Late Middle Ages. Numbers are written with combinations of letters from the Latin alphabet, each letter with a fixed integer value. Modern style uses only these seven: I = 1 .. V = 5 .. X = 10 .. L = 50 .. C = 100 .. D = 500 .. M = 1000"].exists)
        app.buttons["<<<"].tap()
        
        // type arabic number
        app.textFields["arabic number"].tap()
        app.textFields["arabic number"].typeText("123")
        // check result in roman number
        XCTAssertTrue(app.staticTexts["CXXIII"].exists)
        
        // type roman number
        app.textFields["roman number"].tap()
        app.textFields["roman number"].typeText("MM")
        // check resut in arabic number
        XCTAssertTrue(app.staticTexts["2000"].exists)
    }
}

//
//  IntegerFactorization.swift
//  leCalcTests
//
//  Created by Martin Čech on 22.11.2023.
//

@testable import leCalc
import XCTest

class TestIntegerFactorization: XCTestCase {

    var testIntegerFactorization: IntegerFactorization!

    override func setUp() {
        super.setUp()
    testIntegerFactorization = IntegerFactorization()
    }
    
    override func tearDown() {
        testIntegerFactorization = nil
        super.tearDown()
    }
    
    func test_is_valid_output_presentFunction() throws {
        XCTAssertNoThrow(try testIntegerFactorization.getIntegerFactorization("0"))
    }

    func test_isInt() {
        XCTAssertEqual(testIntegerFactorization.isInt("1"), true)
        XCTAssertEqual(testIntegerFactorization.isInt("1.1"), false)
        XCTAssertEqual(testIntegerFactorization.isInt("x"), false)
        XCTAssertEqual(testIntegerFactorization.isInt("1000"), true)
    }
    
    func test_IsValidForIntegerFactorization() {
        XCTAssertEqual(testIntegerFactorization.isValidForIntegerFactorization(1), false)
        XCTAssertEqual(testIntegerFactorization.isValidForIntegerFactorization(99999999), false)
        XCTAssertEqual(testIntegerFactorization.isValidForIntegerFactorization(2), true)
        XCTAssertEqual(testIntegerFactorization.isValidForIntegerFactorization(24563), true)
    }
    
    func test_getIntegerFactorization() {
        XCTAssertEqual(testIntegerFactorization.getIntegerFactorization("4"), "2 \n2 \n")
        XTCAssertEqual(testIntegerFactorization.getIntegerFactorization("36"), "2 \n2 \n3 \n3")
    }
    
    func test_presentWithExponents() {
        XCTAssertEqual(testIntegerFactorization.presentWithExponents("2 \n2 \n"), "2^{2}")
        XCTAssertEqual(testIntegerFactorization.presentWithExponents("2 \n2 \n2 \n2 \n2 \n2 \n2 \n2 \n2 \n2 \n"), "2^{10}")
        XCTAssertEqual(testIntegerFactorization.presentWithExponents("2 \n2 \n3 \n3"), "2^{2} . 3^{2}")
    }
}

//
//  RomanNumb ers.swift
//  leCalcTests
//
//  Created by Martin Čech on 22.11.2023.
//

@testable import leCalc
import XCTest

class TestRomanNumbersFunc: XCTestCase {

    var testRomanNumbersFunc: RomanNumbers!

    override func setUp() {
        super.setUp()
        testRomanNumbersFunc = RomanNumbers()
    }
    
    override func tearDown() {
        testRomanNumbersFunc = nil
        super.tearDown()
    }
    
    func test_is_valid_output_presentFunction() throws {
        XCTAssertNoThrow(try testRomanNumbersFunc.getRomanNumber("1"))
    }
    
    func test_romanNumbers_isInt() {
        XCTAssertEqual(testRomanNumbersFunc.isInt("1"), true)
        XCTAssertEqual(testRomanNumbersFunc.isInt("1.1"), false)
        XCTAssertEqual(testRomanNumbersFunc.isInt("x"), false)
        XCTAssertEqual(testRomanNumbersFunc.isInt("1000"), true)
    }
    
    func test_romanNumbers_validateInput() {
        XCTAssertEqual(testRomanNumbersFunc.validateInput(text: "MMM"), true)
        XCTAssertEqual(testRomanNumbersFunc.validateInput(text: "MARTIN"), false)
        XCTAssertEqual(testRomanNumbersFunc.validateInput(text: "MCD"), true)
        XCTAssertEqual(testRomanNumbersFunc.validateInput(text: "III"), true)
        XCTAssertEqual(testRomanNumbersFunc.validateInput(text: "-X"), false)
        XCTAssertEqual(testRomanNumbersFunc.validateInput(text: "IIII"), false)
        XCTAssertEqual(testRomanNumbersFunc.validateInput(text: "MCDM"), false)
        XCTAssertEqual(testRomanNumbersFunc.validateInput(text: "MMMLLLXXXIII"), false)
        XCTAssertEqual(testRomanNumbersFunc.validateInput(text: "MMMCCCXXXIII"), true)
    }
    
    func test_arabicToRoman() {
        XCTAssertEqual(testRomanNumbersFunc.getRomanNumber("1"), "I")
        XCTAssertEqual(testRomanNumbersFunc.getRomanNumber("4"), "IV")
        XCTAssertEqual(testRomanNumbersFunc.getRomanNumber("40"), "XL")
        XCTAssertEqual(testRomanNumbersFunc.getRomanNumber("400"), "CD")
        XCTAssertEqual(testRomanNumbersFunc.getRomanNumber("3999"), "MMMCMXCIX")
    }
    
    func test_romanToArabic() {
        XCTAssertEqual(testRomanNumbersFunc.getArabicNumber("I"), "1")
        XCTAssertEqual(testRomanNumbersFunc.getArabicNumber("IV"), "4")
        XCTAssertEqual(testRomanNumbersFunc.getArabicNumber("XL"), "40")
        XCTAssertEqual(testRomanNumbersFunc.getArabicNumber("CD"), "400")
        XCTAssertEqual(testRomanNumbersFunc.getArabicNumber("MMMCMXCIX"), "3999")
    }
}

//
//  SquareRootequation.swift
//  leCalcUITests
//
//  Created by Martin Čech on 19.11.2023.
//

@testable import leCalc
import XCTest

class SquareRootequation: XCTestCase {

    var squareRootequation: RootCalculator!

    override func setUp() {
        super.setUp()
        squareRootequation = RootCalculator()
    }
    
    override func tearDown() {
        squareRootequation = nil
        super.tearDown()
    }
}

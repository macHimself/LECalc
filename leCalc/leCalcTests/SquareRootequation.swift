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
    
    func test_is_valid_output_presentFunction() throws {
        XCTAssertNoThrow(try squareRootequation.presentFunction("1", "2","1"))
    }
    
    func test_is_giving_correctStrings() {
        XCTAssertEqual(squareRootequation.presentFunction("1", "2","1"), ["x^2+2x+1=0","x_{1|2}=-1","","[x,y]=[0,1]","V[x,y]=[-1,0]"])
        XCTAssertEqual(squareRootequation.presentFunction("1", "-2","1"), ["x^2-2x+1=0","x_{1|2}=1","","[x,y]=[0,1]","V[x,y]=[1,0]"])
        XCTAssertEqual(squareRootequation.presentFunction("0", "2","1"), ["2x+1=0","x=-0.500","","[x,y]=[0,1]",""])
        XCTAssertEqual(squareRootequation.presentFunction("0", "-2","1"), ["-2x+1=0","x=0.500","","[x,y]=[0,1]",""])
        XCTAssertEqual(squareRootequation.presentFunction("0", "0","1"), ["1=0","x\\in\\emptyset","","",""])
        XCTAssertEqual(squareRootequation.presentFunction("0", "0","-1"), ["-1=0","","","",""])
        XCTAssertEqual(squareRootequation.presentFunction("1", "0", "4"), ["x^2+4=0","x\\in\\emptyset", "","",""])
        XCTAssertEqual(squareRootequation.presentFunction("1", "0", "-4"), ["x^2-4=0","x_{1}=2","x_{2}=-2","[x,y]=[0,-4]","V[x,y]=[0,-4]"])
    }
}

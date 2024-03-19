//
//  SimpleCalculatorTests.swift
//  SimpleCalculatorTests
//
//  Created by Юсуп Оздоев on 20.01.2024.
//

import XCTest

final class SimpleCalculatorTests: XCTestCase {
    
    var simpleCalculator: SimpleCalculator!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        simpleCalculator = SimpleCalculator()
    }

    override func tearDownWithError() throws {
        simpleCalculator = nil
        try super.tearDownWithError()
    }
    
    func testCircleArea() throws {
        XCTAssertEqual(simpleCalculator.circleArea(radius: 3), 28.26, accuracy: 1e-7)
        XCTAssertEqual(simpleCalculator.circleArea(radius: -3), 0, accuracy: 1e-7)
        XCTAssertEqual(simpleCalculator.circleArea(radius: 1), 3.14, accuracy: 1e-7)
    }
    
    func testFibonacci() throws {
        XCTAssertEqual(simpleCalculator.fibonacci(n: -1), 0)
        XCTAssertEqual(simpleCalculator.fibonacci(n: 0), 0)
        XCTAssertEqual(simpleCalculator.fibonacci(n: 1), 1)
        XCTAssertEqual(simpleCalculator.fibonacci(n: 2), 1)
        XCTAssertEqual(simpleCalculator.fibonacci(n: 3), 2)
        XCTAssertEqual(simpleCalculator.fibonacci(n: 4), 3)
        XCTAssertEqual(simpleCalculator.fibonacci(n: 6), 8)
        XCTAssertEqual(simpleCalculator.fibonacci(n: 21), 10946)
    }
    
    func testFahrenheit() throws {
        XCTAssertEqual(simpleCalculator.fahrenheit(celcius: 1), 33.8,  accuracy: 1e-7)
        XCTAssertEqual(simpleCalculator.fahrenheit(celcius: 44.4), 111.92,  accuracy: 1e-7)
        XCTAssertEqual(simpleCalculator.fahrenheit(celcius: -54), -65.2,  accuracy: 1e-7)
        XCTAssertEqual(simpleCalculator.fahrenheit(celcius: 0), 32,  accuracy: 1e-7)
    }
    
    func testIsEven() throws {
        XCTAssertTrue(simpleCalculator.isEven(num: 2))
        XCTAssertTrue(simpleCalculator.isEven(num: -2))
        XCTAssertTrue(simpleCalculator.isEven(num: 22534))
        XCTAssertTrue(simpleCalculator.isEven(num: 20))
        XCTAssertFalse(simpleCalculator.isEven(num: 202343))
        XCTAssertFalse(simpleCalculator.isEven(num: -202343))
        XCTAssertFalse(simpleCalculator.isEven(num: 1))
    }
    
    func testGetAvg() throws {
        XCTAssertNil(simpleCalculator.getAvg(numbers: []))
        XCTAssertNotNil(simpleCalculator.getAvg(numbers: [1, 3]))
        XCTAssertEqual(simpleCalculator.getAvg(numbers: [1, 3])!, 2, accuracy: 1e-7)
        XCTAssertNotNil(simpleCalculator.getAvg(numbers: [1, 3, 5, 3, 4, 5]))
        XCTAssertEqual(simpleCalculator.getAvg(numbers: [1, 3, 5, 3, 4, 5])!, 3.5, accuracy: 1e-7)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            _ = simpleCalculator.circleArea(radius: 3)
        }
    }

}

//
//  MovieQuizTests.swift
//  MovieQuizTests
//
//  Created by Андрей Мерзликин on 15.07.2023.
//

import XCTest
struct ArithmeticOperations {
    func addition(num1: Int, num2: Int, handler: @escaping (Int) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            handler(num1 + num2)
}
}
    func subtraction(num1: Int, num2: Int, handler: @escaping (Int) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            handler(num1 - num2)
}
}
    func multiplication(num1: Int, num2: Int, handler: @escaping (Int) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            handler(num1 * num2)
}
}
}

final class MovieQuizTests: XCTestCase {
func testAddition() throws {
        // Given
        let arithmeticOperations = ArithmeticOperations()
        let num1 = 1
        let num2 = 2
        // When
    let expectarion = expectation(description: "Addition function expectarion")
    arithmeticOperations.addition(num1: num1, num2: num2) { result in
        // Then
        XCTAssertEqual(result, 3)
        expectarion.fulfill()
}
    waitForExpectations(timeout: 2)
}
}

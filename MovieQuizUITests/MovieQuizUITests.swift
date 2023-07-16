//
//  MovieQuizUITests.swift
//  MovieQuizUITests
//
//  Created by Андрей Мерзликин on 16.07.2023.
//

import XCTest
final class MovieQuizUITests: XCTestCase {
    // swiftlint:disable:next implicity_unwrapped_optional
var app: XCUIApplication!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
       try super.setUpWithError()
       app = XCUIApplication()
       /**
        это специальная настройка для тестов: если один тест не прошел,
         то следующие тесты запускаться не будут;
        */
        continueAfterFailure = false
/**
 In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run.
 The setUp method is a good place to do this.
 */
}
override func tearDownWithError() throws {
/**
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
*/
        app.terminate()
        app = nil
}
func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
// Use XCTAssert and related functions to verify your tests produce the correct results.
}
func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
}
}
}
}

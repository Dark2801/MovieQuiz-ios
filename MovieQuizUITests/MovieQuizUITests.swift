//
//  MovieQuizUITests.swift
//  MovieQuizUITests
//
//  Created by Андрей Мерзликин on 16.07.2023.
//
import XCTest
final class MovieQuizUITests: XCTestCase {
    // swiftLint:disable:next implicity_unwrapped_optional
    var app: XCUIApplication!
   override func setUpWithError() throws {
    try super.setUpWithError()
    app = XCUIApplication()
    app.launch()
    /**
     это специальная настройка для тестов: если один тест не прошел,
     то следующие тесты запускаться не будут
     */
continueAfterFailure = false
}
override func tearDownWithError() throws {
    try super.tearDownWithError()
    app.terminate()
    app = nil
}
func testScreenCast() throws { }
    func testYesButton() {
        // Создаем задержку
        sleep(3)
        // Находим первоначальный UI-элемент
        let firstPoster = app.images["Poster"]
        // Делаем скроиншот UI-элемента
        let firstPosterData = firstPoster.screenshot().pngRepresentation
        // Нажимаем на кнопку "Да"
        app.buttons["Yes"].tap()
        // Создаем задержку
        sleep(3)
        // Проверяем изменение лейбла с номером вопроса
        let indexLabel = app.staticTexts["Index"]
        // снова находим UI-элемент
        let secondPoster = app.images["Poster"]
        // Делаем с него скриншот UI-элемента
        let secondPosterData = secondPoster.screenshot().pngRepresentation
        // Проверяем что значение лейбла будет "2/10"
        XCTAssertEqual(indexLabel.label, "2/10")
        // Сравниваем между собой два скриншота UI-элементов
        XCTAssertNotEqual(firstPosterData, secondPosterData)
    }
func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
}
            
}

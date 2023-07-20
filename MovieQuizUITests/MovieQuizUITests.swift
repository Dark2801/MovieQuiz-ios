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
        sleep(2)
        // Находим первоначальный UI-элемент
        let firstPoster = app.images["Poster"]
        // Делаем скроиншот UI-элемента
        let firstPosterData = firstPoster.screenshot().pngRepresentation
        // Нажимаем на кнопку "Да"
        app.buttons["Yes"].tap()
        // Создаем задержку
        sleep(2)
        // Получаем лейбл с номером вопроса
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
    func testNobutton() {
        // Создаем задержку
        sleep(2)
        // Yаходим первоначальный UI-элемент
        let firstPoster = app.images["Poster"]
        // Делаем скриншот UI-элемента
        let firstPosterData = firstPoster.screenshot().pngRepresentation
        // Нажимаем на кнопку "Нет"
        app.buttons["No"].tap()
        // Создаем задержку
        sleep(2)
        // Получаем лейбл с номером вопроса
        let indexLabel = app.staticTexts["Index"]
        // Снова находим UI-элемент
        let secondPoster = app.images["Poster"]
        // Делаем скриншот полученного UI-элемента
        let secondPosterData = secondPoster.screenshot().pngRepresentation
        // Проверяем что значение лейбла будет "2/10"
        XCTAssertEqual(indexLabel.label, "2/10")
        // Сравниваем между собой получившиеся скриншоты
        XCTAssertNotEqual(firstPosterData, secondPosterData)
}
// Тест появления алерта при окончании раунда
    func testGameFinish() {
        sleep(2)
        for _ in 1...10 {
            app.buttons["Yes"].tap()
            sleep(2)
            app.buttons["No"].tap()
            sleep(2)
        }
        let alert = app.alerts["Game results"]
        XCTAssertTrue(alert.exists)
        XCTAssertTrue(alert.label == "Этот раунд окончен!")
        XCTAssertTrue(alert.buttons.firstMatch.label == "Сыграть ещё раз")
}
    func testAlertDismiss() {
        sleep(2)
        for _ in 1...10 {
            app.buttons["Yes"].tap()
            sleep(2)
        }
        let alert = app.alerts["Game results"]
        alert.buttons.firstMatch.tap()
        sleep(2)
        let indexLabel = app.staticTexts["Index"]
        XCTAssertFalse(alert.exists)
        XCTAssertTrue(indexLabel.label == "1/10")
    }
}

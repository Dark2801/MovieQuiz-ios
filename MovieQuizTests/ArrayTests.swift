//
//  ArrayTests.swift
//  MovieQuizTests
//
//  Created by Андрей Мерзликин on 15.07.2023.
//
import XCTest // не забываем импортировать фреймворк для тестирования
@testable import MovieQuiz // импортируем наше приложение для тестирования
class ArrayTests: XCTestCase {
    func testGetValueInRange() throws { // тест на успешное взятие элемента по индексу
        // Given
let array = [1, 1, 2, 3, 5]
        // When
        let value = array[safe: 2]
        // Then
XCTAssertNotNil(value)
        XCTAssertEqual(value, 2)
}
    func testGetValueOutOfRange() throws { // тест на взятие элемента по неправильному индексу
        // Given
let array = [1, 1, 2, 3, 5]
        // When
        let value = array[safe: 20]
        // Then
XCTAssertNil(value)
}
}

//
//  MoviesLoaderTests.swift
//  MovieQuizTests
//
//  Created by Андрей Мерзликин on 15.07.2023.
//
import XCTest // не забывайте импортировать фреймворк для тестирования
@testable import MovieQuiz // импортируем приложение для тестирования
class MoviesLoaderTests: XCTestCase {
    func testSuccessLoading() throws {
// Given
 let loader = MoviesLoader()
// When
// так как функция загрузки фильмов - асинхронная, нужно ожидание
let expectation = expectation(description: "Loading expectation")
        loader.LoadMovies { result in
            // Then
            switch result {
            case .success(let movies): break
                // сравниваем данные с тем, что мы предпологали
                expectation.fulfill()
            case .failure(_):
                // мы не ожидаем, что пришла ошибка; если она появится, надо будетпровалить тест
                XCTFail("Unexpected failure") // эта функция проваливает тест
}
}
waitForExpectations(timeout: 1)
}
    func testFailureLoading() throws {
        // Given
        
        // When
        
        // Then
}
}

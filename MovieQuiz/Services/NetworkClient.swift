//
//  NetworkClient.swift
//  MovieQuiz
//
//  Created by Андрей Мерзликин on 23.06.2023.
//

import Foundation
/// Отвечает за загрузку данных по URL

protocol NetworkRouting {
    func fetch(url: URL, handler: @escaping (Result<Data, Error>) -> Void)
}

struct NetworkClient: NetworkRouting {
private enum NetworkError: Error {
        case codeError
}
func fetch(url: URL, handler: @escaping (Result<Data, Error>) -> Void) {
let request = URLRequest(url: url) // Создаем запрос из url
let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // проверяем пришла ли ошибка
            if let error = error {
                handler(.failure(error))
                return // дальше продолжать не имеет смысла, так что заканчиваем выполнение этого кода
            }
            // Проверяем, что нам пришёл успешный код ответа
            if let response = response as? HTTPURLResponse,
               response.statusCode < 200 && response.statusCode >= 300 {
                handler(.failure(NetworkError.codeError))
                return // дальше продолжать не имеет смысла, так что заканчиваем выполнение этого кода
            }
            // Возвращаем данные
            guard let data = data else { return }
            handler(.success(data))
}
task.resume()
}
}

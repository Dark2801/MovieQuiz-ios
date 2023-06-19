//
//  QuestionFactory.swift
//  MovieQuiz
//
//  Created by Андрей Мерзликин on 19.06.2023.
//

import Foundation

class QuestionFactory: QuestionFactoryProtocol {
private  let questions: [QuizQuestion] = [
        QuizQuestion(
            image: "The Godfather",
            text: "Рейтинг этого фильма больше чем 5?",
            correctAnswer: true),
        QuizQuestion(
            image: "The Dark Knight",
            text: "Рейтинг этого фильма больше чем 5?",
            correctAnswer: true),
        QuizQuestion(
            image: "Kill Bill",
            text: "Рейтинг этого фильма больше чем 5?",
            correctAnswer: true),
        QuizQuestion(
            image: "The Avengers",
            text: "Рейтинг этого фильма больше чем 5?",
            correctAnswer: true),
        QuizQuestion(
            image: "Deadpool",
            text: "Рейтинг этого фильма больше чем 5?",
            correctAnswer: true),
        QuizQuestion(
            image: "The Green Knight",
            text: "Рейтинг этого фильма больше чем 5?",
            correctAnswer: true),
        QuizQuestion(
            image: "Old",
            text: "Рейтинг этого фильма больше чем 5?",
            correctAnswer: false),
        QuizQuestion(
            image: "The Ice Age Adventures of Buck Wild",
            text: "Рейтинг этого фильма больше чем 5?",
            correctAnswer: false),
        QuizQuestion(
            image: "Tesla",
            text: "Рейтинг этого фильма больше чем 5?",
            correctAnswer: false),
        QuizQuestion(
            image: "Vivarium",
            text: "Рейтинг этого фильма больше чем 5?",
            correctAnswer: false)
    ]
    //Объявляем функцию requestNextQuestion, которая ничего не принемает и возвращает
    // опциональную модель QuizQuestion.
    func requestNextQuestion() -> QuizQuestion? {
        //выбираем индекс вопроса из массива questions, который мы хотим вернуть.
        // Но вопрос должен быть случайным. Применяем функцию randomElement,
        // Она случайным образом выбирает одно число из диопазона.
        // Так как функция возвращает опционал нам его нужно распоковать.
        guard let index = (0..<questions.count).randomElement() else {
            return nil
        }
        // Когда у нас есть случайный индекс, возьмем элемент из массива по этому
        // индексу - но используем - сабскрипт.
        // Сабскрипт(safe) - это функция которую добавляем в расширение массива.
        // Этим термином обозначают сокращенный вариант доступа к члену коллекции.
        return questions[safe: index]
    }

}

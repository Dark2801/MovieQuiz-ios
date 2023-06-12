//
//  QuestionFactoryProtocol.swift
//  MovieQuiz
//
//  Created by Андрей Мерзликин on 12.06.2023.
//

import Foundation

protocol QuestionFactoryProtocol {
    func requestNextQuestion() -> QuizQuestion?
}

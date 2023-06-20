//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Андрей Мерзликин on 19.06.2023.
//

import Foundation
protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)
}

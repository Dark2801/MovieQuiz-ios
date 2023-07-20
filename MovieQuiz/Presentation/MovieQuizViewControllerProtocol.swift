//
//  MovieQuizViewControllerProtocol.swift
//  MovieQuiz
//
//  Created by Андрей Мерзликин on 20.07.2023.
//

import Foundation

protocol MovieQuizViewControllerProtocol: AnyObject {
    func show(quiz step: QuizStepViewModel)
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func highlightImageBorder(isCorrect: Bool)
    func clearImageBorder()
    func enableUserInteraction()
    func disableUserInteraction()
}

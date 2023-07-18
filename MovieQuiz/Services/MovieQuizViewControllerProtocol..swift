//
//  MovieQuizViewControllerProtocol..swift
//  MovieQuiz
//
//  Created by Андрей Мерзликин on 18.07.2023.
//

import Foundation
protocol MovieQuizViewControllerProtocol: AnyObject {
    func show(quiz step: QuizStepViewModel)
    func makeResult()
    func highlightImageBorder(isCorrectAnswer: Bool)
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showNetworkError(message: String)
}

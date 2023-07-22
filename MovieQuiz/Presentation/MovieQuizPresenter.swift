//
//  MovieQuizPresenter.swift
//  MovieQuiz
//
//  Created by Андрей Мерзликин on 17.07.2023.
//
import UIKit

final class MovieQuizPresenter: QuestionFactoryDelegate {
    private let statisticService: StatisticService!
    private let questionFactory: QuestionFactoryProtocol
    private var currentQuestion: QuizQuestion?
    private weak var viewController: MovieQuizViewController?
    private var correctAnswers = 0
    private let questionsAmount: Int = 10
    private var currentQuestionIndex: Int = 0
    init(viewController: MovieQuizViewControllerProtocol) {
        self.viewController = viewController as? MovieQuizViewController
        statisticService = StatisticServiceImplementation()
        questionFactory = QuestionFactory(moviesLoader: MoviesLoader(), delegate: self)
        questionFactory.loadData()
}
    func didReceiveNextQuestion(question: QuizQuestion?) {
        guard let question = question else {
            return
}
        currentQuestion = question
        let viewModel = convert(model: question)
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.show(quiz: viewModel)
}
}
func didLoadDataFromServer() {
        viewController?.hideLoadingIndicator()
        questionFactory.requestNextQuestion()
}
func didFailToLoadData(with error: Error) {
        let message = error.localizedDescription
        viewController?.showNetworkError(message: message)
}
func yesButtonClicked() {
        didAnswer(isYes: true)
}
func noButtonClicked() {
        didAnswer(isYes: false)
}
private func didAnswer(isYes: Bool) {
        guard let currentQuestion = currentQuestion else {
            return
}
let givenAnswer = isYes
        showAnswerResult(isCorrect: givenAnswer == currentQuestion.correctAnswer)
        viewController?.buttonsAreBlocked()
}
func convert(model: QuizQuestion) -> QuizStepViewModel {
        QuizStepViewModel(
            image: UIImage(data: model.image) ?? UIImage(),
            question: model.text,
            questionNumber: "\(currentQuestionIndex + 1)/\(questionsAmount)")
}
func isLastQuestion() -> Bool {
        currentQuestionIndex == questionsAmount - 1
}
func restartGame() {
        currentQuestionIndex = 0
        correctAnswers = 0
        questionFactory?.requestNextQuestion()
}
func switchToNextQuestion() {
        currentQuestionIndex += 1
}
func showNextQuestionOrResults() {
        viewController?.hideLoadingIndicator()
        if isLastQuestion() {
            viewController?.makeResult()
            viewController?.clearBorder()
            viewController?.buttonsAreActive()
} else {
            switchToNextQuestion()
            questionFactory?.requestNextQuestion()
            viewController?.clearBorder()
            viewController?.buttonsAreActive()
}
}
func didAnswer(isCorrectAnswer: Bool) {
        correctAnswers += 1
}
func makeResultMessage() -> String {
    guard let statisticService = statisticService else { return "" }
    
    statisticService.store(correct: correctAnswers, total: questionsAmount)
    
    let text = """
               Ваш результат: \(correctAnswers)/\(questionsAmount)
               Количество сыгранных квизов: \(statisticService.gamesCount)
               Рекорд: \(statisticService.bestGame.correct)/\(statisticService.bestGame.total) (\(statisticService.bestGame.date.dateTimeString))
               Средняя точность: \(String(format: "%.2f", statisticService.totalAccuracy))%
               """
    return text
}
func showAnswerResult(isCorrect: Bool) {
        if isCorrect {
            didAnswer(isCorrectAnswer: isCorrect)
        }
        viewController?.highlightImageBorder(isCorrectAnswer: isCorrect)
        viewController?.showLoadingIndicator()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.showNextQuestionOrResults()
}
}
}

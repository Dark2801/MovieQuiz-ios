import UIKit

final class MovieQuizViewController: UIViewController, MovieQuizViewControllerProtocol {
    private var gamesCount = 0
    private var alertPresenter: AlertPresenter?
    private var presenter: MovieQuizPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = 20
        showLoadingIndicator()
        alertPresenter = AlertPresenterImpl(viewController: self)
        presenter = MovieQuizPresenter(viewController: self)
}
    @IBOutlet weak private var noButton: UIButton!
    @IBOutlet weak private var yesButton: UIButton!
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var textLabel: UILabel!
    @IBOutlet weak private var counterLabel: UILabel!
    @IBAction private func noButtonClicked(_ sender: UIButton) {
        presenter.noButtonClicked()
}
   @IBAction private func yesButtonClicked(_ sender: UIButton) {
      presenter.yesButtonClicked()
}
    @IBOutlet weak private var labelQuestion: UILabel!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    func show(quiz step: QuizStepViewModel) {
        imageView.image = step.image
        textLabel.text = step.question
        counterLabel.text = step.questionNumber
}
func makeResult() {
       let alertModel = AlertModel(
            title: "Этот раунд окончен!",
            message: presenter.makeResultMessage(),
            buttonText: "Сыграть ещё раз",
            buttonAction: { [weak self] in
                self?.presenter.restartGame()
}
)
 alertPresenter?.show(alertModel: alertModel)
}
func showNetworkError(message: String) {
        activityIndicator.isHidden = true
        let alertModel = AlertModel(title: "Ошибка",
                                    message: message,
                                    buttonText: "Попробовать еще раз",
                                    buttonAction: { [weak self] in
            guard let self = self else { return }
            self.presenter.restartGame()
}
)
        alertPresenter?.show(alertModel: alertModel)
}
func buttonsAreBlocked() {
        yesButton.isEnabled = false
        noButton.isEnabled = false
}
func buttonsAreActive() {
        noButton.isEnabled = true
        yesButton.isEnabled = true
}
func showLoadingIndicator() {
    // говорит, что индикатор загрузки не скрыт
        activityIndicator.isHidden = false
    // включаем анимацию
        activityIndicator.startAnimating()
}
func hideLoadingIndicator() {
        activityIndicator.isHidden = true
}
func clearBorder() {
        imageView.layer.borderColor = UIColor.clear.cgColor
        imageView.layer.borderWidth = 0
}
func highlightImageBorder(isCorrectAnswer: Bool) {
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 8
        imageView.layer.borderColor = isCorrectAnswer ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
}
}
/**
 Mock-данные
 
 
 Картинка: The Godfather
 Настоящий рейтинг: 9,2
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА


 Картинка: The Dark Knight
 Настоящий рейтинг: 9
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА


 Картинка: Kill Bill
 Настоящий рейтинг: 8,1
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА


 Картинка: The Avengers
 Настоящий рейтинг: 8
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА


 Картинка: Deadpool
 Настоящий рейтинг: 8
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА


 Картинка: The Green Knight
 Настоящий рейтинг: 6,6
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА


 Картинка: Old
 Настоящий рейтинг: 5,8
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: НЕТ


 Картинка: The Ice Age Adventures of Buck Wild
 Настоящий рейтинг: 4,3
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: НЕТ


 Картинка: Tesla
 Настоящий рейтинг: 5,1
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: НЕТ


 Картинка: Vivarium
 Настоящий рейтинг: 5,8
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: НЕТ
 */

//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by Андрей Мерзликин on 19.06.2023.
//

import Foundation
import UIKit

protocol AlertPresenter {
func show(alertModel: AlertModel)
}
final class AlertPresenterImpl {
    private weak var viewController: UIViewController?
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
}
}
extension AlertPresenterImpl: AlertPresenter {
func show(alertModel: AlertModel) {
let alert = UIAlertController(
            title: alertModel.title,
            message: alertModel.message,
            preferredStyle: .alert
            )
alert.view.accessibilityIdentifier = "Game results"
let action = UIAlertAction(title: alertModel.buttonText, style: .default) { _ in
            alertModel.buttonAction()
}
alert.addAction(action)
viewController?.present(alert, animated: true)
}
}

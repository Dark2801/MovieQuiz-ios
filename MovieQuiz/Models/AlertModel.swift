//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Андрей Мерзликин on 19.06.2023.
//

import Foundation
import UIKit

struct AlertModel {
    let title: String
    let message: String
    let buttonText: String
    let buttonAction: (() -> Void)
}

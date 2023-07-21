//
//  BestGame.swift
//  MovieQuiz
//
//  Created by Андрей Мерзликин on 19.06.2023.
//
import Foundation
struct GameRecord: Codable, Comparable {
    let correct: Int
    let total: Int
    let date: Date
    static func < (lhs: GameRecord, rhs: GameRecord) -> Bool {
        lhs.correct < rhs.correct
    }
}
   
  

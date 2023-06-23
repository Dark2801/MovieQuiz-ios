//
//  MostPopularMovies.swift
//  MovieQuiz
//
//  Created by Андрей Мерзликин on 23.06.2023.
//

import Foundation

struct MostPopularMovies {
    let errorMessage: String
    let items: [MostPopularMovies]
}

struct MostPopularMovie {
    let title: String
    let rating: String
    let image: URL
}

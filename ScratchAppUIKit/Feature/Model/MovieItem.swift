//
//  MovieItem.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky W on 13/09/22.
//

import Foundation

struct MovieItemModel {
    let posterPath: String
    let adult: Bool
    let overview: String
    let releaseDate: String
    let genres: [MovieGenreItem]
    let id: Int
    let originalTitle: String
    let originalLanguage: String
    let title: String
    let backdropPath: String
    let popularity: Double
    let voteCount: Int
    let video: Bool
    let voteAverage: Double
}

struct MovieGenreItem {
    let id: Int
    let name: String
}

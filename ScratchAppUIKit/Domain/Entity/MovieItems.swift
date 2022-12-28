//
//  MovieListItems.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky W on 23/06/22.
//

import Foundation

struct MovieListRoot: Codable {
    let page: Int?
    let results: [MovieItems]?
    let resultPages: Int?
    let totalPages: Int?
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case resultPages = "result_pages"
        case totalPages = "total_pages"
    }
}

struct MovieItems: Codable {
    let posterPath: String?
    let adult: Bool?
    let overview: String?
    let releaseDate: String?
    let genreIds: [Int]?
    let id: Int?
    let originalTitle: String?
    let originalLanguage: String?
    let title: String?
    let backdropPath: String?
    let popularity: Double?
    let voteCount: Int?
    let video: Bool?
    let voteAverage: Double?
    let homepage: String?
    let genre: [MovieGenre]?
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case adult
        case overview
        case releaseDate = "release_date"
        case genreIds = "genre_ids"
        case id
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case title
        case backdropPath = "backdrop_path"
        case popularity
        case voteCount = "vote_count"
        case video
        case voteAverage = "vote_average"
        case homepage
        case genre
    }
}

struct MovieGenre: Codable {
    let id: Int
    let name: String
}

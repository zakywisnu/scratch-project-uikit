//
//  MovieDetailMapper.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky W on 13/09/22.
//

import Foundation

final class MovieDetailMapper {
    
    static func mapMovieDetail (
        input movie: MovieItems
    ) -> MovieItemModel {
        return MovieItemModel(
            posterPath: movie.posterPath ?? "",
            adult: movie.adult ?? false,
            overview: movie.overview ?? "",
            releaseDate: movie.releaseDate ?? "",
            genres: [],
            id: movie.id ?? 0,
            originalTitle: movie.originalTitle ?? "",
            originalLanguage: movie.originalLanguage ?? "",
            title: movie.title ?? "",
            backdropPath: movie.backdropPath ?? "",
            popularity: movie.popularity ?? 0,
            voteCount: movie.voteCount ?? 0,
            video: movie.video ?? false,
            voteAverage: movie.voteAverage ?? 0
        )
    }
    
}

//
//  MovieListMapper.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky W on 06/08/22.
//

import Foundation

final class MovieListMapper {
    
    static func mapMovieList(
        input movieList: [MovieItems]
    ) -> [MovieListModel] {
        return movieList.map { result in
            return MovieListModel(
                posterPath: result.posterPath ?? "",
                adult: result.adult ?? false,
                overview: result.overview ?? "",
                releaseDate: result.releaseDate ?? "",
                genreIds: result.genreIds?.map { $0 } ?? [],
                id: result.id  ?? 0,
                originalTitle: result.originalTitle ?? "",
                originalLanguage: result.originalLanguage ?? "",
                title: result.title ?? "",
                backdropPath: result.backdropPath ?? "",
                popularity: result.popularity ?? 0,
                voteCount: result.voteCount ?? 0,
                video: result.video ?? false,
                voteAverage: result.voteAverage ?? 0
            )
        }
    }    
}

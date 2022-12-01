//
//  MovieListDataFactory.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky W on 03/07/22.
//

import Foundation
import RxSwift

protocol MovieListDataFactoryInterface {
    func getNowPlayingList() -> Single<MovieListRoot>
    func getUpcomingList() -> Single<MovieListRoot>
    func getTopRatedList() -> Single<MovieListRoot>
    func getPopularList() -> Single<MovieListRoot>
}

class MovieListDataFactory: MovieListDataFactoryInterface {
    
    func getNowPlayingList() -> Single<MovieListRoot> {
        return NowPlayingListInteractor().result()
    }
    
    func getUpcomingList() -> Single<MovieListRoot> {
        return NowPlayingListInteractor().result()
    }
    
    func getTopRatedList() -> Single<MovieListRoot> {
        return NowPlayingListInteractor().result()
    }
    
    func getPopularList() -> Single<MovieListRoot> {
        return NowPlayingListInteractor().result()
    }
    
}

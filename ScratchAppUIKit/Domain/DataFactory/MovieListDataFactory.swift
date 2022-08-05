//
//  MovieListDataFactory.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky W on 03/07/22.
//

import Foundation
import RxSwift

class MovieListDataFactory {
    
    static let shared = MovieListDataFactory()
    
    private init() {}
    
    func getNowPlayingList() -> Single<MovieListRoot> {
        return NowPlayingListUseCase().result()
    }
    
}

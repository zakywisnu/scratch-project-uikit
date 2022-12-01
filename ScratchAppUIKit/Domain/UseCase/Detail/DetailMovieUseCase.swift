//
//  DetailMovieUseCase.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky W on 13/09/22.
//

import Foundation
import RxSwift

protocol DetailMovieUseCase {
    func result() -> Single<MovieItems>
}

class DetailMovieInteractor: DetailMovieUseCase {
    private let disposeBag = DisposeBag()
    
    private let movieId: Int
    
    init(movieId: Int) {
        self.movieId = movieId
    }
    
    func result() -> Single<MovieItems> {
        return Single.create { observer in
            let dataSource = DataSource<MovieItems>(strategy: .cacheFirst, endpoint: MovieEndpoint.detail(movieId: self.movieId))
            
            let result = dataSource.result()
            
            result
                .observe(on: ConcurrentDispatchQueueScheduler(qos: .userInitiated))
                .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .userInitiated))
                .subscribe { result in
                    observer(.success(result))
                } onFailure: { error in
                    observer(.failure(error))
                }.disposed(by: self.disposeBag)
            
            return Disposables.create()

        }
    }
}

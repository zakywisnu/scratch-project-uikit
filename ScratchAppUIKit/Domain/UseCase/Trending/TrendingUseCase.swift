//
//  LatestUseCase.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky Wishnumurti on 26/12/22.
//

import Foundation
import RxSwift

protocol TrendingListUseCase {
    func result() -> Single<MovieListRoot>
}

class TrendingListInteractor: TrendingListUseCase {
    private let disposeBag = DisposeBag()
    
    func result() -> Single<MovieListRoot> {
        return Single.create { observer in
            let dataSource = DataSourceImpl<MovieListRoot>(
                strategy: .remoteOnly,
                endpoint: MovieEndpoint.trending
            )
            
            let result = dataSource.result()
            
            result
                .observe(on: ConcurrentDispatchQueueScheduler(qos: .background))
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

//
//  NowPlayingListUseCase.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky W on 03/07/22.
//

import Foundation
import RxSwift

protocol NowPlayingListUseCase {
    func result() -> Single<MovieListRoot>
}

class NowPlayingListInteractor: NowPlayingListUseCase {
    private let disposeBag = DisposeBag()
    
    func result() -> Single<MovieListRoot> {
        return Single.create { observer in
            let dataSource = DataSourceImpl<MovieListRoot>(
                strategy: .remoteOnly,
                endpoint: MovieEndpoint.nowPlayingList
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

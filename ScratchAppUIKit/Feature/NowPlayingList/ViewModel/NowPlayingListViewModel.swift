//
//  NowPlayingListViewModel.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky W on 03/07/22.
//

import Foundation
import RxSwift

protocol NowPlayingListViewModel {
    
    func fetchList()
    
}

struct NowPlayingListDefaultViewModel: NowPlayingListViewModel {
    
    private let disposeBag = DisposeBag()
    
    func fetchList() {
        MovieListDataFactory.shared.getNowPlayingList()
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .background))
            .observe(on: MainScheduler.instance)
            .subscribe { movieList in
                guard let result = movieList.results else { return }
                print("ini movie: ", result)
            } onFailure: { error in
                print("kok error: ", error.localizedDescription)
            }.disposed(by: disposeBag)

    }
}

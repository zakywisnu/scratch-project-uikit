//
//  NowPlayingListViewModel.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky W on 03/07/22.
//

import Foundation
import RxSwift
import RxRelay

protocol NowPlayingListViewModel {
    var movie: Observable<[MovieListModel]> { get }
    
    func fetchList()
}

final class NowPlayingListDefaultViewModel: NowPlayingListViewModel {
    private let _movie: BehaviorRelay<[MovieListModel]> = .init(value: [])
    private let useCase: NowPlayingListUseCase
    
    init(useCase: NowPlayingListUseCase) {
        self.useCase = useCase
    }
    
    var movie: Observable<[MovieListModel]> {
        _movie.asObservable()
    }
    
    private let disposeBag = DisposeBag()
    
    func fetchList() {
        useCase.result()
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .userInitiated))
            .observe(on: MainScheduler.instance)
            .subscribe { [weak self] movieList in
                guard let result = movieList.results else { return }
                let movies = MovieListMapper.mapMovieList(input: result)
                self?._movie.accept(movies)
            } onFailure: { error in
                print("kok error: ", error.localizedDescription)
            }.disposed(by: disposeBag)

    }
}

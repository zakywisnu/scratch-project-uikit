//
//  HomeViewModel.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky Wishnumurti on 26/12/22.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

protocol HomeViewModel {
    var trendingMovie: Observable<[MovieListModel]> { get }
    
    func fetchTrendingMovie()
}

final class HomeDefaultViewModel: HomeViewModel {
    private let _trendingMovie: BehaviorRelay<[MovieListModel]> = .init(value: [])
    private let disposeBag = DisposeBag()
    private let useCase: TrendingListUseCase
    
    init(useCase: TrendingListUseCase) {
        self.useCase = useCase
    }
    
    var trendingMovie: Observable<[MovieListModel]> {
        _trendingMovie.asObservable()
    }
    
    func fetchTrendingMovie() {
        useCase.result()
            .observe(on: ConcurrentDispatchQueueScheduler(qos: .userInitiated))
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .userInitiated))
            .subscribe(onSuccess: { [weak self] movieList in
                guard let self = self, let result = movieList.results else { return }
                let movies = MovieListMapper.mapMovieList(input: result)
                self._trendingMovie.accept(movies)
            }, onFailure: { error in
                print(error.localizedDescription)
            })
            .disposed(by: disposeBag)
    }
}

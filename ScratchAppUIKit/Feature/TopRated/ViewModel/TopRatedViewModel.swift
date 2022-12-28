//
//  TopRatedViewModel.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky W on 19/08/22.
//

import Foundation
import RxSwift
import RxCocoa

protocol TopRatedViewModel {
    var movie: Observable<[MovieListModel]> { get }
    func fetchList()
}

final class TopRatedDefaultViewModel: TopRatedViewModel {
    
    private let _movie: BehaviorRelay<[MovieListModel]> = .init(value: [])
    
    private let useCase: TopRatedListUseCase
    private let disposeBag = DisposeBag()
    
    init(useCase: TopRatedListUseCase) {
        self.useCase = useCase
    }
    
    var movie: Observable<[MovieListModel]> {
        _movie.asObservable()
    }
    
    
    func fetchList() {
        useCase.result()
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .userInitiated))
            .observe(on: ConcurrentDispatchQueueScheduler(qos: .userInitiated))
            .subscribe { [weak self] movieList in
                guard let result = movieList.results else { return }
                let movies = MovieListMapper.mapMovieList(input: result)
                self?._movie.accept(movies)
            } onFailure: { error in
                print("error lagi: ", error.localizedDescription)
            }
            .disposed(by: disposeBag)
    }
    
}

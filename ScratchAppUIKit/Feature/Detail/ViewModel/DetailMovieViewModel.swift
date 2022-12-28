//
//  DetailMovieViewModel.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky W on 13/09/22.
//

import Foundation
import RxSwift
import RxRelay

protocol DetailMovieViewModel {
    var movie: Observable<MovieItemModel> { get }
    
    func fetchMovieDetail()
}

final class DetailMovieDefaultViewModel: DetailMovieViewModel {
    
    private let _movie: BehaviorRelay<MovieItemModel?> = .init(value: nil)
    private let disposeBag = DisposeBag()
    private let useCase: DetailMovieUseCase
    private let movieId: Int
    
    init(useCase: DetailMovieUseCase, movieId: Int) {
        self.useCase = useCase
        self.movieId = movieId
    }
    
    var movie: Observable<MovieItemModel> {
        _movie
            .compactMap { movie in
                return movie
            }
    }
    
    func fetchMovieDetail() {
        useCase.result(id: movieId)
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .userInitiated))
            .observe(on: ConcurrentDispatchQueueScheduler(qos: .userInitiated))
            .subscribe(onSuccess: { [weak self] movie in
                guard let self = self else { return }
                self._movie.accept(MovieDetailMapper.mapMovieDetail(input: movie))
            }, onError: { error in
                print(error.localizedDescription)
            }).disposed(by: disposeBag)
            
    }
    
}

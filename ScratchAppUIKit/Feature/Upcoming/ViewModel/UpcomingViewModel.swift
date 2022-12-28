//
//  UpcomingViewModel.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky W on 19/08/22.
//

import Foundation
import RxSwift
import RxCocoa

protocol UpcomingViewModel {
    var movie: Observable<[MovieListModel]> { get }
    
    func fetchList()
}

final class UpcomingDefaultViewModel: UpcomingViewModel {
    
    private let _movie: BehaviorRelay<[MovieListModel]> = .init(value: [])
    
    private let useCase: UpcomingListUseCase
    
    private let disposeBag = DisposeBag()
    
    init(useCase: UpcomingListUseCase) {
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
                print("error maning: ", error.localizedDescription)
            }
            .disposed(by: disposeBag)

    }
}

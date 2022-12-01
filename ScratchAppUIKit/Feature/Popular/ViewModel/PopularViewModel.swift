//
//  PopularViewModel.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky W on 19/08/22.
//

import Foundation
import RxSwift
import RxRelay

protocol PopularViewModel {
    var movie: Observable<[MovieListModel]> { get }
    
    func fetchList()
}

struct PopularDefaultViewModel: PopularViewModel {
    private let _movie: BehaviorRelay<[MovieListModel]> = .init(value: [])
    private let dataFactory: MovieListDataFactoryInterface
    private let disposeBag = DisposeBag()
    
    init(dataFactory: MovieListDataFactoryInterface) {
        self.dataFactory = dataFactory
    }
    
    var movie: Observable<[MovieListModel]> {
        _movie.asObservable()
    }
    
    func fetchList() {
        dataFactory.getPopularList()
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .userInitiated))
            .observe(on: MainScheduler.instance)
            .subscribe(onSuccess: { movieList in
                guard let result = movieList.results else { return }
                let movies = MovieListMapper.mapMovieList(input: result)
                _movie.accept(movies)
            }).disposed(by: disposeBag)
    }
    
}

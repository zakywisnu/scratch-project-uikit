//
//  Utils.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky W on 23/06/22.
//

import Foundation

struct Injection {
    
    static func makeNowPlayingVC() -> NowPlayingListViewController {
        let dataSource = DataSourceImpl<MovieListRoot>(strategy: .remoteOnly, endpoint: MovieEndpoint.nowPlayingList)
        let viewModel = NowPlayingListDefaultViewModel(
            useCase: NowPlayingListInteractor()
        )
        return NowPlayingListViewController(viewModel: viewModel)
    }
    
    static func makeUpcomingVC() -> UpcomingViewController {
        let dataSource = DataSourceImpl<MovieListRoot>(strategy: .remoteOnly, endpoint: MovieEndpoint.upcoming)
        let viewModel = UpcomingDefaultViewModel(
            useCase: UpcomingListInteractor()
        )
        return UpcomingViewController(viewModel: viewModel)
    }
    
    static func makeTopRatedVC() -> TopRatedViewController {
        let viewModel = TopRatedDefaultViewModel(
            useCase: TopRatedListInteractor()
        )
        return TopRatedViewController(viewModel: viewModel)
    }
    
    static func makePopularVC() -> PopularViewController {
        let viewModel = PopularDefaultViewModel(
            useCase: PopularListInteractor()
        )
        return PopularViewController(viewModel: viewModel)
    }
    
    static func makeDetailVC(id: Int) -> DetailMovieViewController {
        let viewModel = DetailMovieDefaultViewModel(
            useCase: DetailMovieInteractor(),
            movieId: id
        )
        return DetailMovieViewController(viewModel: viewModel)
    }
}

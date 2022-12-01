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
    var movie: Observable<[MovieListModel]> { get }
    
    func getMovieDetail()
}

//struct DetailMovieDefaultViewModel: DetailMovieViewModel {
//    
//    
//    
//}

//
//  HomePagingView.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky Wishnumurti on 26/12/22.
//

import Foundation
import UIKit

protocol HomePagingViewModel {
    func getTabVC() -> [UIViewController]
    
    func getBarTitle(index: Int) -> String
}

final class HomePagingDefaultViewModel: HomePagingViewModel {
    
    private let barTitle: [String] = [
        "Now Playing",
        "Upcoming",
        "TopRated",
        "Popular"
    ]
    
    func getTabVC() -> [UIViewController] {
        return [Injection.makeNowPlayingVC(), Injection.makeUpcomingVC(), Injection.makeTopRatedVC(), Injection.makePopularVC()]
    }
    
    func getBarTitle(index: Int) -> String {
        return barTitle[index]
    }
}

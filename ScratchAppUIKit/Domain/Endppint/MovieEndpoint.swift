//
//  MovieEndpoint.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky W on 03/07/22.
//

import Foundation

enum MovieEndpoint: Endpoint {
    
    case nowPlayingList
    case popularList
    case topRatedList
    case upcoming
    case detail(movieId: Int)
    
    var baseUrl: String {
        return MovieConstant().baseUrl
    }
    
    var path: String {
        switch self {
        case .nowPlayingList:
            return "movie/now_playing"
        case .popularList:
            return "movie/popular"
        case .topRatedList:
            return "movie/top_rated"
        case .upcoming:
            return "movie/upcoming"
        case .detail(let movieId):
            return "movie/\(movieId)"
        }
    }
    
    var method: RemoteMethod {
        switch self {
        case .nowPlayingList, .popularList, .topRatedList, .upcoming, .detail:
            return .get
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .nowPlayingList, .popularList, .topRatedList, .upcoming, .detail:
            return nil
        }
    }
    
    
}

//
//  DataSource.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky W on 23/06/22.
//

import Foundation
import RxSwift

class DataSource<T: Codable> {
    
    private let strategy: DataFetchStrategy
    private let endpoint: Endpoint
    private let remoteDataSource = RemoteDataSource<T>()
    
    init(strategy: DataFetchStrategy, endpoint: Endpoint) {
        self.strategy = strategy
        self.endpoint = endpoint
    }
    
    func result() -> Single<T> {
        switch strategy {
        case .cacheFirst:
            return remoteDataSource.makeRequest(endpoint: endpoint)
        case .remoteOnly:
            return remoteDataSource.makeRequest(endpoint: endpoint)
        case .remoteWithCache:
            return remoteDataSource.makeRequest(endpoint: endpoint)
        }
    }
    
}

//
//  DataSource.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky W on 23/06/22.
//

import Foundation
import RxSwift

//protocol DataSource {
//    func result<T: Decodable>() -> Single<T>
//}

final class DataSourceImpl<Entity: Decodable> {
    
    private let strategy: DataFetchStrategy
    private let endpoint: Endpoint
    private let remoteDataSource: RemoteDataSource
    private let localDataSource: LocalDataSource
    
    init(
        strategy: DataFetchStrategy,
        endpoint: Endpoint,
        remoteDataSource: RemoteDataSource = RemoteDataSourceImpl(),
        localDataSource: LocalDataSource = LocalDataSourceImpl()
    ) {
        self.strategy = strategy
        self.endpoint = endpoint
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    
    func result() -> Single<Entity> {
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

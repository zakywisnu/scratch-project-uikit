//
//  RemoteDataSource.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky W on 23/06/22.
//

import Foundation
import RxSwift

protocol RemoteDataSource {
    func makeRequest<T: Decodable>(endpoint: Endpoint) -> Single<T>
}

struct RemoteDataSourceImpl: RemoteDataSource {
    
    private var urlSession = URLSession(configuration: .default)
    
    func makeRequest<T: Decodable>(endpoint: Endpoint) -> Single<T> {
        Single.create { observer in
            let urlRequest = createUrlRequest(endpoint: endpoint)
            
            let task = urlSession.dataTask(with: urlRequest) { (data, response, error) in
                guard let response = response as? HTTPURLResponse else {
                    observer(.failure(URLError.notHTTPResponse(data: data, response: response)))
                    return
                }

                guard 200 <= response.statusCode && response.statusCode < 300 else {
                    observer(.failure(URLError.failedResponse(data: data, response: response)))
                    return
                }
                
                guard let data = data else {
                    observer(.failure(error ?? RxError.unknown))
                    return
                }
                
                do {
                    let objs = try JSONDecoder().decode(T.self, from: data)
                    observer(.success(objs))
                } catch {
                    observer(.failure(URLError.failedDecoding(data: data)))
                }
            }
            
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
    private func constructUrl(endpoint: Endpoint) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = endpoint.baseUrl
        components.path = "/3/" + endpoint.path
        let apiQuery = URLQueryItem(name: "api_key", value: MovieConstant().movieApiKey)
        var query: [URLQueryItem] = []
        query.append(apiQuery)
        if let endpointQuery = endpoint.queryItems {
            for element in endpointQuery {
                query.append(element)
            }
        }
        components.queryItems = query
        
        guard let url = components.url else {
            preconditionFailure(
                "Invalid URL Components: \(components)"
            )
        }
        
        return url
    }
    
    private func createUrlRequest(endpoint: Endpoint) -> URLRequest {
        let url = constructUrl(endpoint: endpoint)
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        return request
    }
}


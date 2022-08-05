//
//  Endpoint.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky W on 24/06/22.
//

import Foundation

protocol Endpoint {
    var baseUrl: String { get }
    
    var path: String { get }
    
    var method: RemoteMethod { get }
    
    var headers: [String: Any]? { get }
    
    var queryItems: [URLQueryItem]? { get }
}

extension Endpoint {
    
    public var headers: [String: Any]? {
        nil
    }
    
}

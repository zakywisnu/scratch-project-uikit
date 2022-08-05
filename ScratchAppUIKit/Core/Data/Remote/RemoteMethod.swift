//
//  RemoteMethod.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky W on 24/06/22.
//

import Foundation

enum RemoteMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}

enum URLError: Error {
    case notHTTPResponse(data: Data?, response: URLResponse?)
    case failedResponse(data: Data?, response: HTTPURLResponse)
    case failedDecoding(data: Data?)
}

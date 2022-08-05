//
//  UseCase.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky W on 24/06/22.
//

import Foundation
import RxSwift

protocol UseCase {
    associatedtype Entity: Decodable
    
    func result() -> Single<Entity>
}

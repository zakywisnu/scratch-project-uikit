//
//  LocalDataSource.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky W on 23/06/22.
//

import Foundation

protocol LocalDataSource {
    func saveData<T>(_ data: T)
}

final class LocalDataSourceImpl: LocalDataSource {
    
    func saveData<T>(_ data: T) {
        
    }
}

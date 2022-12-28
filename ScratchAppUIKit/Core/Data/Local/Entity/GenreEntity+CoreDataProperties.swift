//
//  GenreEntity+CoreDataProperties.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky Wishnumurti on 27/12/22.
//
//

import Foundation
import CoreData


extension GenreEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GenreEntity> {
        return NSFetchRequest<GenreEntity>(entityName: "GenreEntity")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String?

}

extension GenreEntity : Identifiable {

}

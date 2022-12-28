//
//  MovieEntity+CoreDataProperties.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky Wishnumurti on 27/12/22.
//
//

import Foundation
import CoreData


extension MovieEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieEntity> {
        return NSFetchRequest<MovieEntity>(entityName: "MovieEntity")
    }

    @NSManaged public var adult: Bool
    @NSManaged public var backdropPath: String?
    @NSManaged public var id: Int32
    @NSManaged public var originalLanguage: String?
    @NSManaged public var originalTitle: String?
    @NSManaged public var overview: String?
    @NSManaged public var popularity: Double
    @NSManaged public var posterPath: String?
    @NSManaged public var releaseData: String?
    @NSManaged public var title: String?
    @NSManaged public var video: Bool
    @NSManaged public var voteAverage: Double
    @NSManaged public var voteCount: Int32
    @NSManaged public var genres: NSSet?

}

// MARK: Generated accessors for genres
extension MovieEntity {

    @objc(addGenresObject:)
    @NSManaged public func addToGenres(_ value: GenreEntity)

    @objc(removeGenresObject:)
    @NSManaged public func removeFromGenres(_ value: GenreEntity)

    @objc(addGenres:)
    @NSManaged public func addToGenres(_ values: NSSet)

    @objc(removeGenres:)
    @NSManaged public func removeFromGenres(_ values: NSSet)

}

extension MovieEntity : Identifiable {

}

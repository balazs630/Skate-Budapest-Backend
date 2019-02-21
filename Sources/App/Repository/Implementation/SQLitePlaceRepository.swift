//
//  SQLitePlaceRepository.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 26..
//

import Vapor
import FluentSQLite

final class SQLitePlaceRepository {
    private let db: SQLiteDatabase.ConnectionPool

    init(_ db: SQLiteDatabase.ConnectionPool) {
        self.db = db
    }
}

// MARK: PlaceRepositoryInterface conformances
extension SQLitePlaceRepository: PlaceRepositoryInterface {
    func findAllPlaces() -> Future<[(Place, [PlaceImage])]> {
        return db.withConnection { conn in
            Place.query(on: conn)
                .all()
                .flatMap { places in
                    places.map { place in
                        PlaceImage.query(on: conn)
                            .all()
                            .map { images in
                                return (place, images)
                        }
                    }.flatten(on: conn)
            }
        }
    }

    func findPlaceInfo() -> Future<PlaceInfo?> {
        return db.withConnection { conn in
            PlaceInfo.query(on: conn)
                .first()
        }
    }

    func findPlaceSuggestions() -> Future<[PlaceSuggestion]> {
        return db.withConnection { conn in
            PlaceSuggestion.query(on: conn)
                .all()
        }
    }

    func savePlaceSuggestion(suggestion: PlaceSuggestion) -> Future<PlaceSuggestion> {
        return db.withConnection { conn in
            PlaceSuggestion.query(on: conn)
                .create(suggestion)
        }
    }
}

// MARK: ServiceType conformances
extension SQLitePlaceRepository: ServiceType {
    static let serviceSupports: [Any.Type] = [PlaceRepositoryInterface.self]

    static func makeService(for worker: Container) throws -> Self {
        return .init(try worker.connectionPool(to: .sqlite))
    }
}

extension Database {
    public typealias ConnectionPool = DatabaseConnectionPool<ConfiguredDatabase<Self>>
}
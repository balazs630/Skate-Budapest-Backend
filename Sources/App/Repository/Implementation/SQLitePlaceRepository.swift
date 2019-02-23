//
//  SQLitePlaceRepository.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 26..
//

import Vapor
import FluentSQLite

final class SQLitePlaceRepository {
    private let database: SQLiteDatabase.ConnectionPool

    init(_ database: SQLiteDatabase.ConnectionPool) {
        self.database = database
    }
}

// MARK: PlaceRepositoryInterface conformances
extension SQLitePlaceRepository: PlaceRepositoryInterface {
    func findAllPlaces() -> Future<[(Place, [PlaceImage])]> {
        return database.withConnection { conn in
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
        return database.withConnection { conn in
            PlaceInfo.query(on: conn)
                .first()
        }
    }

    func findPlaceSuggestions() -> Future<[PlaceSuggestion]> {
        return database.withConnection { conn in
            PlaceSuggestion.query(on: conn)
                .all()
        }
    }

    func savePlaceSuggestion(suggestion: PlaceSuggestion) -> Future<PlaceSuggestion> {
        return database.withConnection { conn in
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

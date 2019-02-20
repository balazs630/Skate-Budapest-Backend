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
    func findAllPlaces() -> Future<[PlaceRequestDTO]> {
        return db.withConnection { conn in
            Place.query(on: conn).all().flatMap { places in
                let placeResponseFutures = places.map { place in
                    PlaceImage.query(on: conn).all().map { images in
                        return PlaceRequestDTO(
                            place: place,
                            placeImages: images
                                .filter { $0.placeId == place.id }
                                .map { $0.imageUrl }
                        )
                    }
                }

                return placeResponseFutures.flatten(on: conn)
            }
        }
    }

    func findPlaceInfo() -> Future<PlaceInfoRequestDTO> {
        return db.withConnection { conn in
            return PlaceInfo
                .query(on: conn)
                .first()
                .unwrap(or: Abort.init(HTTPResponseStatus.notFound))
                .map(to: PlaceInfoRequestDTO.self) {
                    PlaceInfoRequestDTO(dataVersion: $0.dataVersion)
            }
        }
    }

    func findPlaceSuggestions() -> EventLoopFuture<[PlaceSuggestionRequestDTO]> {
        return db.withConnection { conn in
            return PlaceSuggestion
                .query(on: conn)
                .all()
                .map(to: [PlaceSuggestionRequestDTO].self) {
                    $0.map { PlaceSuggestionRequestDTO(place: $0) }
                }
        }
    }

    func savePlaceSuggestion(suggestion: PlaceSuggestionRequestDTO) -> EventLoopFuture<HTTPStatus> {
        return db.withConnection { conn in
            return PlaceSuggestion
                .query(on: conn)
                .create(suggestion.toPlaceSuggestion())
                .map(to: HTTPStatus.self) { _ in
                    return .ok
                }
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

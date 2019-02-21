//
//  PlaceService.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

import Vapor
import FluentSQLite

final class PlaceService {
    private let placeRepository: PlaceRepositoryInterface

    init(placeRepository: PlaceRepositoryInterface) {
        self.placeRepository = placeRepository
    }
}

// MARK: PlaceServiceInterface conformances
extension PlaceService: PlaceServiceInterface {
    func getPlaces() -> Future<[PlaceRequestDTO]> {
        return placeRepository
            .findAllPlaces()
            .map(to: [PlaceRequestDTO].self) { places in
                places.map { placeContent in
                    let (place, images) = placeContent

                    return PlaceRequestDTO(
                        place: place,
                        placeImages: images
                            .filter { $0.placeId == place.id }
                            .map { $0.imageUrl }
                    )
                }
        }
    }

    func getPlaceInfo() -> Future<PlaceInfoRequestDTO> {
        return placeRepository
            .findPlaceInfo()
            .unwrap(or: Abort.init(HTTPResponseStatus.notFound))
            .map(to: PlaceInfoRequestDTO.self) {
                PlaceInfoRequestDTO(dataVersion: $0.dataVersion)
            }
    }

    func getPlaceSuggestions() -> Future<[PlaceSuggestionRequestDTO]> {
        return placeRepository
            .findPlaceSuggestions()
            .map(to: [PlaceSuggestionRequestDTO].self) {
                $0.map { PlaceSuggestionRequestDTO(place: $0) }
            }
    }

    func postPlaceSuggestion(suggestion: PlaceSuggestionRequestDTO) -> Future<HTTPStatus> {
        return placeRepository
            .savePlaceSuggestion(suggestion: suggestion.toPlaceSuggestion())
            .map(to: HTTPStatus.self) { _ in
                return .ok
            }
    }
}

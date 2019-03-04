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
    func getPlaces(for languageCode: LanguageCode) -> Future<[PlaceResponseDTO]> {
        return placeRepository
            .findAllPlaces()
            .map(to: [PlaceResponseDTO].self) { places in
                places.map { placeContent in
                    let (place, images) = placeContent
                    let imageUrls = images
                        .filter { $0.placeId == place.id }
                        .map { $0.imageUrl }

                    return PlaceResponseDTO(place: place, placeImages: imageUrls, languageCode: languageCode)
                }
            }
    }

    func getPlaceInfo() -> Future<PlaceInfoResponseDTO> {
        return placeRepository
            .findPlaceInfo()
            .unwrap(or: Abort.init(HTTPResponseStatus.notFound))
            .map(to: PlaceInfoResponseDTO.self) {
                PlaceInfoResponseDTO(dataVersion: $0.dataVersion)
            }
    }

    func getPlaceSuggestions() -> Future<[PlaceSuggestionResponseDTO]> {
        return placeRepository
            .findPlaceSuggestions()
            .map(to: [PlaceSuggestionResponseDTO].self) { placeSuggestions in
                placeSuggestions.map { PlaceSuggestionResponseDTO(suggestion: $0) }
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

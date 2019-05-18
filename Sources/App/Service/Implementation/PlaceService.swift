//
//  PlaceService.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

import Vapor

final class PlaceService {
    private let placeRepository: PlaceRepositoryInterface

    init(placeRepository: PlaceRepositoryInterface) {
        self.placeRepository = placeRepository
    }
}

// MARK: PlaceServiceInterface conformances
extension PlaceService: PlaceServiceInterface {
    func getPlaces(for languageCode: LanguageCode, status: PlaceStatus) -> Future<[PlaceResponseDTO]> {
        return placeRepository
            .findAllPlaces(status: status)
            .map(to: [PlaceResponseDTO].self) { result in
                let (places, images) = result
                return places.map { place in
                    let imageUrls = images
                        .filter { $0.placeId == place.id }
                        .map { $0.imageUrl }

                    return PlaceResponseDTO(place: place, placeImages: imageUrls, languageCode: languageCode)
                }
            }
    }

    func getPlaceDataVersion() -> Future<PlaceDataVersionResponseDTO> {
        return placeRepository
            .findPlaceDataVersion()
            .unwrap(or: Abort.init(HTTPResponseStatus.notFound))
            .map(to: PlaceDataVersionResponseDTO.self) {
                PlaceDataVersionResponseDTO(dataVersion: $0.dataVersion)
            }
    }

    func getPlaceSuggestions(status: PlaceSuggestionStatus) -> Future<[PlaceSuggestionResponseDTO]> {
        return placeRepository
            .findPlaceSuggestions(status: status)
            .map(to: [PlaceSuggestionResponseDTO].self) { placeSuggestions in
                placeSuggestions.map { PlaceSuggestionResponseDTO(suggestion: $0) }
            }
    }

    func postPlaceSuggestion(suggestion: PlaceSuggestionRequestDTO) -> Future<HTTPResponse> {
        return placeRepository
            .savePlaceSuggestion(suggestion: suggestion.toPlaceSuggestion())
            .map(to: HTTPResponse.self) { _ in
                return HTTPResponse(status: .ok,
                                    body: GeneralSuccessDTO(message: "Place suggestion is created!"))
            }
    }

    func clearPlaceSuggestions() -> Future<HTTPResponse> {
        return placeRepository
            .clearPlaceSuggestion()
            .map(to: HTTPResponse.self) { _ in
                return HTTPResponse(status: .ok,
                                    body: GeneralSuccessDTO(message: "Place suggestions are cleared!"))
        }
    }
}

//
//  PlaceController.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

import Vapor
import FluentSQLite

fileprivate enum Slug {
    static let apiVersionPath = "v1"
    static let placesPath = "places"
    static let placeInfoPath = "\(placesPath)/info"
    static let suggestPlace = "suggestplace"
    static let placeSuggestionsPath = "placesuggestions"
}

final class PlaceController {
    private let placeService: PlaceServiceInterface

    init(placeService: PlaceServiceInterface) {
        self.placeService = placeService
    }
}

// MARK: Routes definitions
extension PlaceController: RouteCollection {
    func boot(router: Router) throws {
        router.group(Slug.apiVersionPath) { apiVersionPath in
            apiVersionPath.get(Slug.placesPath, use: getPlaces)
            apiVersionPath.get(Slug.placeInfoPath, use: getPlaceInfo)
            apiVersionPath.get(Slug.placeSuggestionsPath, use: getPlaceSuggestions)

            apiVersionPath.post(Slug.suggestPlace, use: postPlaceSuggestions)
        }
    }
}

// MARK: GET routes actions
extension PlaceController {
    func getPlaces(req: Request) -> Future<[PlaceResponseDTO]> {
        return placeService.getPlaces()
    }

    func getPlaceInfo(req: Request) -> Future<PlaceInfoResponseDTO> {
        return placeService.getPlaceInfo()
    }

    func getPlaceSuggestions(req: Request) -> Future<[PlaceSuggestionResponseDTO]> {
        return placeService.getPlaceSuggestions()
    }
}

// MARK: POST routes actions
extension PlaceController {
    func postPlaceSuggestions(req: Request) throws -> Future<HTTPStatus> {
        return try req.content
            .decode(PlaceSuggestionRequestDTO.self)
            .flatMap { placeSuggestion in
                self.placeService.postPlaceSuggestion(suggestion: placeSuggestion)
            }
    }
}

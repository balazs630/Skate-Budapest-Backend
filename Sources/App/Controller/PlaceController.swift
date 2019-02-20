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
    static let placeSuggestionPath = "placesuggestion"
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
            apiVersionPath.get(Slug.placeSuggestionPath, use: getPlaceSuggestions)

            apiVersionPath.post(Slug.placeSuggestionPath, use: postPlaceSuggestions)
        }
    }
}

// MARK: GET routes action
extension PlaceController {
    func getPlaces(req: Request) -> Future<[PlaceRequestDTO]> {
        return placeService.getPlaces()
    }

    func getPlaceInfo(req: Request) -> Future<PlaceInfoRequestDTO> {
        return placeService.getPlaceInfo()
    }

    func getPlaceSuggestions(req: Request) -> Future<[PlaceSuggestionRequestDTO]> {
        return placeService.getPlaceSuggestions()
    }
}

// MARK: POST routes action
extension PlaceController {
    func postPlaceSuggestions(req: Request) throws -> Future<HTTPStatus> {
        return try req.content
            .decode(PlaceSuggestionRequestDTO.self)
            .flatMap(to: HTTPStatus.self) { placeSuggestion in
                return self.placeService.postPlaceSuggestion(suggestion: placeSuggestion)
        }
    }
}

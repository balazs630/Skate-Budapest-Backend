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

fileprivate enum Parameter {
    static let language = "lang"
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
    func getPlaces(req: Request) throws -> Future<[PlaceResponseDTO]> {
        let languageParameter = try req.query.get(String.self, at: Parameter.language)
        let languageCode = LanguageCode(rawValue: languageParameter.uppercased()) ?? .HU

        return placeService.getPlaces(for: languageCode)
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
                try placeSuggestion.validate()
                return self.placeService.postPlaceSuggestion(suggestion: placeSuggestion)
            }
    }
}

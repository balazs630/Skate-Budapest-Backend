//
//  PlaceController.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

import Vapor

fileprivate enum Slug {
    static let apiVersionPath = "v1"
    static let placesPath = "places"
    static let placeDataVersionPath = "\(placesPath)/dataversion"
    static let suggestPlace = "suggestplace"
    static let placeSuggestionsPath = "placesuggestions"
    static let clearPlaceSuggestionsPath = "placesuggestions/clear"
}

fileprivate enum Parameter {
    static let language = "lang"
    static let status = "status"
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
            apiVersionPath.get(Slug.placeDataVersionPath, use: getPlaceDataVersion)
            apiVersionPath.get(Slug.placeSuggestionsPath, use: getPlaceSuggestions)

            apiVersionPath.post(Slug.suggestPlace, use: postPlaceSuggestion)

            apiVersionPath.put(Slug.clearPlaceSuggestionsPath, use: clearPlaceSuggestions)
        }
    }
}

// MARK: GET endpoint methods
extension PlaceController {
    func getPlaces(request: Request) throws -> Future<[PlaceResponseDTO]> {
        let languageParameter = try request.query.get(String.self, at: Parameter.language)
        let languageCode = LanguageCode(rawValue: languageParameter) ?? .HU

        let statusParameter = try? request.query.get(String.self, at: Parameter.status)
        let status = PlaceStatus(rawValue: statusParameter ?? PlaceStatus.all.rawValue)

        return placeService.getPlaces(for: languageCode, status: status ?? .all)
    }

    func getPlaceDataVersion(request: Request) -> Future<PlaceDataVersionResponseDTO> {
        return placeService.getPlaceDataVersion()
    }

    func getPlaceSuggestions(request: Request) -> Future<[PlaceSuggestionResponseDTO]> {
        let statusParameter = try? request.query.get(String.self, at: Parameter.status)
        let status = PlaceSuggestionStatus(rawValue: statusParameter ?? PlaceSuggestionStatus.all.rawValue)
        return placeService.getPlaceSuggestions(status: status ?? .all)
    }
}

// MARK: POST endpoint methods
extension PlaceController {
    func postPlaceSuggestion(request: Request) throws -> Future<HTTPResponse> {
        return try request.content
            .decode(PlaceSuggestionRequestDTO.self)
            .flatMap { placeSuggestion in
                try placeSuggestion.validate()
                return self.placeService.postPlaceSuggestion(suggestion: placeSuggestion, on: request)
            }
    }
}

// MARK: PUT endpoint methods
extension PlaceController {
    func clearPlaceSuggestions(request: Request) -> Future<HTTPResponse> {
        return placeService.clearPlaceSuggestions()
    }
}

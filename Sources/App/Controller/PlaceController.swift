//
//  PlaceController.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

import Vapor

fileprivate enum ApiVersionPath: String {
    case v1
}

fileprivate struct Slug {
    static let api = "api"
    static let listPlacesPath = "places"
    static let placeDataVersionPath = "\(listPlacesPath)/data_version"

    static let suggestPlacePath = "suggest_place"
    static let listPlaceSuggestionsPath = "place_suggestions"
    static let clearPlaceSuggestionsPath = "\(listPlaceSuggestionsPath)/clear"

    static let reportPlacePath = "report_place"
    static let listPlaceReportsPath = "place_reports"
    static let clearPlaceReportsPath = "\(listPlaceReportsPath)/clear"
}

fileprivate struct Parameter {
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
        let secretGroup = router.grouped(SecretMiddleware.self)
        let apiV1 = secretGroup.grouped(Slug.api, ApiVersionPath.v1.rawValue)

        apiV1.get(Slug.listPlacesPath, use: getPlaces)
        apiV1.get(Slug.placeDataVersionPath, use: getPlaceDataVersion)
        apiV1.get(Slug.listPlaceSuggestionsPath, use: getPlaceSuggestions)
        apiV1.get(Slug.listPlaceReportsPath, use: getPlaceReports)

        apiV1.post(Slug.suggestPlacePath, use: postPlaceSuggestion)
        apiV1.post(Slug.reportPlacePath, use: postPlaceReport)

        apiV1.put(Slug.clearPlaceSuggestionsPath, use: clearPlaceSuggestions)
        apiV1.put(Slug.clearPlaceReportsPath, use: clearPlaceReports)
    }
}

// MARK: GET endpoint methods
extension PlaceController {
    private func getPlaces(request: Request) throws -> Future<[PlaceResponseDTO]> {
        let languageParameter = try request.query.get(String.self, at: Parameter.language)
        guard let languageCode = LanguageCode(rawValue: languageParameter.lowercased()) else {
            throw Abort(.badRequest, reason: "Invalid `lang` parameter.")
        }

        let statusParameter = try? request.query.get(String.self, at: Parameter.status)
        guard let status = PlaceStatus(rawValue: statusParameter?.lowercased()
            ?? PlaceStatus.all.rawValue) else {
                throw Abort(.badRequest, reason: "Invalid `status` parameter.")
        }

        return placeService.getPlaces(for: languageCode, status: status)
    }

    private func getPlaceDataVersion(request: Request) -> Future<PlaceDataVersionResponseDTO> {
        return placeService.getPlaceDataVersion()
    }

    private func getPlaceSuggestions(request: Request) throws -> Future<[PlaceSuggestionResponseDTO]> {
        let statusParameter = try? request.query.get(String.self, at: Parameter.status)
        guard let status = PlaceSuggestionStatus(rawValue: statusParameter?.lowercased()
            ?? PlaceSuggestionStatus.all.rawValue) else {
                throw Abort(.badRequest, reason: "Invalid `status` parameter.")
        }

        return placeService.getPlaceSuggestions(status: status)
    }

    private func getPlaceReports(request: Request) throws -> Future<[PlaceReportResponseDTO]> {
        let statusParameter = try? request.query.get(String.self, at: Parameter.status)
        guard let status = PlaceReportStatus(rawValue: statusParameter?.lowercased()
            ?? PlaceReportStatus.all.rawValue) else {
                throw Abort(.badRequest, reason: "Invalid `status` parameter.")
        }

        return placeService.getPlaceReports(status: status)
    }
}

// MARK: POST endpoint methods
extension PlaceController {
    private func postPlaceSuggestion(request: Request) throws -> Future<HTTPResponse> {
        return try request.content
            .decode(PlaceSuggestionRequestDTO.self)
            .flatMap { placeSuggestion in
                try placeSuggestion.validate()
                return self.placeService.postPlaceSuggestion(suggestion: placeSuggestion, on: request)
            }
    }

    private func postPlaceReport(request: Request) throws -> Future<HTTPResponse> {
        return try request.content
            .decode(PlaceReportRequestDTO.self)
            .flatMap { placeReport in
                try placeReport.validate()
                return self.placeService.postPlaceReport(report: placeReport, on: request)
        }
    }
}

// MARK: PUT endpoint methods
extension PlaceController {
    private func clearPlaceSuggestions(request: Request) -> Future<HTTPResponse> {
        return placeService.clearPlaceSuggestions()
    }

    private func clearPlaceReports(request: Request) -> Future<HTTPResponse> {
        return placeService.clearPlaceReports()
    }
}

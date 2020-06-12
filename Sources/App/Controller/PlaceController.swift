//
//  PlaceController.swift
//  App
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
    func boot(routes: RoutesBuilder) throws {
        let apiV1 = routes.grouped(
            PathComponent(stringLiteral: Slug.api),
            PathComponent(stringLiteral: ApiVersionPath.v1.rawValue)
        )

        apiV1.get(Slug.listPlacesPath.pathComponents, use: getPlaces)
        apiV1.get(Slug.placeDataVersionPath.pathComponents, use: getPlaceDataVersion)
        apiV1.get(Slug.listPlaceSuggestionsPath.pathComponents, use: getPlaceSuggestions)
        apiV1.get(Slug.listPlaceReportsPath.pathComponents, use: getPlaceReports)

        apiV1.post(Slug.suggestPlacePath.pathComponents, use: postPlaceSuggestion)
        apiV1.post(Slug.reportPlacePath.pathComponents, use: postPlaceReport)

        apiV1.put(Slug.clearPlaceSuggestionsPath.pathComponents, use: clearPlaceSuggestions)
        apiV1.put(Slug.clearPlaceReportsPath.pathComponents, use: clearPlaceReports)
    }
}

// MARK: GET endpoint methods
extension PlaceController {
    private func getPlaces(request: Request) throws -> EventLoopFuture<[PlaceResponseDTO]> {
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

    private func getPlaceDataVersion(request: Request) -> EventLoopFuture<PlaceDataVersionResponseDTO> {
        return placeService.getPlaceDataVersion()
    }

    private func getPlaceSuggestions(request: Request) throws -> EventLoopFuture<[PlaceSuggestionResponseDTO]> {
        let statusParameter = try? request.query.get(String.self, at: Parameter.status)
        guard let status = PlaceSuggestionStatus(rawValue: statusParameter?.lowercased()
            ?? PlaceSuggestionStatus.all.rawValue) else {
                throw Abort(.badRequest, reason: "Invalid `status` parameter.")
        }

        return placeService.getPlaceSuggestions(status: status)
    }

    private func getPlaceReports(request: Request) throws -> EventLoopFuture<[PlaceReportResponseDTO]> {
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
    private func postPlaceSuggestion(request: Request) throws -> EventLoopFuture<GeneralSuccessDTO> {
        try PlaceSuggestionRequestDTO.validate(request)

        let placeSuggestion = try request.content
            .decode(PlaceSuggestionRequestDTO.self)

        return placeService.postPlaceSuggestion(suggestion: placeSuggestion, on: request)
    }

    private func postPlaceReport(request: Request) throws -> EventLoopFuture<GeneralSuccessDTO> {
        try PlaceReportRequestDTO.validate(request)

        let placeReport = try request.content
            .decode(PlaceReportRequestDTO.self)

        return placeService.postPlaceReport(report: placeReport, on: request)
    }
}

// MARK: PUT endpoint methods
extension PlaceController {
    private func clearPlaceSuggestions(request: Request) -> EventLoopFuture<GeneralSuccessDTO> {
        return placeService.clearPlaceSuggestions()
    }

    private func clearPlaceReports(request: Request) -> EventLoopFuture<GeneralSuccessDTO> {
        return placeService.clearPlaceReports()
    }
}

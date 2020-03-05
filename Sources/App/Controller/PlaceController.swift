//
//  PlaceController.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

import Vapor

fileprivate enum Slug {
    static let apiVersionPath = "v1"
    static let listPlacesPath = "places"
    static let placeDataVersionPath = "\(listPlacesPath)/data_version"

    static let suggestPlacePath = "suggest_place"
    static let listPlaceSuggestionsPath = "place_suggestions"
    static let clearPlaceSuggestionsPath = "\(listPlaceSuggestionsPath)/clear"

    static let reportPlacePath = "report_place"
    static let listPlaceReportsPath = "place_reports"
    static let clearPlaceReportsPath = "\(listPlaceReportsPath)/clear"
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
            apiVersionPath.get(Slug.listPlacesPath, use: getPlaces)
            apiVersionPath.get(Slug.placeDataVersionPath, use: getPlaceDataVersion)
            apiVersionPath.get(Slug.listPlaceSuggestionsPath, use: getPlaceSuggestions)
            apiVersionPath.get(Slug.listPlaceReportsPath, use: getPlaceReports)

            apiVersionPath.post(Slug.suggestPlacePath, use: postPlaceSuggestion)
            apiVersionPath.post(Slug.reportPlacePath, use: postPlaceReport)

            apiVersionPath.put(Slug.clearPlaceSuggestionsPath, use: clearPlaceSuggestions)
            apiVersionPath.put(Slug.clearPlaceReportsPath, use: clearPlaceReports)
        }
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

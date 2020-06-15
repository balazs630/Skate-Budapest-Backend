//
//  PlaceService.swift
//  App
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

import Vapor

final class PlaceService {
    private let emailService: EmailServiceInterface
    private let placeRepository: PlaceRepositoryInterface

    init(emailService: EmailServiceInterface, placeRepository: PlaceRepositoryInterface) {
        self.emailService = emailService
        self.placeRepository = placeRepository
    }
}

// MARK: PlaceServiceInterface conformances
extension PlaceService: PlaceServiceInterface {
    func getPlaces(for languageCode: LanguageCode, status: PlaceStatus) -> EventLoopFuture<[PlaceResponseDTO]> {
        placeRepository
            .findAllPlaces(status: status)
            .mapEach { PlaceResponseDTO(place: $0, languageCode: languageCode) }
    }

    func getPlaceDataVersion() -> EventLoopFuture<PlaceDataVersionResponseDTO> {
        placeRepository
            .findPlaceDataVersion()
            .unwrap(or: Abort(.notFound))
            .map { PlaceDataVersionResponseDTO(id: $0.id, dataVersion: $0.dataVersion) }
    }

    func getPlaceSuggestions(status: PlaceSuggestionStatus) -> EventLoopFuture<[PlaceSuggestionResponseDTO]> {
        placeRepository
            .findPlaceSuggestions(status: status)
            .mapEach { PlaceSuggestionResponseDTO(suggestion: $0) }
    }

    func postPlaceSuggestion(suggestion: PlaceSuggestionRequestDTO, on request: Request) -> EventLoopFuture<GeneralSuccessDTO> {
        placeRepository
            .savePlaceSuggestion(suggestion: suggestion.toPlaceSuggestion())
            .flatMapThrowing { [weak self] _ in
                let message = MailGunEmailTemplateFactory.makePlaceSuggestionEmail()
                try self?.emailService.sendEmail(message: message, on: request)

                return GeneralSuccessDTO(status: .created, message: "Place suggestion is created!")
            }
    }

    func clearPlaceSuggestions() -> EventLoopFuture<GeneralSuccessDTO> {
        placeRepository
            .clearPlaceSuggestions()
            .map { GeneralSuccessDTO(status: .noContent, message: "Place suggestions are cleared!") }
    }

    func getPlaceReports(status: PlaceReportStatus) -> EventLoopFuture<[PlaceReportResponseDTO]> {
        placeRepository
            .findPlaceReports(status: status)
            .mapEach { PlaceReportResponseDTO(report: $0) }
    }

    func postPlaceReport(report: PlaceReportRequestDTO, on request: Request) -> EventLoopFuture<GeneralSuccessDTO> {
        placeRepository
            .savePlaceReport(report: report.toPlaceReport())
            .flatMapThrowing { [weak self] _ in
                let message = MailGunEmailTemplateFactory.makePlaceReportEmail()
                try self?.emailService.sendEmail(message: message, on: request)

                return GeneralSuccessDTO(status: .created, message: "Place report is created!")
            }
    }

    func clearPlaceReports() -> EventLoopFuture<GeneralSuccessDTO> {
        placeRepository
            .clearPlaceReports()
            .map { GeneralSuccessDTO(status: .noContent, message: "Place reports are cleared!") }
    }
}

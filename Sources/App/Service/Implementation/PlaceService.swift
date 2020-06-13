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
        return placeRepository
            .findAllPlacesWithImages(status: status)
            .map { result in
                let (places, images) = result
                return places.map { place in
                    let imageUrls = images
                        .filter { $0.id == place.id }
                        .map { $0.imageUrl }

                    return PlaceResponseDTO(place: place, placeImages: imageUrls, languageCode: languageCode)
                }
            }
    }

    func getPlaceDataVersion() -> EventLoopFuture<PlaceDataVersionResponseDTO> {
        return placeRepository
            .findPlaceDataVersion()
            .unwrap(or: Abort(.notFound))
            .map { PlaceDataVersionResponseDTO(id: $0.id, dataVersion: $0.dataVersion) }
    }

    func getPlaceSuggestions(status: PlaceSuggestionStatus) -> EventLoopFuture<[PlaceSuggestionResponseDTO]> {
        return placeRepository
            .findPlaceSuggestions(status: status)
            .mapEach { PlaceSuggestionResponseDTO(suggestion: $0) }
    }

    func postPlaceSuggestion(suggestion: PlaceSuggestionRequestDTO, on request: Request) -> EventLoopFuture<GeneralSuccessDTO> {
        return placeRepository
            .savePlaceSuggestion(suggestion: suggestion.toPlaceSuggestion())
            .flatMapThrowing { [weak self] _ in
                let message = MailGunEmailTemplateFactory.makePlaceSuggestionEmail()
                try self?.emailService.sendEmail(message: message, on: request)
                return GeneralSuccessDTO(status: .created, message: "Place suggestion is created!")
            }
    }

    func clearPlaceSuggestions() -> EventLoopFuture<GeneralSuccessDTO> {
        return placeRepository
            .clearPlaceSuggestions()
            .map { GeneralSuccessDTO(status: .noContent, message: "Place suggestions are cleared!") }
    }

    func getPlaceReports(status: PlaceReportStatus) -> EventLoopFuture<[PlaceReportResponseDTO]> {
        return placeRepository
            .findPlaceReports(status: status)
            .mapEach { PlaceReportResponseDTO(report: $0) }
    }

    func postPlaceReport(report: PlaceReportRequestDTO, on request: Request) -> EventLoopFuture<GeneralSuccessDTO> {
        return placeRepository
            .savePlaceReport(report: report.toPlaceReport())
            .flatMapThrowing { [weak self] _ in
                let message = MailGunEmailTemplateFactory.makePlaceReportEmail()
                try self?.emailService.sendEmail(message: message, on: request)
                return GeneralSuccessDTO(status: .created, message: "Place report is created!")
            }
    }

    func clearPlaceReports() -> EventLoopFuture<GeneralSuccessDTO> {
        return placeRepository
            .clearPlaceReports()
            .map { GeneralSuccessDTO(status: .noContent, message: "Place reports are cleared!") }
    }
}

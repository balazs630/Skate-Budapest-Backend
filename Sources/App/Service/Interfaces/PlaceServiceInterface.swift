//
//  PlaceServiceInterface.swift
//  App
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

import Vapor

protocol PlaceServiceInterface {
    func getPlaces(for languageCode: LanguageCode, status: PlaceStatus) -> EventLoopFuture<[PlaceResponseDTO]>
    func getPlaceDataVersion() -> EventLoopFuture<PlaceDataVersionResponseDTO>

    func getPlaceSuggestions(status: PlaceSuggestionStatus) -> EventLoopFuture<[PlaceSuggestionResponseDTO]>
    func postPlaceSuggestion(suggestion: PlaceSuggestionRequestDTO, on request: Request) -> EventLoopFuture<Response>
    func clearPlaceSuggestions() -> EventLoopFuture<Response>

    func getPlaceReports(status: PlaceReportStatus) -> EventLoopFuture<[PlaceReportResponseDTO]>
    func postPlaceReport(report: PlaceReportRequestDTO, on request: Request) -> EventLoopFuture<Response>
    func clearPlaceReports() -> EventLoopFuture<Response>
}

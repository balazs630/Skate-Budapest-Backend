//
//  PlaceRepositoryInterface.swift
//  App
//
//  Created by Horváth Balázs on 2018. 11. 26..
//

import Vapor

protocol PlaceRepositoryInterface {
    func findAllPlacesWithImages(status: PlaceStatus) -> EventLoopFuture<([Place], [PlaceImage])>
    func findPlaceDataVersion() -> EventLoopFuture<PlaceDataVersion?>

    func findPlaceSuggestions(status: PlaceSuggestionStatus) -> EventLoopFuture<[PlaceSuggestion]>
    func savePlaceSuggestion(suggestion: PlaceSuggestion) -> EventLoopFuture<Void>
    func clearPlaceSuggestions() -> EventLoopFuture<Void>

    func findPlaceReports(status: PlaceReportStatus) -> EventLoopFuture<[PlaceReport]>
    func savePlaceReport(report: PlaceReport) -> EventLoopFuture<Void>
    func clearPlaceReports() -> EventLoopFuture<Void>
}

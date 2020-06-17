//
//  PlaceRepository.swift
//  App
//
//  Created by Horváth Balázs on 2018. 11. 26..
//

import Vapor
import Fluent

final class PlaceRepository {
    private let database: Database

    init(database: Database) {
        self.database = database
    }
}

// MARK: PlaceRepositoryInterface conformances
extension PlaceRepository: PlaceRepositoryInterface {
    func findAllPlaces(status: PlaceStatus) -> EventLoopFuture<[Place]> {
        Place.query(on: database)
            .with(\.$images)
            .filter(\.$status, .contains(inverse: false, .anywhere), status)
            .all()
    }

    func findPlaceDataVersion() -> EventLoopFuture<PlaceDataVersion?> {
        PlaceDataVersion.query(on: database)
            .first()
    }

    func findPlaceSuggestions(status: PlaceSuggestionStatus) -> EventLoopFuture<[PlaceSuggestion]> {
        PlaceSuggestion.query(on: database)
            .filter(\.$status, .contains(inverse: false, .anywhere), status)
            .all()
    }

    func savePlaceSuggestion(suggestion: PlaceSuggestion) -> EventLoopFuture<Void> {
        suggestion.create(on: database)
    }

    func clearPlaceSuggestions() -> EventLoopFuture<Void> {
        PlaceSuggestion.query(on: database)
            .set(\.$status, to: .deleted)
            .update()
    }

    func findPlaceReports(status: PlaceReportStatus) -> EventLoopFuture<[PlaceReport]> {
        PlaceReport.query(on: database)
            .filter(\.$status,  .contains(inverse: false, .anywhere), status)
            .all()
    }

    func savePlaceReport(report: PlaceReport) -> EventLoopFuture<Void> {
        report.create(on: database)
    }

    func clearPlaceReports() -> EventLoopFuture<Void> {
        PlaceReport.query(on: database)
            .set(\.$status, to: .deleted)
            .update()
    }
}

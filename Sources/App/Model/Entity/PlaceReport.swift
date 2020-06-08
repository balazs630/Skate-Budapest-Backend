//
//  PlaceReport.swift
//  App
//
//  Created by Horváth Balázs on 2020. 03. 05..
//

import Fluent
import Vapor

final class PlaceReport: Model {
    static let schema = String(describing: PlaceReport.self)

    // MARK: Fields
    @ID() var id: UUID?
    @Field(key: "placeId") var placeId: String
    @Field(key: "placeName") var placeName: String
    @Field(key: "senderEmail") var senderEmail: String?
    @Field(key: "reportText") var reportText: String
    @Field(key: "status") var status: PlaceReportStatus

    // MARK: Initializers
    init() { }

    init(id: UUID?,
         placeId: String,
         placeName: String,
         senderEmail: String?,
         reportText: String,
         status: PlaceReportStatus = .active) {
        self.id = id
        self.placeId = placeId
        self.placeName = placeName
        self.senderEmail = senderEmail
        self.reportText = reportText
        self.status = status
    }
}

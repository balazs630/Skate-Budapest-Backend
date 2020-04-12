//
//  PlaceReport.swift
//  App
//
//  Created by Horváth Balázs on 2020. 03. 05..
//

import FluentPostgreSQL

final class PlaceReport: PostgreSQLUUIDModel {
    var id: UUID?
    var placeId: String
    var placeName: String
    var senderEmail: String?
    var reportText: String

    var status: PlaceReportStatus

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

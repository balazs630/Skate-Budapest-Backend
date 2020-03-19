//
//  PlaceReport.swift
//  App
//
//  Created by Horváth Balázs on 2020. 03. 05..
//

import FluentPostgreSQL

final class PlaceReport: PostgreSQLUUIDModel {
    var id: UUID?
    var senderEmail: String?
    var reportText: String
    var status: PlaceReportStatus

    init(id: UUID?, senderEmail: String?, reportText: String, status: PlaceReportStatus = .active) {
        self.id = id
        self.senderEmail = senderEmail
        self.reportText = reportText
        self.status = status
    }
}

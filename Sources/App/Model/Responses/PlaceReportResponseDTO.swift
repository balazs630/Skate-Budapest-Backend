//
//  PlaceReportResponseDTO.swift
//  App
//
//  Created by Horváth Balázs on 2020. 03. 05..
//

import Vapor

struct PlaceReportResponseDTO: Content {
    let senderEmail: String?
    let reportText: String

    init(report: PlaceReport) {
        self.senderEmail = report.senderEmail
        self.reportText = report.reportText
    }
}

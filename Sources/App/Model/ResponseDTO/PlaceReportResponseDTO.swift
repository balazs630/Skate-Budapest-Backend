//
//  PlaceReportResponseDTO.swift
//  App
//
//  Created by Horváth Balázs on 2020. 03. 05..
//

import Vapor

struct PlaceReportResponseDTO: Content {
    let placeId: String
    let placeName: String
    let senderEmail: String?
    let reportText: String

    init(report: PlaceReport) {
        self.placeId = report.placeId
        self.placeName = report.placeName
        self.senderEmail = report.senderEmail
        self.reportText = report.reportText
    }
}

// MARK: Compare objects
extension PlaceReportResponseDTO {
    func isEqual(to requestDTO: PlaceReportRequestDTO) -> Bool {
        return senderEmail == requestDTO.senderEmail
            && reportText == requestDTO.reportText
    }
}

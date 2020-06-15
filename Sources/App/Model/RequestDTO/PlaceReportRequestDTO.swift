//
//  PlaceReportRequestDTO.swift
//  App
//
//  Created by Horváth Balázs on 2020. 03. 05..
//

import Vapor

struct PlaceReportRequestDTO: Content {
    let placeId: String
    let placeName: String
    let senderEmail: String?
    let reportText: String
}

// MARK: Mapping
extension PlaceReportRequestDTO {
    func toPlaceReport() -> PlaceReport {
        return PlaceReport(
            placeId: placeId,
            placeName: placeName,
            senderEmail: senderEmail,
            reportText: reportText
        )
    }
}

// MARK: Validation
extension PlaceReportRequestDTO: Validatable {
    static func validations(_ validations: inout Validations) {
        validations.add("senderEmail", as: String?.self, is: .email || .nil)
        validations.add("reportText", as: String.self, is: .count(10...))
    }
}

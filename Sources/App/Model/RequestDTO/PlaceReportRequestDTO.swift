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
            id: UUID(),
            placeId: placeId,
            placeName: placeName,
            senderEmail: senderEmail,
            reportText: reportText
        )
    }
}

// MARK: Validation
extension PlaceReportRequestDTO: Validatable, Reflectable {
    static func validations() throws -> Validations<PlaceReportRequestDTO> {
        var validations = Validations(PlaceReportRequestDTO.self)

        try validations.add(\.senderEmail, .email || .nil)
        try validations.add(\.reportText, .count(10...))

        return validations
    }
}

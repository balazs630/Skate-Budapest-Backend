//
//  PlaceSuggestionRequestDTO.swift
//  App
//
//  Created by Horváth Balázs on 2019. 02. 20..
//

import Vapor

struct PlaceSuggestionRequestDTO: Content {
    let latitude: Double
    let longitude: Double
    let name: String
    let info: String
    let type: String
    let senderEmail: String
    let image1: Data
    let image2: Data
    let image3: Data?
    let image4: Data?
}

// MARK: Mapping
extension PlaceSuggestionRequestDTO {
    func toPlaceSuggestion() -> PlaceSuggestion {
        return PlaceSuggestion(
            id: UUID(),
            latitude: latitude,
            longitude: longitude,
            name: name,
            info: info,
            type: type,
            senderEmail: senderEmail,
            image1: image1,
            image2: image2,
            image3: image3,
            image4: image4
        )
    }
}

extension PlaceSuggestionRequestDTO: Validatable, Reflectable {
    static func validations() throws -> Validations<PlaceSuggestionRequestDTO> {
        var validations = Validations(PlaceSuggestionRequestDTO.self)

        try validations.add(\.name, .count(3...))
        try validations.add(\.info, .count(10...))
        try validations.add(\.senderEmail, .email)

        return validations
    }
}

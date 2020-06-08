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

// MARK: Validation
extension PlaceSuggestionRequestDTO: Validatable {
    static func validations(_ validations: inout Validations) {
        validations.add("name", as: String.self, is: .count(3...))
        validations.add("info", as: String.self, is: .count(10...))
        validations.add("senderEmail", as: String.self, is: .email)
    }
}

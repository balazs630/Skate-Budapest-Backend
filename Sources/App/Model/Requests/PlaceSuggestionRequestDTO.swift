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
            image1: image1,
            image2: image2,
            image3: image3,
            image4: image4
        )
    }
}

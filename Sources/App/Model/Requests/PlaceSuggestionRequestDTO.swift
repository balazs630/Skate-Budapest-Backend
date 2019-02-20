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

    init(place: PlaceSuggestion) {
        self.latitude = place.latitude
        self.longitude = place.longitude
        self.name = place.name
        self.info = place.info
        self.type = place.type
    }
}

extension PlaceSuggestionRequestDTO {
    func toPlaceSuggestion() -> PlaceSuggestion {
        return PlaceSuggestion(id: UUID(),
                               latitude: latitude,
                               longitude: longitude,
                               name: name,
                               info: info,
                               type: type)
    }
}

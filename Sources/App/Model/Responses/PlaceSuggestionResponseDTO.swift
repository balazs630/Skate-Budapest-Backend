//
//  PlaceSuggestionResponseDTO.swift
//  App
//
//  Created by Horváth Balázs on 2019. 02. 21..
//

import Vapor

struct PlaceSuggestionResponseDTO: Content {
    let id: UUID?
    let latitude: Double
    let longitude: Double
    let name: String
    let info: String
    let type: String

    init(suggestion: PlaceSuggestion) {
        self.id = suggestion.id
        self.latitude = suggestion.latitude
        self.longitude = suggestion.longitude
        self.name = suggestion.name
        self.info = suggestion.info
        self.type = suggestion.type
    }
}

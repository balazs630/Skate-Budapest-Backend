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
    let senderEmail: String
    let image1: Data
    let image2: Data
    let image3: Data?
    let image4: Data?

    init(suggestion: PlaceSuggestion) {
        self.id = suggestion.id
        self.latitude = suggestion.latitude
        self.longitude = suggestion.longitude
        self.name = suggestion.name
        self.info = suggestion.info
        self.type = suggestion.type
        self.senderEmail = suggestion.senderEmail
        self.image1 = suggestion.image1
        self.image2 = suggestion.image2
        self.image3 = suggestion.image3
        self.image4 = suggestion.image4
    }
}

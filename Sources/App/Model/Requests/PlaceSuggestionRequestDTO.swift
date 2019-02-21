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
}

// MARK: Mapping
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

//
//  PlaceResponseDTO.swift
//  App
//
//  Created by Horváth Balázs on 2019. 02. 17..
//

import Vapor

struct PlaceResponseDTO: Content {
    let id: UUID?
    let latitude: Double
    let longitude: Double
    let name: String
    let info: String
    let type: String
    let priority: Int
    let thumbnailUrl: String?
    let imageUrls: [String]?

    init(place: Place, languageCode: LanguageCode) {
        self.id = place.id
        self.latitude = place.latitude
        self.longitude = place.longitude

        switch languageCode {
        case .hu:
            self.name = place.nameHU
            self.info = place.infoHU
        case .en:
            self.name = place.nameEN
            self.info = place.infoEN
        }

        self.type = place.type
        self.priority = place.priority
        self.thumbnailUrl = place.thumbnailUrl
        self.imageUrls = !place.images.isEmpty
            ? place.images.map { $0.imageUrl }
            : nil
    }
}

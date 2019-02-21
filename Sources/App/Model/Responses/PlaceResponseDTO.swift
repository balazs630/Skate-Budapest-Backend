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
    let status: String
    let thumbnailUrl: String?
    let imageUrls: [String]?

    init(place: Place, placeImages: [String]?) {
        self.id = place.id
        self.latitude = place.latitude
        self.longitude = place.longitude
        self.name = place.name
        self.info = place.info
        self.type = place.type
        self.status = place.status
        self.thumbnailUrl = place.thumbnailUrl
        self.imageUrls = placeImages
    }
}

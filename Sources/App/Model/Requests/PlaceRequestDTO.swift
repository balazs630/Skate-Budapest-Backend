//
//  PlaceRequestDTO.swift
//  App
//
//  Created by Horváth Balázs on 2019. 02. 17..
//

import Vapor

struct PlaceRequestDTO: Content {
    let latitude: Double
    var longitude: Double
    var name: String
    var info: String
    var type: String
    var status: String
    var thumbnailUrl: String?
    var imageUrls: [String]?

    init(place: Place, placeImages: [String]?) {
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

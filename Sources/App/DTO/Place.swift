//
//  Place.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

import Vapor

final class Place: Content {
    var id: String
    var latitude: Double
    var longitude: Double
    var name: String
    var info: String
    var type: PlaceType
    var status: PlaceStatus
    var images: [PlaceImage]

    init(id: String,
         latitude: Double,
         longitude: Double,
         name: String,
         info: String,
         type: PlaceType,
         status: PlaceStatus,
         images: [PlaceImage]) {
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.name = name
        self.info = info
        self.type = type
        self.status = status
        self.images = images
    }
}

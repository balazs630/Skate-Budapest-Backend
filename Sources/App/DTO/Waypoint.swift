//
//  Waypoint.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

import Vapor

final class Waypoint: Content {
    var id: String
    var latitude: Double
    var longitude: Double
    var name: String
    var description: String
    var type: WaypointType
    var status: WaypointStatus
    var images: [WaypointImage]

    init(id: String,
         latitude: Double,
         longitude: Double,
         name: String,
         description: String,
         type: WaypointType,
         status: WaypointStatus,
         images: [WaypointImage]) {
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.name = name
        self.description = description
        self.type = type
        self.status = status
        self.images = images
    }
}

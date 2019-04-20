//
//  Place.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

import FluentPostgreSQL

final class Place: PostgreSQLUUIDModel {
    var id: UUID?
    var latitude: Double
    var longitude: Double
    var nameHU: String
    var nameEN: String
    var infoHU: String
    var infoEN: String
    var type: String
    var status: String
    var thumbnailUrl: String?
}

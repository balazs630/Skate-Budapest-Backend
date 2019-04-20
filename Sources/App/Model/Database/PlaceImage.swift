//
//  PlaceImage.swift
//  App
//
//  Created by Horváth Balázs on 2019. 02. 16..
//

import FluentPostgreSQL

final class PlaceImage: PostgreSQLUUIDModel {
    var id: UUID?
    var placeId: UUID
    var imageUrl: String
}

//
//  PlaceImage.swift
//  App
//
//  Created by Horváth Balázs on 2019. 02. 16..
//

import FluentSQLite

final class PlaceImage: SQLiteUUIDModel {
    var id: UUID?
    var placeId: UUID
    var imageUrl: String
}

// MARK: Table name
extension PlaceImage {
    public static var entity = "PlaceImages"
}

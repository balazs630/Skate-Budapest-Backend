//
//  PlaceSuggestion.swift
//  App
//
//  Created by Horváth Balázs on 2019. 02. 19..
//

import FluentSQLite

final class PlaceSuggestion: SQLiteUUIDModel {
    var id: UUID?
    var latitude: Double
    var longitude: Double
    var name: String
    var info: String
    var type: String

    init(id: UUID?, latitude: Double, longitude: Double, name: String, info: String, type: String) {
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.name = name
        self.info = info
        self.type = type
    }
}

// MARK: Table name
extension PlaceSuggestion {
    public static var entity = "PlaceSuggestions"
}

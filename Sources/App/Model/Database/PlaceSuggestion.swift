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
    var senderEmail: String
    var image1: Data
    var image2: Data
    var image3: Data?
    var image4: Data?

    init(id: UUID?, latitude: Double, longitude: Double, name: String, info: String, type: String,
         senderEmail: String, image1: Data, image2: Data, image3: Data?, image4: Data?) {
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.name = name
        self.info = info
        self.type = type
        self.senderEmail = senderEmail
        self.image1 = image1
        self.image2 = image2
        self.image3 = image3
        self.image4 = image4
    }
}

// MARK: Table name
extension PlaceSuggestion {
    public static var entity = "PlaceSuggestions"
}

//
//  Place.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

import FluentSQLite

final class Place: SQLiteUUIDModel {
    var id: UUID?
    var latitude: Double
    var longitude: Double
    var name: String
    var info: String
    var type: String
    var status: String
    var thumbnailUrl: String?
}

// MARK: Table name
extension Place {
    public static var entity = "Places"
}

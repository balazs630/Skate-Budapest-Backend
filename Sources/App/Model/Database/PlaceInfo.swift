//
//  PlaceInfo.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 23..
//

import FluentSQLite

final class PlaceInfo: SQLiteUUIDModel {
    var id: UUID?
    var dataVersion: String
}

// MARK: Table name
extension PlaceInfo {
    public static var entity = "PlaceInfo"
}

//
//  PlaceDataVersion.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 23..
//

import FluentPostgreSQL

final class PlaceDataVersion: PostgreSQLUUIDModel {
    var id: UUID?
    var dataVersion: Date
}

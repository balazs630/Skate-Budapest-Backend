//
//  PlaceStatus.swift
//  App
//
//  Created by Horváth Balázs on 2019. 05. 17..
//

import FluentPostgreSQL

enum PlaceStatus: String, PostgreSQLEnum {
    case active
    case pending
    case deleted
    case all = "%"
}

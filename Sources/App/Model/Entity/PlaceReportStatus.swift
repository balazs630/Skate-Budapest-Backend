//
//  PlaceReportStatus.swift
//  App
//
//  Created by Horváth Balázs on 2020. 03. 05..
//

import FluentPostgreSQL

enum PlaceReportStatus: String, PostgreSQLEnum {
    case active
    case deleted
    case all = "%"
}

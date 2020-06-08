//
//  PlaceReportStatus.swift
//  App
//
//  Created by Horváth Balázs on 2020. 03. 05..
//

import Vapor

enum PlaceReportStatus: String, Content {
    case active
    case deleted
    case all = "%"
}

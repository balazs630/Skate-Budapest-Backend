//
//  PlaceReportStatus.swift
//  App
//
//  Created by Horváth Balázs on 2020. 03. 05..
//

import Vapor

enum PlaceReportStatus: String {
    case active
    case deleted
    case all = "%"
}

extension PlaceReportStatus: CustomStringConvertible {
    var description: String {
        return rawValue
    }
}

extension PlaceReportStatus: Codable {}

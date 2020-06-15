//
//  PlaceStatus.swift
//  App
//
//  Created by Horváth Balázs on 2019. 05. 17..
//

import Vapor

enum PlaceStatus: String {
    case active
    case pending
    case deleted
    case all = "%"
}

extension PlaceStatus: CustomStringConvertible {
    var description: String {
        return rawValue
    }
}

extension PlaceStatus: Codable {}

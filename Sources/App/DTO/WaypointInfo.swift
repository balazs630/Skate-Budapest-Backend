//
//  WaypointInfo.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 23..
//

import Vapor

final class WaypointInfo: Content {
    var dataVersion: String

    init(dataVersion: String) {
        self.dataVersion = dataVersion
    }
}

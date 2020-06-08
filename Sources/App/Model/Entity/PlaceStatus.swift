//
//  PlaceStatus.swift
//  App
//
//  Created by Horváth Balázs on 2019. 05. 17..
//

import Vapor

enum PlaceStatus: String, Content {
    case active
    case pending
    case deleted
    case all = "%"
}

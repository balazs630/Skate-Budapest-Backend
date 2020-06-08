//
//  PlaceSuggestionStatus.swift
//  App
//
//  Created by Horváth Balázs on 2019. 05. 18..
//

import Vapor

enum PlaceSuggestionStatus: String, Content {
    case active
    case deleted
    case all = "%"
}

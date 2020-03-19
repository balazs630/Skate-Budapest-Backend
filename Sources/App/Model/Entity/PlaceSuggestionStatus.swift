//
//  PlaceSuggestionStatus.swift
//  App
//
//  Created by Horváth Balázs on 2019. 05. 18..
//

import FluentPostgreSQL

enum PlaceSuggestionStatus: String, PostgreSQLEnum {
    case active
    case deleted
    case all = "%"
}

//
//  PlaceSuggestionStatus.swift
//  App
//
//  Created by Horváth Balázs on 2019. 05. 18..
//

import Vapor

enum PlaceSuggestionStatus: String {
    case active
    case deleted
    case all = "%"
}

extension PlaceSuggestionStatus: CustomStringConvertible {
    var description: String {
        return rawValue
    }
}

extension PlaceSuggestionStatus: Codable {}

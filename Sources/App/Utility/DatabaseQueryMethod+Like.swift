//
//  DatabaseQueryMethod+Like.swift
//  App
//
//  Created by Horváth Balázs on 2020. 06. 08..
//

import Fluent
import Vapor

extension DatabaseQuery.Filter.Method {
    static let like: DatabaseQuery.Filter.Method = .custom("like")
}

//
//  configure.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

import Vapor
import FluentSQLite

public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
    try registerEngineRouter(to: &services)
    try registerMiddlewares(to: &services)

    populateDatabaseWithBaseData()
    try registerSQLiteDatabase(to: &services)
    try registerFluentSQLiteProvider(to: &services)
    setupRepositories(services: &services, config: &config)
}

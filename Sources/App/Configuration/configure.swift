//
//  configure.swift
//  App
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

import Fluent
import FluentPostgresDriver
import Vapor

public func configure(_ app: Application) throws {
    let databaseConfiguration = try app.environment.postgreSQLDatabaseConfig()
    app.databases.use(databaseConfiguration, as: .psql)

    let apiKey = try app.environment.serverApiKey()
    app.middleware.use(SecretMiddleware(apiKey: apiKey))

    try routes(app)
}

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
    app.databases.use(.postgres(
        hostname: try EnvironmentVariable.psqlIP.value(),
        username: try EnvironmentVariable.psqlUsername.value(),
        password: try EnvironmentVariable.psqlPassword.value(),
        database: try EnvironmentVariable.psqlDatabase.value()
    ), as: .psql)

    app.middleware.use(
        SecretMiddleware(apiKey: try EnvironmentVariable.serverApiKey.value())
    )

    try routes(app)
}

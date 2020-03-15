//
//  databases.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2019. 02. 11..
//

import Vapor
import FluentPostgreSQL

public func registerPostgeSQLDatabase(to services: inout Services, environment: Environment) throws {
    let postgresDB = PostgreSQLDatabase(config: try environment.postgreSQLDatabaseConfig())
    services.register(postgresDB)
}

public func registerPostgreSQLProvider(to services: inout Services) throws {
    try services.register(FluentPostgreSQLProvider())
}

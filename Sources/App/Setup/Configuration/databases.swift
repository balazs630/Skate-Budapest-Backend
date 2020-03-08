//
//  databases.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2019. 02. 11..
//

import Vapor
import FluentPostgreSQL

public func registerPostgeSQLDatabase(to services: inout Services, environment: Environment) throws {
    let databaseConnectionConfiguration = environment.isRelease
        ? makeProductionPostgreSQLDatabaseConfig()
        : makeDevelopmentPostgreSQLDatabaseConfig()

    let postgresDB = PostgreSQLDatabase(config: databaseConnectionConfiguration)
    services.register(postgresDB)
}

public func registerPostgreSQLProvider(to services: inout Services) throws {
    try services.register(FluentPostgreSQLProvider())
}

private func makeDevelopmentPostgreSQLDatabaseConfig() -> PostgreSQLDatabaseConfig {
    return PostgreSQLDatabaseConfig(hostname: "localhost",
                                    port: 5432,
                                    username: "user-1269852658",
                                    database: "skate-budapest-1686949761",
                                    password: nil,
                                    transport: .cleartext)
}

private func makeProductionPostgreSQLDatabaseConfig() -> PostgreSQLDatabaseConfig {
    return PostgreSQLDatabaseConfig(hostname: Environment.get("SKTBPST_PSQL_IP")!,
                                    port: Int(Environment.get("SKTBPST_PSQL_PORT")!)!,
                                    username: Environment.get("SKTBPST_PSQL_USERNAME")!,
                                    database: Environment.get("SKTBPST_PSQL_DATABASE")!,
                                    password: Environment.get("SKTBPST_PSQL_PASSWORD")!,
                                    transport: .unverifiedTLS)
}

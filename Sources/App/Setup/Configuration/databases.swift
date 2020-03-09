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
        ? try makeProductionPostgreSQLDatabaseConfig()
        : makeDevelopmentPostgreSQLDatabaseConfig()

    let postgresDB = PostgreSQLDatabase(config: databaseConnectionConfiguration)
    services.register(postgresDB)
}

public func registerPostgreSQLProvider(to services: inout Services) throws {
    try services.register(FluentPostgreSQLProvider())
}

private func makeDevelopmentPostgreSQLDatabaseConfig() -> PostgreSQLDatabaseConfig {
    return PostgreSQLDatabaseConfig(hostname: LocalConstant.psqlHostname,
                                    port: LocalConstant.psqlPort,
                                    username: LocalConstant.psqlUsername,
                                    database: LocalConstant.psqlDatabase,
                                    password: LocalConstant.psqlPassword,
                                    transport: .cleartext)
}

private func makeProductionPostgreSQLDatabaseConfig() throws -> PostgreSQLDatabaseConfig {
    return PostgreSQLDatabaseConfig(hostname: try EnvironmentVariable.psqlIP.value(),
                                    port: try EnvironmentVariable.psqlPort.value(),
                                    username: try EnvironmentVariable.psqlUsername.value(),
                                    database: try EnvironmentVariable.psqlDatabase.value(),
                                    password: try EnvironmentVariable.psqlPassword.value(),
                                    transport: .unverifiedTLS)
}

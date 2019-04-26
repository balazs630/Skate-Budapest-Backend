//
//  databases.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2019. 02. 11..
//

import Vapor
import FluentPostgreSQL

private var developmentPostgreSQLDatabaseConfig: PostgreSQLDatabaseConfig {
    return PostgreSQLDatabaseConfig(hostname: "localhost",
                                    port: 5432,
                                    username: "user-1269852658",
                                    database: "skate-budapest-1686949761",
                                    password: nil, //1cFUJaj3Q5kirSOjFwvaAKPC
                                    transport: .cleartext)
}

private var productionPostgreSQLDatabaseConfig: PostgreSQLDatabaseConfig {
    return PostgreSQLDatabaseConfig(hostname: Environment.get("SKTBPST_PSQL_IP")!,
                                    port: Int(Environment.get("SKTBPST_PSQL_PORT")!)!,
                                    username: Environment.get("SKTBPST_PSQL_USERNAME")!,
                                    database: Environment.get("SKTBPST_PSQL_DATABASE")!,
                                    password: Environment.get("SKTBPST_PSQL_PASSWORD")!,
                                    transport: .unverifiedTLS)
}

public func registerPostgeSQLDatabase(to services: inout Services) throws {
    let postgresDB = PostgreSQLDatabase(config: productionPostgreSQLDatabaseConfig)
    services.register(postgresDB)
}

public func registerPostgreSQLProvider(to services: inout Services) throws {
    try services.register(FluentPostgreSQLProvider())
}

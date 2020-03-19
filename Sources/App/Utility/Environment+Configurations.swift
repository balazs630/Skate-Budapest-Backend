//
//  EnvironmentExtensions.swift
//  App
//
//  Created by Horváth Balázs on 2020. 03. 15..
//

import Vapor
import FluentPostgreSQL

// MARK: Retrieve configuration for environment
extension Environment {
    func postgreSQLDatabaseConfig() throws -> PostgreSQLDatabaseConfig {
        switch self {
        case .development:
            return makeDevelopmentPostgreSQLDatabaseConfig()
        case .testing:
            return makeTestingPostgreSQLDatabaseConfig()
        case .production:
            return try makeProductionPostgreSQLDatabaseConfig()
        default:
            throw Abort(.internalServerError, reason: "No Database configuration found for \(self) environment!")
        }
    }

    func serverApiKey() throws -> String {
        switch self {
        case .development:
            return LocalConstant.Development.serverApiKey
        case .testing:
            return LocalConstant.Testing.serverApiKey
        case .production:
            return try EnvironmentVariable.serverApiKey.value()
        default:
            throw Abort(.internalServerError, reason: "No Api-Key found for \(self) environment!")
        }
    }
}

// MARK: Factory utility methods
extension Environment {
    private func makeDevelopmentPostgreSQLDatabaseConfig() -> PostgreSQLDatabaseConfig {
        return PostgreSQLDatabaseConfig(hostname: LocalConstant.Development.psqlIP,
                                        port: LocalConstant.Development.psqlPort,
                                        username: LocalConstant.Development.psqlUsername,
                                        database: LocalConstant.Development.psqlDatabase,
                                        password: LocalConstant.Development.psqlPassword,
                                        transport: .cleartext)
    }

    private func makeTestingPostgreSQLDatabaseConfig() -> PostgreSQLDatabaseConfig {
        return PostgreSQLDatabaseConfig(hostname: LocalConstant.Testing.psqlIP,
                                        port: LocalConstant.Testing.psqlPort,
                                        username: LocalConstant.Testing.psqlUsername,
                                        database: LocalConstant.Testing.psqlDatabase,
                                        password: LocalConstant.Testing.psqlPassword,
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
}


//
//  EnvironmentExtensions.swift
//  App
//
//  Created by Horváth Balázs on 2020. 03. 15..
//

import Vapor
import Fluent

// MARK: Retrieve configuration for environment
extension Environment {
    func postgreSQLDatabaseConfig() throws -> DatabaseConfigurationFactory {
        switch self {
        case .development:
            return makeDevelopmentPostgresDatabaseConfig()
        case .testing:
            return makeTestingPostgresDatabaseConfig()
        case .production:
            return try makeProductionPostgresDatabaseConfig()
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
    private func makeDevelopmentPostgresDatabaseConfig() -> DatabaseConfigurationFactory {
        return .postgres(
            hostname: LocalConstant.Development.psqlIP,
            username: LocalConstant.Development.psqlUsername,
            password: LocalConstant.Development.psqlPassword,
            database: LocalConstant.Development.psqlDatabase
        )
    }

    private func makeTestingPostgresDatabaseConfig() -> DatabaseConfigurationFactory {
        return .postgres(
            hostname: LocalConstant.Testing.psqlIP,
            username: LocalConstant.Testing.psqlUsername,
            password: LocalConstant.Testing.psqlPassword,
            database: LocalConstant.Testing.psqlDatabase
        )
    }

    private func makeProductionPostgresDatabaseConfig() throws -> DatabaseConfigurationFactory {
        return .postgres(
            hostname: try EnvironmentVariable.psqlIP.value(),
            username: try EnvironmentVariable.psqlUsername.value(),
            password: try EnvironmentVariable.psqlPassword.value(),
            database: try EnvironmentVariable.psqlDatabase.value()
        )
    }
}

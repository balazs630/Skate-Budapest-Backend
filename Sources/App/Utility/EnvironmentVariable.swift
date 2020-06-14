//
//  EnvironmentVariable.swift
//  App
//
//  Created by Horváth Balázs on 2020. 03. 08..
//

import Vapor

enum EnvironmentVariable: String {
    case serverApiKey = "SKTBPST_SERVER_API_KEY"

    case mailGunApiKey = "SKTBPST_MAILGUN_API_KEY"
    case mailGunDomain = "SKTBPST_MAILGUN_DOMAIN"

    case psqlIP = "SKTBPST_PSQL_IP"
    case psqlDatabase = "SKTBPST_PSQL_DATABASE"
    case psqlUsername = "SKTBPST_PSQL_USERNAME"
    case psqlPassword = "SKTBPST_PSQL_PASSWORD"
}

// MARK: Utility, reading environment variables
extension EnvironmentVariable {
    func value() throws -> Int {
        guard let value = Int(try value()) else {
            throw Abort(.internalServerError, reason: "Environment variable: \(rawValue) cannot be parsed to Int type")
        }

        return value
    }

    func value() throws -> String {
        guard let value = Environment.get(rawValue) else {
            throw Abort(.internalServerError, reason: "Environment variable cannot be found for key: \(rawValue)")
        }

        return value
    }
}

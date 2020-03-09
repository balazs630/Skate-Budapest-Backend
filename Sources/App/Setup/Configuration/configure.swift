//
//  configure.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

import Vapor

public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
    try registerEngineRouter(to: &services)
    registerMiddlewares(to: &services)

    try registerPostgreSQLProvider(to: &services)
    try registerPostgeSQLDatabase(to: &services, environment: env)
    setupRepositories(services: &services, config: &config)

    services.register(NIOServerConfig.default(maxBodySize: 20_000_000))
}

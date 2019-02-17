//
//  middlewares.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2019. 02. 11..
//

import Vapor

public func registerMiddlewares(to services: inout Services) throws {
    var middlewaresConfig = MiddlewareConfig()
    try middlewares(config: &middlewaresConfig)
    services.register(middlewaresConfig)
}

private func middlewares(config: inout MiddlewareConfig) throws {
    // Serves files from `Public/` directory
    config.use(FileMiddleware.self)

    // Catches errors and converts to HTTP response
    config.use(ErrorMiddleware.self)
}

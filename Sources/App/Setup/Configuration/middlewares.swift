//
//  middlewares.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2019. 02. 11..
//

import Vapor

public func registerMiddlewares(to services: inout Services) {
    services.register(MiddlewareConfig.default())
    services.register(SecretMiddleware.self)
}

//
//  SecretMiddleware.swift
//  App
//
//  Created by Horváth Balázs on 2020. 03. 08..
//

import Vapor

final class SecretMiddleware {
    // MARK: Properties
    private let apiKey: String

    // MARK: Initializers
    init(apiKey: String) {
        self.apiKey = apiKey
    }
}

// MARK: Middleware methods
extension SecretMiddleware: Middleware {
    func respond(to request: Request, chainingTo next: Responder) -> EventLoopFuture<Response> {
        guard let requestedApiKey = request.headers.first(name: "Api-Key") else {
            return request.eventLoop.makeFailedFuture(
                Abort(.forbidden, reason: "Your request did not include an API-Key!")
            )
        }

        guard apiKey == requestedApiKey else {
            return request.eventLoop.makeFailedFuture(
                Abort(.forbidden, reason: "Invalid Api-Key!")
            )
        }

        return next.respond(to: request)
    }
}

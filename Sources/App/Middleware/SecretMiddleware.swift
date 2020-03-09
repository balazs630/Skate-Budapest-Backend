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

// MARK: ServiceType methods
extension SecretMiddleware: ServiceType {
    static func makeService(for worker: Container) throws -> SecretMiddleware {
        let apiKey = worker.environment.isRelease
            ? try EnvironmentVariable.serverProdApiKey.value()
            : LocalConstant.serverDevApiKey

        return SecretMiddleware(apiKey: apiKey)
    }
}

// MARK: Middleware methods
extension SecretMiddleware: Middleware {
    func respond(to request: Request, chainingTo next: Responder) throws -> Future<Response> {
        guard let requestedApiKey = request.http.headers.firstValue(name: HTTPHeaderName("Api-Key")) else {
            throw Abort(.forbidden, reason: "Your request did not include an API-Key!")
        }

        guard apiKey == requestedApiKey else {
            throw Abort(.forbidden, reason: "Invalid Api-Key!")
        }

        return try next.respond(to: request)
    }
}

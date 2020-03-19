//
//  Application+Testable.swift
//  AppTests
//
//  Created by Horváth Balázs on 2020. 03. 16..
//

// Source: Server Side Swift with Vapor: https://store.raywenderlich.com/products/server-side-swift-with-vapor

import App
import Vapor

struct EmptyContent: Content { }

// MARK: Setup Application for Testing
extension Application {
    static func testable(environmentArguments: [String]? = nil) throws -> Application {
        var config = Config.default()
        var services = Services.default()
        var environment = Environment.testing

        if let arguments = environmentArguments {
            environment.arguments = arguments
        }

        try App.configure(&config, &environment, &services)
        let app = try Application(config: config,
                                  environment: environment,
                                  services: services)
        try App.boot(app)

        return app
    }
}

// MARK: Processing Request
extension Application {
    func sendRequest<T>(to path: String, method: HTTPMethod, headers: HTTPHeaders = .init(), body: T? = nil) throws -> Response where T: Content {
        let responder = try make(Responder.self)
        let request = HTTPRequest(method: method,
                                  url: URL(string: path)!,
                                  headers: headers)
        let wrappedRequest = Request(http: request, using: self)

        if let body = body {
            try wrappedRequest.content.encode(body)
        }

        return try responder.respond(to: wrappedRequest).wait()
    }

    func sendRequest(to path: String, method: HTTPMethod, headers: HTTPHeaders = .init()) throws -> Response {
      let emptyContent: EmptyContent? = nil

      return try sendRequest(to: path,
                             method: method,
                             headers: headers,
                             body: emptyContent)
    }

    func sendRequest<T>(to path: String, method: HTTPMethod, headers: HTTPHeaders, data: T) throws where T: Content {
        _ = try self.sendRequest(to: path,
                                 method: method,
                                 headers: headers,
                                 body: data)
    }
}

// MARK: Processing Response
extension Application {
    func getResponse<C, T>(to path: String, method: HTTPMethod, headers: HTTPHeaders = .init(), data: C? = nil, decodeTo type: T.Type) throws -> T where C: Content, T: Decodable {
        let response = try sendRequest(to: path,
                                       method: method,
                                       headers: headers,
                                       body: data)

        return try response.content.decode(type).wait()
    }

    func getResponse<T>(to path: String, method: HTTPMethod, headers: HTTPHeaders = .init(), decodeTo type: T.Type) throws -> T where T: Decodable {
        let emptyContent: EmptyContent? = nil

        return try self.getResponse(to: path,
                                    method: method,
                                    headers: headers,
                                    data: emptyContent,
                                    decodeTo: type)
    }
}

//
//  routes.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

import Vapor

public func registerEngineRouter(to services: inout Services) throws {
    services.register(Router.self) { container -> EngineRouter in
        let router = EngineRouter.default()

        let placeController = try makePlaceController(using: container)
        try router.register(collection: placeController)
        return router
    }
}

private func makePlaceController(using container: Container) throws -> RouteCollection {
    let placeRepository = SQLitePlaceRepository(try container.connectionPool(to: .sqlite))
    let placeService = PlaceService(placeRepository: placeRepository)
    let placeController = PlaceController(placeService: placeService)

    return placeController
}

//
//  routes.swift
//  App
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.routes.defaultMaxBodySize = "20mb"

    let placeController = makePlaceController(using: app.db)
    try app.register(collection: placeController)
}

private func makePlaceController(using database: Database) -> RouteCollection {
    let placeRepository = PlaceRepository(database: database)
    let placeService = PlaceService(emailService: MailGunService(), placeRepository: placeRepository)
    let placeController = PlaceController(placeService: placeService)

    return placeController
}

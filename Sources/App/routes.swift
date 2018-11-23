//
//  routes.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

import Vapor

fileprivate enum Slug {
    static let apiVersionPath = "v1"
    static let waypointPath = "waypoint"
    static let infoPath = "\(waypointPath)/info"
    static let listPath = "\(waypointPath)/list"
}

public func routes(_ router: Router) throws {
    // MARK: Properties
    let placeController = PlaceController()

    // MARK: Configure routes
    router.group(Slug.apiVersionPath) { apiVersionPath in
        apiVersionPath.get(Slug.infoPath, use: placeController.getWaypointInfo)
        apiVersionPath.get(Slug.listPath, use: placeController.getWaypoints)
    }
}

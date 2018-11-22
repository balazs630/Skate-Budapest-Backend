//
//  PlaceController.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

import Vapor

final class PlaceController {
    // MARK: Properties
    let placeService: PlaceServiceInterface

    // MARK: Initializers
    init() {
        placeService = PlaceService()
    }
}

// MARK: Controller tasks
extension PlaceController {
    func getWaypointInfo(_ req: Request) -> WaypointInfo {
        return placeService.getWaypointInfo()
    }

    func getWaypoints(_ req: Request) -> [Waypoint] {
        return placeService.getWaypoints()
    }
}

//
//  PlaceService.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

final class PlaceService: PlaceServiceInterface {
    func getWaypointInfo() -> WaypointInfo {
        return WaypointInfo(dataVersion: Data.waypointDataVersion)
    }

    func getWaypoints() -> [Waypoint] {
        return Data.waypoints
    }
}

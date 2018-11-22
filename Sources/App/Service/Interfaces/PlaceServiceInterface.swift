//
//  PlaceServiceInterface.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

protocol PlaceServiceInterface {
    func getWaypointInfo() -> WaypointInfo
    func getWaypoints() -> [Waypoint]
}

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
    func getPlaceDataInfo(_ req: Request) -> PlaceDataInfo {
        return placeService.getPlaceDataInfo()
    }

    func getPlaces(_ req: Request) -> [Place] {
        return placeService.getPlaces()
    }
}

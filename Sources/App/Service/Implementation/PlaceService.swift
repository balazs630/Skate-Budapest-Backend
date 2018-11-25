//
//  PlaceService.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

final class PlaceService: PlaceServiceInterface {
    func getPlaceDataInfo() -> PlaceDataInfo {
        return PlaceDataInfo(dataVersion: Data.placesDataVersion)
    }

    func getPlaces() -> [Place] {
        return Data.places
    }
}

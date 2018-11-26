//
//  PlaceService.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

final class PlaceService: PlaceServiceInterface {
    // MARK: Properties
    let placeRepository: PlaceRepositoryInterface

    // MARK: Initializers
    init() {
        placeRepository = PlaceRepository()
    }
}

// MARK: PlaceServiceInterface conformances
extension PlaceService {
    func getPlaceDataInfo() -> PlaceDataInfo {
        return placeRepository.findPlaceDataInfo()
    }

    func getPlaces() -> [Place] {
        return placeRepository.findPlaces()
    }
}

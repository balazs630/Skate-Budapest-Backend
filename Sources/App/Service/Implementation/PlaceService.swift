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
    func getPlaceInfo() -> PlaceInfoDTO {
        return placeRepository.findPlaceInfo()
    }

    func getPlaces() -> [PlaceDTO] {
        return placeRepository.findPlaces()
    }
}

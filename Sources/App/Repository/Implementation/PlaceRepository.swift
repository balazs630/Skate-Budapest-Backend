//
//  PlaceRepository.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 26..
//

final class PlaceRepository: PlaceRepositoryInterface {
    func findPlaceInfo() -> PlaceInfoDTO {
        return Data.placeDataVersion
    }

    func findPlaces() -> [PlaceDTO] {
        return Data.places
    }
}

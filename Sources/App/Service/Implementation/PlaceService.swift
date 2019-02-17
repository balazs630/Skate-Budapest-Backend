//
//  PlaceService.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

import Vapor
import FluentSQLite

final class PlaceService {
    private let placeRepository: PlaceRepositoryInterface

    init(placeRepository: PlaceRepositoryInterface) {
        self.placeRepository = placeRepository
    }
}

// MARK: PlaceServiceInterface conformances
extension PlaceService: PlaceServiceInterface {
    func getPlaces() -> Future<[PlaceRequestDTO]> {
        return placeRepository.findAllPlaces()
    }

    func getPlaceInfo() -> Future<PlaceInfoRequestDTO> {
        return placeRepository.findPlaceInfo()
    }
}

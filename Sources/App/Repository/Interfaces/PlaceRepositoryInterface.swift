//
//  PlaceRepositoryInterface.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 26..
//

import Vapor

protocol PlaceRepositoryInterface {
    func findAllPlaces() -> Future<[PlaceRequestDTO]>
    func findPlaceInfo() -> Future<PlaceInfoRequestDTO>
}

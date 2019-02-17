//
//  PlaceServiceInterface.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

import Vapor

protocol PlaceServiceInterface {
    func getPlaces() -> Future<[PlaceRequestDTO]>
    func getPlaceInfo() -> Future<PlaceInfoRequestDTO>
}

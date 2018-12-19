//
//  PlaceRepositoryInterface.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 26..
//

protocol PlaceRepositoryInterface {
    func findPlaceInfo() -> PlaceInfoDTO
    func findPlaces() -> [PlaceDTO]
}

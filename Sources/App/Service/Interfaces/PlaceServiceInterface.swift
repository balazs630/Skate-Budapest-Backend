//
//  PlaceServiceInterface.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

protocol PlaceServiceInterface {
    func getPlaceInfo() -> PlaceInfoDTO
    func getPlaces() -> [PlaceDTO]
}

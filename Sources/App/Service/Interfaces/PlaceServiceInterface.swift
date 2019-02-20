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
    func getPlaceSuggestions() -> Future<[PlaceSuggestionRequestDTO]>
    func postPlaceSuggestion(suggestion: PlaceSuggestionRequestDTO) -> Future<HTTPStatus>
}

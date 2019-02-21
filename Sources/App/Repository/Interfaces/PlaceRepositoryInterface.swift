//
//  PlaceRepositoryInterface.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 26..
//

import Vapor

protocol PlaceRepositoryInterface {
    func findAllPlaces() -> Future<[(Place, [PlaceImage])]>
    func findPlaceInfo() -> Future<PlaceInfo?>
    func findPlaceSuggestions() -> Future<[PlaceSuggestion]>
    func savePlaceSuggestion(suggestion: PlaceSuggestion) -> Future<PlaceSuggestion>
}

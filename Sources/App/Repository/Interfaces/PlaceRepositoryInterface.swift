//
//  PlaceRepositoryInterface.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 26..
//

import Vapor

protocol PlaceRepositoryInterface {
    func findAllPlaces(status: PlaceStatus) -> Future<([Place], [PlaceImage])>
    func findPlaceDataVersion() -> Future<PlaceDataVersion?>
    func findPlaceSuggestions(status: PlaceSuggestionStatus) -> Future<[PlaceSuggestion]>
    func savePlaceSuggestion(suggestion: PlaceSuggestion) -> Future<PlaceSuggestion>
    func clearPlaceSuggestion() -> Future<Void>
}

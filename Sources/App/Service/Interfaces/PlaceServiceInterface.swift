//
//  PlaceServiceInterface.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

import Vapor

protocol PlaceServiceInterface {
    func getPlaces(for languageCode: LanguageCode, status: PlaceStatus) -> Future<[PlaceResponseDTO]>
    func getPlaceDataVersion() -> Future<PlaceDataVersionResponseDTO>
    func getPlaceSuggestions(status: PlaceSuggestionStatus) -> Future<[PlaceSuggestionResponseDTO]>
    func postPlaceSuggestion(suggestion: PlaceSuggestionRequestDTO) -> Future<HTTPResponse>
    func clearPlaceSuggestions() -> Future<HTTPResponse>
}

//
//  PlaceServiceInterface.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

import Vapor

protocol PlaceServiceInterface {
    func getPlaces(for languageCode: LanguageCode) -> Future<[PlaceResponseDTO]>
    func getPlaceInfo() -> Future<PlaceInfoResponseDTO>
    func getPlaceSuggestions() -> Future<[PlaceSuggestionResponseDTO]>
    func postPlaceSuggestion(suggestion: PlaceSuggestionRequestDTO) -> Future<HTTPStatus>
}

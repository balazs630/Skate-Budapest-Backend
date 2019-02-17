//
//  PlaceController.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

import Vapor
import FluentSQLite

fileprivate enum Slug {
    static let apiVersionPath = "v1"
    static let placesPath = "places"
    static let placeInfoPath = "\(placesPath)/info"
}

final class PlaceController {
    private let placeService: PlaceServiceInterface

    init(placeService: PlaceServiceInterface) {
        self.placeService = placeService
    }
}

// MARK: Routes definitions
extension PlaceController: RouteCollection {
    func boot(router: Router) throws {
        router.group(Slug.apiVersionPath) { apiVersionPath in
            apiVersionPath.get(Slug.placesPath, use: getPlaces)
            apiVersionPath.get(Slug.placeInfoPath, use: getPlaceInfo)
        }
    }
}

// MARK: Routes action
extension PlaceController {
    func getPlaces(req: Request) -> Future<[PlaceRequestDTO]> {
        return placeService.getPlaces()
    }

    func getPlaceInfo(req: Request) -> Future<PlaceInfoRequestDTO> {
        return placeService.getPlaceInfo()
    }
}

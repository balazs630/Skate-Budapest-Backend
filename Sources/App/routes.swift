//
//  routes.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

import Vapor

fileprivate enum Slug {
    static let apiVersionPath = "v1"
    static let placeUrl = "place"
}

public func routes(_ router: Router) throws {
    // MARK: Properties
    let placeController = PlaceController()

    // MARK: Configure routes
    router.group(Slug.apiVersionPath) { versionPath in
        versionPath.get(Slug.placeUrl, use: placeController.getPlace)
    }
}

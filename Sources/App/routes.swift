//
//  routes.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

import Vapor

public func routes(_ router: Router) throws {
    let placeController = PlaceController()
    router.get("place", use: placeController.example)
}

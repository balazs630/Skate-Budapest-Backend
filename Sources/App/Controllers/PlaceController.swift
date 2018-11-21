//
//  PlaceController.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

import Vapor

final class PlaceController {
    func example(_ req: Request) throws -> Place {
        return Place(id: 1, title: "title")
    }
}

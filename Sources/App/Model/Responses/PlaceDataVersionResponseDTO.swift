//
//  PlaceDataVersionResponseDTO.swift
//  App
//
//  Created by Horváth Balázs on 2019. 02. 17..
//

import Vapor

struct PlaceDataVersionResponseDTO: Content {
    let dataVersion: Date

    init(dataVersion: Date) {
        self.dataVersion = dataVersion
    }
}

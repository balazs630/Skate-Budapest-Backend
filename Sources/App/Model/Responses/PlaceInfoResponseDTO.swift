//
//  PlaceInfoResponseDTO.swift
//  App
//
//  Created by Horváth Balázs on 2019. 02. 17..
//

import Vapor

struct PlaceInfoResponseDTO: Content {
    let dataVersion: String

    init(dataVersion: String) {
        self.dataVersion = dataVersion
    }
}

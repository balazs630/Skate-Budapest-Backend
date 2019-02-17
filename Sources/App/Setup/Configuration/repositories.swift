//
//  repositories.swift
//  App
//
//  Created by Horváth Balázs on 2019. 02. 12..
//

import Vapor

public func setupRepositories(services: inout Services, config: inout Config) {
    services.register(SQLitePlaceRepository.self)
    config.prefer(SQLitePlaceRepository.self, for: PlaceRepositoryInterface.self)
}

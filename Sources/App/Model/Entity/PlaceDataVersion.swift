//
//  PlaceDataVersion.swift
//  App
//
//  Created by Horváth Balázs on 2018. 11. 23..
//

import Fluent
import Vapor

final class PlaceDataVersion: Model {
    static let schema = String(describing: PlaceDataVersion.self)

    // MARK: Fields
    @ID() var id: UUID?
    @Field(key: "dataVersion") var dataVersion: Date

    // MARK: Initializers
    init() { }

    init(id: UUID? = nil,
         dataVersion: Date) {
        self.id = id
        self.dataVersion = dataVersion
    }
}

//
//  Place.swift
//  App
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

import Fluent
import Vapor

final class Place: Model {
    static let schema = String(describing: Place.self)

    // MARK: Fields
    @ID() var id: UUID?
    @Field(key: "latitude") var latitude: Double
    @Field(key: "longitude") var longitude: Double
    @Field(key: "nameHU") var nameHU: String
    @Field(key: "nameEN") var nameEN: String
    @Field(key: "infoHU") var infoHU: String
    @Field(key: "infoEN") var infoEN: String
    @Field(key: "type") var type: String
    @Field(key: "status") var status: PlaceStatus
    @Field(key: "thumbnailUrl") var thumbnailUrl: String?

    // MARK: Initializers
    init() { }

    init(id: UUID? = nil,
         latitude: Double,
         longitude: Double,
         nameHU: String,
         nameEN: String,
         infoHU: String,
         infoEN: String,
         type: String,
         status: PlaceStatus,
         thumbnailUrl: String?) {
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.nameHU = nameHU
        self.nameEN = nameEN
        self.infoHU = infoHU
        self.infoEN = infoEN
        self.type = type
        self.status = status
        self.thumbnailUrl = thumbnailUrl
    }
}

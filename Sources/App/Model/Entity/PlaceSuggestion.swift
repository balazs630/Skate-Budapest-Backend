//
//  PlaceSuggestion.swift
//  App
//
//  Created by Horváth Balázs on 2019. 02. 19..
//

import Fluent
import Vapor

final class PlaceSuggestion: Model {
    static let schema = String(describing: PlaceSuggestion.self)

    // MARK: Fields
    @ID() var id: UUID?
    @Field(key: "latitude") var latitude: Double
    @Field(key: "longitude") var longitude: Double
    @Field(key: "name") var name: String
    @Field(key: "info") var info: String
    @Field(key: "type") var type: String
    @Field(key: "senderEmail") var senderEmail: String
    @Field(key: "image1") var image1: Data
    @Field(key: "image2") var image2: Data
    @OptionalField(key: "image3") var image3: Data?
    @OptionalField(key: "image4") var image4: Data?
    @Field(key: "status") var status: PlaceSuggestionStatus

    // MARK: Initializers
    init() { }

    init(id: UUID? = UUID(),
         latitude: Double,
         longitude: Double,
         name: String,
         info: String,
         type: String,
         senderEmail: String,
         image1: Data,
         image2: Data,
         image3: Data?,
         image4: Data?,
         status: PlaceSuggestionStatus = .active) {
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.name = name
        self.info = info
        self.type = type
        self.senderEmail = senderEmail
        self.image1 = image1
        self.image2 = image2
        self.image3 = image3
        self.image4 = image4
        self.status = status
    }
}

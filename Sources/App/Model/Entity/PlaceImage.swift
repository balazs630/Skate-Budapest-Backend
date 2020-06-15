//
//  PlaceImage.swift
//  App
//
//  Created by Horváth Balázs on 2019. 02. 16..
//

import Fluent
import Vapor

final class PlaceImage: Model {
    static let schema = String(describing: PlaceImage.self)

    // MARK: Fields
    @ID() var id: UUID?
    @Parent(key: "placeId") var place: Place
    @Field(key: "imageUrl") var imageUrl: String

    // MARK: Initializers
    init() { }

    init(id: UUID? = nil,
         placeId: UUID,
         imageUrl: String) {
        self.id = id
        self.$place.id = placeId
        self.imageUrl = imageUrl
    }
}

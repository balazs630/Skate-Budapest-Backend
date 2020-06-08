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
    @Field(key: "imageUrl") var imageUrl: String

    // MARK: Initializers
    init() { }

    init(id: UUID? = nil,
         imageUrl: String) {
        self.id = id
        self.imageUrl = imageUrl
    }
}

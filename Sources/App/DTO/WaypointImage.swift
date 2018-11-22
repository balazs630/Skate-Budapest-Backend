//
//  WaypointImage.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 22..
//

import Vapor

final class WaypointImage: Content {
    var imageUrl: String
    var imageSizeClass: ImageSizeClassType

    init(imageUrl: String, imageSizeClass: ImageSizeClassType) {
        self.imageUrl = imageUrl
        self.imageSizeClass = imageSizeClass
    }
}

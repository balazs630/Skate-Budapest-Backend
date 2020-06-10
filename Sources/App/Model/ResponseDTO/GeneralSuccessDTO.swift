//
//  GeneralSuccessDTO.swift
//  App
//
//  Created by Horváth Balázs on 2019. 04. 13..
//

import Vapor

struct GeneralSuccessDTO: Content {
    let status: HTTPResponseStatus
    let message: String
}

//
//  GeneralErrorDTO.swift
//  App
//
//  Created by Horváth Balázs on 2019. 04. 13..
//

import Vapor

struct GeneralErrorDTO: Encodable {
    let errorCode: Int
    let level: String
    let messages: [GeneralErrorMessageDTO]
}

struct GeneralErrorMessageDTO: Encodable {
    let label: String
    let message: String
}

extension GeneralErrorDTO: LosslessHTTPBodyRepresentable {
    func convertToHTTPBody() -> HTTPBody {
        let jsonData = try! JSONEncoder().encode(self)
        return HTTPBody(data: jsonData)
    }
}

//
//  GeneralSuccessDTO.swift
//  App
//
//  Created by Horváth Balázs on 2019. 04. 13..
//

import Vapor

struct GeneralSuccessDTO: Encodable {
    let message: String
}

extension GeneralSuccessDTO: LosslessHTTPBodyRepresentable {
    func convertToHTTPBody() -> HTTPBody {
        let jsonData = try! JSONEncoder().encode(self)
        return HTTPBody(data: jsonData)
    }
}

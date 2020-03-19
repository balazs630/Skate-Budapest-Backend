//
//  GeneralErrorDTO.swift
//  App
//
//  Created by Horváth Balázs on 2019. 04. 13..
//

struct GeneralErrorDTO: Decodable {
    let error: Bool
    let reason: String
}

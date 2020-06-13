//
//  MailGunSuccessDTO.swift
//  App
//
//  Created by Horváth Balázs on 2020. 06. 13..
//

import Vapor

struct MailGunSuccessDTO: Content {
    let id: String
    let message: String
}

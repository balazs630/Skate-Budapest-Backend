//
//  EmailMessageRequestDTO.swift
//  App
//
//  Created by Horváth Balázs on 2019. 06. 02..
//

import Vapor

struct EmailMessageRequestDTO: Content {
    let from: String
    let to: String
    let subject: String
    let text: String?
    let html: String?

    init(from: String, to: String, subject: String, text: String? = nil, html: String? = nil) {
        self.from = from
        self.to = to
        self.subject = subject
        self.text = text
        self.html = html
    }
}

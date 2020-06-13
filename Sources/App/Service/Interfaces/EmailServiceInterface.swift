//
//  EmailServiceInterface.swift
//  App
//
//  Created by Horváth Balázs on 2020. 03. 09..
//

import Vapor

protocol EmailServiceInterface {
    func sendEmail(message: EmailMessageRequestDTO, on req: Request) throws
}

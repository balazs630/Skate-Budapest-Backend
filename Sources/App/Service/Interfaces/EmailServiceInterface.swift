//
//  EmailServiceInterface.swift
//  App
//
//  Created by Horváth Balázs on 2020. 03. 09..
//

import Vapor

protocol EmailServiceInterface {
    func sendPlaceSuggestionEmail(on request: Request) throws
    func sendEmail(message: EmailMessageRequestDTO, on req: Request) throws
}

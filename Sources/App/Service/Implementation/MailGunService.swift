//
//  MailGunService.swift
//  App
//
//  Created by Horváth Balázs on 2020. 03. 09..
//

import Vapor

final class MailGunService {
    private let mailgunApiUrl = "https://api.mailgun.net/v3/"
}

// MARK: EmailServiceInterface methods
extension MailGunService: EmailServiceInterface {
    func sendPlaceSuggestionEmail(on request: Request) throws {
        let message = EmailMessageRequestDTO(
            from: "Skate Budapest <info@libertyskate.hu>",
            to: "balazs630@icloud.com",
            subject: "New place suggested",
            html: """
                <html>
                <p>Dear Developer,</p>
                <p>Someone just posted a new place suggestion from Skate Budapest iOS app.</p>
                <p>Go and check it out.</p>
                </html>
            """
        )

        try sendEmail(message: message, on: request)
    }

    func sendEmail(message: EmailMessageRequestDTO, on request: Request) throws {
        guard request.application.environment.isRelease else {
            return
        }

        var headers = HTTPHeaders([])
        let apiKey: String = try EnvironmentVariable.mailGunApiKey.value()
        headers.add(name: .authorization, value: "Basic \(try encode(apiKey))")

        let domain: String = try EnvironmentVariable.mailGunDomain.value()
        let url = URI(string: "\(mailgunApiUrl)\(domain)/messages")

        _ = request.client.post(url, headers: headers) { request in
            try request.content.encode(message, as: .formData)
        }
    }
}

// MARK: Utility
extension MailGunService {
    private func encode(_ apiKey: String) throws -> String {
        guard let apiKeyData = "api:\(apiKey)".data(using: .utf8)?.base64EncodedData() else {
            throw Abort(.internalServerError, reason: "Unable to encode MailGun Api-Key to Base 64 Data!")
        }

        guard let encodedString = String(data: apiKeyData, encoding: .utf8) else {
            throw Abort(.internalServerError, reason: "Unable to encode MailGun Base 64 Api-Key Data to String!")
        }

        return encodedString
    }
}

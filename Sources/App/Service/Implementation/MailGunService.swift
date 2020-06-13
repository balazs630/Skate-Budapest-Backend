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
    func sendEmail(message: EmailMessageRequestDTO, on request: Request) throws {
        guard request.application.environment.isRelease else {
            Logger(label: "custom").info("Skipping e-mail sending when not running in production")
            return
        }

        var headers = HTTPHeaders([])
        let apiKey: String = try EnvironmentVariable.mailGunApiKey.value()
        headers.add(name: .authorization, value: "Basic \(try encode(apiKey))")

        let domain: String = try EnvironmentVariable.mailGunDomain.value()
        let url = URI(string: "\(mailgunApiUrl)\(domain)/messages")

        _ = request.client.post(url, headers: headers) { request in
            try request.content.encode(message, as: .formData)
        }.map { response in
            do {
                let result = try response.content.decode(MailGunSuccessDTO.self)
                Logger(label: "custom").info("POST \(self.mailgunApiUrl), message: \(result.message), id: \(result.id)")
            } catch {
                Logger(label: "custom").info("Failed sending e-mail, status: \(response.status)")
            }
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

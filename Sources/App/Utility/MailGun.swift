//
//  MailGun.swift
//  App
//
//  Created by Horváth Balázs on 2019. 06. 02..
//

import Vapor

class MailGun {
    static func sendEmail(message: MailGunMessageRequestDTO, on req: Request) {
        var headers = HTTPHeaders([])
        let apiKey = Environment.get("SKTBPST_MAILGUN_API_KEY")!
        headers.add(name: .authorization, value: "Basic \(encode(apiKey))")

        let domain = Environment.get("SKTBPST_MAILGUN_DOMAIN")!
        let url = "https://api.mailgun.net/v3/\(domain)/messages"

        do {
            let client = try req.make(Client.self)
            _ = client.post(url, headers: headers) { request in
                try request.content.encode(message, as: .formData)
            }.map { response in
                debugPrint(response)
            }
        } catch {
            debugPrint(error)
        }
    }

    private static func encode(_ apiKey: String) -> String {
        let apiKeyData = "api:\(apiKey)".data(using: .utf8)!.base64EncodedData()
        return String(data: apiKeyData, encoding: .utf8)!
    }
}

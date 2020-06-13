//
//  MailGunEmailTemplateFactory.swift
//  App
//
//  Created by Horváth Balázs on 2020. 06. 13..
//

import Vapor

struct MailGunEmailTemplateFactory {
    // MARK: Properties
    private static let from = "Skate Budapest <info@libertyskate.hu>"
    private static let email = "balazs630@icloud.com"

    // MARK: Factory
    static func makePlaceSuggestionEmail() -> EmailMessageRequestDTO {
        return EmailMessageRequestDTO(
            from: from,
            to: email,
            subject: "New place suggested",
            html: """
                <html>
                <p>Dear Developer,</p>
                <p>Someone just posted a new place suggestion from Skate Budapest iOS app.</p>
                <p>Go and check it out.</p>
                </html>
            """
        )
    }

    static func makePlaceReportEmail() -> EmailMessageRequestDTO {
        return EmailMessageRequestDTO(
            from: from,
            to: email,
            subject: "New place report",
            html: """
                <html>
                <p>Dear Developer,</p>
                <p>Someone just posted a new place report from Skate Budapest iOS app.</p>
                <p>Go and check it out.</p>
                </html>
            """
        )
    }
}

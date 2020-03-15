//
//  LocalConstant.swift
//  App
//
//  Created by Horváth Balázs on 2020. 03. 09..
//

struct LocalConstant {
    struct Development {
        static let serverApiKey = "1da550b6-086d-456a-8968-948228cc07e1"

        static let psqlIP = "localhost"
        static let psqlPort = 5432
        static let psqlDatabase = "skate-budapest-1686949761"
        static let psqlUsername = "user-1269852658"
        static let psqlPassword: String? = nil
    }

    struct Testing {
        static let serverApiKey = "584a4f90-f24f-4ed4-8672-9a64278af060"

        static let psqlIP = "localhost"
        static let psqlPort = 5432
        static let psqlDatabase = "skate-budapest-5626416911"
        static let psqlUsername = "user-5138694849"
        static let psqlPassword: String? = nil
    }
}
